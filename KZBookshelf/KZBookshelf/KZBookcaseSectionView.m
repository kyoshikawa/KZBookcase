//
//	KZBookcaseSectionView.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/3.
//	Copyright (c) 2014 Electricwoods LLC. All rights reserved.
//

#import "KZBookcaseSectionView.h"
#import "KZBookcaseView.h"
#import "KZBookcaseSectionLayoutAttributes.h"


//
//	KZBookcaseSectionView ()
//

@interface KZBookcaseSectionView ()
{
	UILabel *_textLabel;
}

@end


//
//	KZBookcaseSectionView
//

@implementation KZBookcaseSectionView

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];

	self.image = [self.bookcasefView shelfImageForWidth:CGRectGetWidth(self.bounds)];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
	[super applyLayoutAttributes:layoutAttributes];

	if ([layoutAttributes isKindOfClass:[KZBookcaseSectionLayoutAttributes class]]) {
		KZBookcaseSectionLayoutAttributes *attributes = (KZBookcaseSectionLayoutAttributes *)layoutAttributes;
		if (self.textLabel && attributes) {
			if (attributes.textColor) self.textLabel.textColor = attributes.textColor;
			if (attributes.font) self.textLabel.font = attributes.font;
		}
	}
}

#pragma mark -

- (CGFloat)width
{
	return CGRectGetHeight(self.bounds);
}

- (UILabel *)textLabel
{
	if (!_textLabel) {
		CGFloat margin = 32;
		CGFloat width = CGRectGetWidth(self.bounds);
		CGFloat height = CGRectGetHeight(self.bounds);
		CGFloat textHeight = MIN(height, 24);
		CGRect textFrame = CGRectMake(margin, (height - textHeight) * 0.5, width - margin * 2, textHeight);
		_textLabel = [[UILabel alloc] initWithFrame:textFrame];
		_textLabel.backgroundColor = [UIColor clearColor];
		_textLabel.textColor = [UIColor colorWithHue:360.0/18.0 saturation:0.8 brightness:0.25 alpha:1];
		_textLabel.font = [UIFont boldSystemFontOfSize:textHeight - 4.0];
		_textLabel.textAlignment = NSTextAlignmentLeft;
//		_textLabel.layer.shadowColor = [UIColor brownColor].CGColor;
//		_textLabel.layer.shadowOpacity = 0.25;
//		_textLabel.layer.shadowOffset = CGSizeMake(1, 1);
//		_textLabel.layer.shadowRadius = 2.0;
		_textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		[self addSubview:_textLabel];
	}
	return _textLabel;
}

@end
