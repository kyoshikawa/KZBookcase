//
//	KZBookshelfItemCell.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookshelfItemCell.h"


//
//	KZBookshelfItemCell ()
//

@interface KZBookshelfItemCell ()
{
	UIImage *_image;
	UIImageView *_imageView;
}
@end


//
//	KZBookshelfItemCell
//

@implementation KZBookshelfItemCell

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

- (UIImageView *)imageView
{
	if (!_imageView) {
		_imageView = [[UIImageView alloc] initWithFrame:self.bounds];
		_imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		[self addSubview:_imageView];
	}
	return _imageView;
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.layer.shadowColor = [UIColor blackColor].CGColor;
	self.layer.shadowOffset = CGSizeMake(2, -2);
	self.layer.shadowOpacity = 0.5;
	self.layer.shadowRadius = 3.0f;

	self.imageView.image = _image;
}

#pragma mark -

- (UIImage *)image
{
	return _image;
}

- (void)setImage:(UIImage *)image
{
	_image = image;
	self.imageView.image = image;
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
