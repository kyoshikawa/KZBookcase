//
//	KZBookcaseView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookcaseView.h"
#import "KZBookcaseViewLayout.h"
#import "KZBookItemCell.h"
#import "KZBookcaseRowView.h"
#import "KZBookcaseSectionView.h"


//
//	KZBookcaseView ()
//

@interface KZBookcaseView () <UICollectionViewDataSource, UICollectionViewDelegate>
{
	UICollectionView *_collectionView;
	NSString *_baseImageName;
}

@property (readonly) UICollectionView *collectionView;

@end



//
//	KZBookcaseView
//

@implementation KZBookcaseView

- (void)setupBookcaseView
{
	[self.collectionView registerClass:[KZBookItemCell class] forCellWithReuseIdentifier:[KZBookItemCell kind]];
	[self.collectionView registerClass:[KZBookcaseSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[KZBookcaseSectionView kind]];
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if (self = [super initWithCoder:decoder]) {
		[self setupBookcaseView];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self setupBookcaseView];
	}
	return self;
}

- (UICollectionView *)collectionView
{
	if (!_collectionView) {
		KZBookcaseViewLayout *layout = [[KZBookcaseViewLayout alloc] initWithBookcaseView:self];
		_collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
		_collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		_collectionView.backgroundColor = self.backgroundColor;
		_collectionView.dataSource = self;
		_collectionView.delegate = self;
		[self addSubview:_collectionView];
	}
	return _collectionView;
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.backgroundColor = [UIColor clearColor];
	[self.collectionView reloadData];
}

- (void)reloadData;
{
	[self.collectionView reloadData];
}

- (NSString *)baseImageName
{
	return _baseImageName ? _baseImageName : @"Bookcase";
}

- (void)setBaseImageName:(NSString *)baseImageName
{
	_baseImageName = baseImageName;
}

#pragma mark -

- (UIImage *)rowImageForWidth:(CGFloat)width
{
	NSString *name = [NSString stringWithFormat:@"%@-Row-%d", self.baseImageName, (int)width];
	UIImage *image = [UIImage imageNamed:name];
	return image;
}

- (UIImage *)shelfImageForWidth:(CGFloat)width
{
	NSString *name = [NSString stringWithFormat:@"%@-Shelf-%d", self.baseImageName, (int)width];
	UIImage *image = [UIImage imageNamed:name];
	return image;
}

- (UIImage *)sectionImageForWidth:(CGFloat)width
{
	NSString *name = [NSString stringWithFormat:@"%@-Section-%d", self.baseImageName, (int)width];
	UIImage *image = [UIImage imageNamed:name];
	return image;
}

#pragma mark -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return [self.dataSource numberOfSectionsInBookcaseView:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [self.dataSource bookcaseView:self numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	id <KZBookcaseItem> item = [self.dataSource bookcaseView:self bookcaseItemAtIndexPath:indexPath];
	KZBookItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[KZBookItemCell kind] forIndexPath:indexPath];
	cell.coverImage = item.coverImage;
	return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	KZBookcaseSectionView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[KZBookcaseSectionView kind] forIndexPath:indexPath];
	NSString *title = [self.dataSource bookcaseView:self titleForSection:indexPath.section];
	view.textLabel.text = title ;
	return view;
}


#pragma mark -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	[self.delegate bookcaseView:self didSelectAtIndexPath:indexPath];
}


@end
