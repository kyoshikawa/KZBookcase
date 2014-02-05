//
//	KZBookcaseReusableView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/3.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookcaseReusableView.h"
#import "KZBookcaseView.h"


//
//	KZBookcaseReusableView ()
//

@interface KZBookcaseReusableView ()
{
	UIImage *_image;
	UIImageView *_imageView;
}
@property (readonly) UIImageView *imageView;

@end


//
//	KZBookcaseReusableView
//

@implementation KZBookcaseReusableView

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

- (KZBookcaseView *)bookcasefView
{
	UIView *view = self;
	do {
		view = view.superview;
	} while (view && ![view isKindOfClass:[KZBookcaseView class]]);

	return (KZBookcaseView *)view;
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
