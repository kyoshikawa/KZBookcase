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

@interface KZBookcaseView ()
{
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

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.backgroundColor = [UIColor clearColor];
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



@end
