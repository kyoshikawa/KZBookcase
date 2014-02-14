//
//	KZBookshelfView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookshelfView.h"
#import "KZBookshelfViewLayout.h"
#import "KZBookshelfItemCell.h"
#import "KZBookshelfBodyView.h"
#import "KZBookshelfSectionView.h"


//
//	KZBookshelfView ()
//

@interface KZBookshelfView ()
{
	NSString *_baseImageName;
}

@property (readonly) UICollectionView *collectionView;

@end



//
//	KZBookshelfView
//

@implementation KZBookshelfView

- (void)setupBookshelfView
{
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if (self = [super initWithCoder:decoder]) {
		[self setupBookshelfView];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self setupBookshelfView];
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
	return _baseImageName ? _baseImageName : @"Bookshelf";
}

- (void)setBaseImageName:(NSString *)baseImageName
{
	_baseImageName = baseImageName;
}

#pragma mark -

- (UIImage *)bodyImageForWidth:(CGFloat)width
{
	NSString *name = [NSString stringWithFormat:@"%@-Body-%d", self.baseImageName, (int)width];
	UIImage *image = [UIImage imageNamed:name];
	return image;
}

- (UIImage *)bottomImageForWidth:(CGFloat)width
{
	NSString *name = [NSString stringWithFormat:@"%@-Bottom-%d", self.baseImageName, (int)width];
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
