//
//	KZBookcaseViewLayout.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookcaseViewLayout.h"
#import "KZBookcaseView.h"
#import "KZBookcaseItem.h"
#import "KZBookcaseRowView.h"
#import "KZBookcaseShelfView.h"
#import "KZBookcaseSectionView.h"
#import "KZBookcaseSectionLayoutAttributes.h"
#import "ZGeometricUtils.h"


//
//	constants
//

#define FRAME_KEY			@"frame"
#define ATTRIBUTES_KEY		@"attributes"

enum {
	kDecorationRowIndex,
	kDecorationShelfIndex
};



//
//	KZBookcaseViewLayout ()
//

@interface KZBookcaseViewLayout ()

@property (readonly) KZBookcaseView *bookcaseView;
@property (strong) NSArray *attributes;
@property (strong) NSDictionary *sectionDictionary;
@property (assign) CGFloat rowHeight;
@property (assign) CGFloat shelfHeight;
@property (assign) CGFloat sectionHeight;
@property (assign) CGSize contentSize;
@property (strong) NSDictionary *itemDictionary;
@property (strong) NSDictionary *supplementaryDictionary;
@property (strong) NSDictionary *decorationDictionary;
@property (strong) NSArray *outerAttributes;

@end


//
//	KZBookcaseViewLayout
//

@implementation KZBookcaseViewLayout

- (id)initWithCoder:(NSCoder *)decoder
{
	if (self = [super initWithCoder:decoder]) {
		[self registerClass:[KZBookcaseRowView class] forDecorationViewOfKind:[KZBookcaseRowView kind]];
		[self registerClass:[KZBookcaseShelfView class] forDecorationViewOfKind:[KZBookcaseShelfView kind]];
	}
	return self;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
	attributes.zIndex = 1;
	return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSectionWithIndexPath:(NSIndexPath *)indexPath
{
	KZBookcaseSectionLayoutAttributes *attributes = [KZBookcaseSectionLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:indexPath];
	attributes.zIndex = -1;
	return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForRowWithIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:[KZBookcaseRowView kind] withIndexPath:indexPath];
	attributes.zIndex = -1;
	return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForShelfWithIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:[KZBookcaseShelfView kind] withIndexPath:indexPath];
	attributes.zIndex = -1;
	return attributes;
}

-(void)prepareLayout
{
	[super prepareLayout];

	KZBookcaseView *bookcaseView = (KZBookcaseView *)self.collectionView;

	NSMutableDictionary *sectionDictionary = [NSMutableDictionary dictionary];
	NSMutableDictionary *itemDictionary = [NSMutableDictionary dictionary];
	NSMutableDictionary *supplementaryDictionary = [NSMutableDictionary dictionary];
	NSMutableDictionary *decorationDictionary = [NSMutableDictionary dictionary];

	CGFloat viewWidth = CGRectGetWidth(bookcaseView.bounds);
	CGFloat viewHeight = CGRectGetHeight(bookcaseView.bounds);

	UIImage *rowImage = [bookcaseView rowImageForWidth:CGRectGetWidth(bookcaseView.bounds)];
	UIImage *shelfImage = [bookcaseView shelfImageForWidth:CGRectGetWidth(bookcaseView.bounds)];
	UIImage *sectionImage = [bookcaseView sectionImageForWidth:CGRectGetWidth(bookcaseView.bounds)];
	NSParameterAssert(rowImage);
	NSParameterAssert(shelfImage);

	self.rowHeight = rowImage.size.height;
	self.shelfHeight = shelfImage.size.height;
	self.sectionHeight = sectionImage.size.height;
	CGFloat topMargin = self.rowHeight > 100 ? 24 : 8;
	CGFloat bottomMargin = 8;
	CGFloat sideMargin = 32;
	CGFloat interleaves = 16;

	// values for indexPaths are independent between cellection cell, supplementary view, decoration.  But each indexPath
	// has to be unique among its group. Somehow, kDecorationRowIndex, kDecorationShelfIndex cannot be the section number.
	NSIndexPath *rowIndexPath = [[NSIndexPath indexPathWithIndex:0] indexPathByAddingIndex:kDecorationRowIndex];
	NSIndexPath *shelfIndexPath = [[NSIndexPath indexPathWithIndex:0] indexPathByAddingIndex:kDecorationShelfIndex];
	NSInteger rowCount = 0;
	NSInteger shelfCount = 0;


	CGFloat y = 0;

	NSInteger numberOfSections = self.collectionView.numberOfSections;
	for (NSInteger section = 0 ; section < numberOfSections ; section++ ) {

		CGFloat top = y;
		NSMutableArray *attributesArray = [NSMutableArray array];
		NSMutableArray *itemsInRow = [NSMutableArray array];

		if (sectionImage) {
			NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
			UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForSectionWithIndexPath:indexPath];
			attributes.frame = CGRectMake(0, y, viewWidth, sectionImage.size.height);
			[supplementaryDictionary setObject:attributes forKey:attributes.indexPath];
			[attributesArray addObject:attributes];
			y += self.sectionHeight;
		}
		else {
			NSIndexPath *indexPath = [shelfIndexPath indexPathByAddingIndex:shelfCount++];
			UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForShelfWithIndexPath:indexPath];
			attributes.frame = CGRectMake(0, y, viewWidth, self.rowHeight);
			[decorationDictionary setObject:attributes forKey:indexPath];
			[attributesArray addObject:attributes];
		}

		// walk through all items in section...

		CGFloat x = sideMargin;
		NSInteger numberOfItemsInSection = [self.collectionView numberOfItemsInSection:section];
		for (NSInteger index = 0 ; index < numberOfItemsInSection ; index++) {

			// when book cover image is taller than shelf height, we like to resize the image of the book cover image
			// fit within our shelves.

			NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];
			id <KZBookcaseItem> bookshelfItem = [bookcaseView.dataSource bookcaseView:bookcaseView bookcaseItemAtIndexPath:indexPath];

			UIImage *coverImage = bookshelfItem.coverImage;
			CGRect itemFrame = CGRectMake(x, y, coverImage.size.width, MIN(coverImage.size.height, self.rowHeight - (topMargin + bottomMargin)));
			if (coverImage.size.height > self.rowHeight) {
				itemFrame = CGRectMakeAspectFit_(coverImage.size, itemFrame);
			}

			// if not enough space to place on the same shelf, get ready for the next shelf
			if (x + itemFrame.size.width + sideMargin > viewWidth) {

				// row (backboard)
				NSIndexPath *indexPath1 = [rowIndexPath indexPathByAddingIndex:rowCount++];
				UICollectionViewLayoutAttributes *attributes1 = [self layoutAttributesForRowWithIndexPath:indexPath1];
				attributes1.frame = CGRectMake(0, y, viewWidth, self.rowHeight);
				[decorationDictionary setObject:attributes1 forKey:indexPath1];
				[attributesArray addObject:attributes1];

				// shelf (divider)
				NSIndexPath *indexPath2 = [shelfIndexPath indexPathByAddingIndex:shelfCount++];
				UICollectionViewLayoutAttributes *attributes2 = [self layoutAttributesForShelfWithIndexPath:indexPath2];
				attributes2.frame = CGRectMake(0, y+self.rowHeight, viewWidth, self.shelfHeight);
				[decorationDictionary setObject:attributes2 forKey:indexPath2];
				[attributesArray addObject:attributes2];

				y += (self.rowHeight + self.shelfHeight);
				x = sideMargin;
				itemsInRow = [NSMutableArray array];
				rowCount++;
			}

			CGRect itemRect = CGRectMake(x, y + (self.rowHeight - itemFrame.size.height) - bottomMargin, itemFrame.size.width, itemFrame.size.height);

			// item
			UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForCellWithIndexPath:indexPath];
			attributes.frame = itemRect;
			[itemsInRow addObject:attributes];
			[itemDictionary setObject:attributes forKey:indexPath];
			[attributesArray addObject:attributes];
			x += (itemRect.size.width + interleaves);
		}

		// the last shelf
		if (itemsInRow.count > 0) {

			// row (backboard)
			NSIndexPath *indexPath = [[NSIndexPath indexPathForItem:rowCount inSection:section] indexPathByAddingIndex:0];
			UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForRowWithIndexPath:indexPath];
			attributes.frame = CGRectMake(0, y, viewWidth, self.rowHeight);
			[decorationDictionary setObject:attributes forKey:indexPath];
			[attributesArray addObject:attributes];

			y += self.rowHeight;
			x = sideMargin;
		}

		// for performance, all attributes in the same section are wrapped with section info. Then layoutAttributesForElementsInRect:
		// method does not have to inspect each attributes whose section does not intersect with given rectangle.

		NSMutableDictionary *sectionInfo = [NSMutableDictionary dictionary];
		[sectionInfo setObject:[NSValue valueWithCGRect:CGRectMake(0, top, viewWidth, y - top)] forKey:FRAME_KEY];
		[sectionInfo setObject:attributesArray forKey:ATTRIBUTES_KEY];
		[sectionDictionary setObject:sectionInfo forKey:[NSNumber numberWithInteger:section]];
	}

	NSMutableArray *outerAttributes = [NSMutableArray array];

	// very last shelf (divider) with items on it
	NSIndexPath *indexPath2 = [shelfIndexPath indexPathByAddingIndex:shelfCount++];
	UICollectionViewLayoutAttributes *attributes2 = [self layoutAttributesForShelfWithIndexPath:indexPath2];
	attributes2.frame = CGRectMake(0, y, viewWidth, self.shelfHeight);
	[outerAttributes addObject:attributes2];
	y += self.shelfHeight;

	self.contentSize = CGSizeMake(viewWidth, MAX(viewHeight, y));

	// fill extra rows and shelves to fill the screen if appropriate
	while (y < viewHeight + (self.rowHeight + self.shelfHeight) * 2) {

		NSIndexPath *indexPath1 = [rowIndexPath indexPathByAddingIndex:shelfCount++];
		UICollectionViewLayoutAttributes *attributes1 = [self layoutAttributesForRowWithIndexPath:indexPath1];
		attributes1.frame = CGRectMake(0, y, viewWidth, self.rowHeight);
		[decorationDictionary setObject:attributes1 forKey:indexPath1];
		[outerAttributes addObject:attributes1];

		NSIndexPath *indexPath2 = [shelfIndexPath indexPathByAddingIndex:shelfCount++];
		UICollectionViewLayoutAttributes *attributes2 = [self layoutAttributesForShelfWithIndexPath:indexPath2];
		attributes2.frame = CGRectMake(0, y+self.rowHeight, viewWidth, self.shelfHeight);
		[decorationDictionary setObject:attributes2 forKey:indexPath2];
		[outerAttributes addObject:attributes2];

		y += (self.rowHeight + self.shelfHeight);
	}

	self.itemDictionary = itemDictionary;
	self.supplementaryDictionary = supplementaryDictionary;
	self.decorationDictionary = decorationDictionary;
	self.sectionDictionary = sectionDictionary;

	self.outerAttributes = outerAttributes;
}

-(CGSize)collectionViewContentSize
{
	return self.contentSize;
}

#pragma mark -

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.itemDictionary objectForKey:indexPath];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	return [self.supplementaryDictionary objectForKey:indexPath];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)decorationViewKind atIndexPath:(NSIndexPath *)indexPath
{
	return [self.decorationDictionary objectForKey:indexPath];
}

#pragma mark -

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
	NSMutableArray* layoutAttributes = [NSMutableArray array];

	// We don't have to inspect each attributes' whose section is out of given rectangle.

	for (NSDictionary *sectionInfo in self.sectionDictionary.allValues) {
		NSValue *frameValue = [sectionInfo valueForKey:FRAME_KEY];
		NSArray *attributesArray = [sectionInfo valueForKey:ATTRIBUTES_KEY];
		if (frameValue && CGRectIntersectsRect(rect, frameValue.CGRectValue)) {
			for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
				if (CGRectIntersectsRect(rect, attributes.frame)) {
					[layoutAttributes addObject:attributes];
				}
			}
		}
	}

	// outer attributes

	for (UICollectionViewLayoutAttributes *attributes in self.outerAttributes) {
		if (CGRectIntersectsRect(rect, attributes.frame)) {
			[layoutAttributes addObject:attributes];
		}
	}

	return layoutAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
	CGRect oldBounds = self.collectionView.bounds;
	return (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds));
}

- (KZBookcaseView *)bookcaseView
{
	NSParameterAssert([self.collectionView isKindOfClass:[KZBookcaseView class]]);
	return (KZBookcaseView *)self.collectionView;
}

@end
