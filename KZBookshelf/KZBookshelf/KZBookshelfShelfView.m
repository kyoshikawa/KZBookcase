//
//	KZBookshelfShelfView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/3.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookshelfShelfView.h"
#import "KZBookshelfView.h"


//
//	@interface KZBookshelfShelfView ()
//

@interface KZBookshelfShelfView ()

@end


//
//	KZBookshelfShelfView
//

@implementation KZBookshelfShelfView


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
	self.image = [self.bookshelffView bottomImageForWidth:CGRectGetWidth(self.bounds)];;
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
