//
//	KZBookshelfReusableView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/3.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookshelfReusableView.h"
#import "KZBookshelfView.h"


//
//	KZBookshelfReusableView ()
//

@interface KZBookshelfReusableView ()
{
	UIImage *_image;
	UIImageView *_imageView;
}
@property (readonly) UIImageView *imageView;

@end


//
//	KZBookshelfReusableView
//

@implementation KZBookshelfReusableView

+ (NSString *)kind
{
	return NSStringFromClass([self class]);
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
	}
	return self;
}

#pragma mark -

- (KZBookshelfView *)bookshelffView
{
	UIView *view = self;
	do {
		view = view.superview;
	} while (view && ![view isKindOfClass:[KZBookshelfView class]]);

	return (KZBookshelfView *)view;
}

- (UIImageView *)imageView
{
	if (!_imageView) {
		_imageView = [[UIImageView alloc] initWithFrame:self.bounds];
		_imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		[self addSubview:_imageView];
		[self sendSubviewToBack:_imageView];
	}
	return _imageView;
}

- (UIImage *)image
{
	return _image;
}

- (void)setImage:(UIImage *)image
{
	if (_image != image) {
		_image = image;

		if (_image) {
			self.imageView.image = _image;
		}
		else {
			[_imageView removeFromSuperview], _imageView = nil;
		}
	}
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
