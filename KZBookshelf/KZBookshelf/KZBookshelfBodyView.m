//
//	KZBookshelfBodyView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookshelfBodyView.h"
#import "KZBookshelfView.h"
#import "UIView+Debug.h"


//
//	KZBookshelfBodyView ()
//

@interface KZBookshelfBodyView ()

@end


//
//	KZBookshelfBodyView
//

@implementation KZBookshelfBodyView

+ (NSString *)kind
{
	return NSStringFromClass([self class]);
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if (self = [super initWithCoder:decoder]) {
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.image = [self.bookshelffView bodyImageForWidth:CGRectGetWidth(self.bounds)];;
}

- (void)dealloc
{
	NSLog(@"%s", __FUNCTION__);
}

- (void)prepareForReuse
{
	NSLog(@"%s", __FUNCTION__);
	[super prepareForReuse];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// Drawing code
}
*/

@end
