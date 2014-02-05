//
//  ZGeometricUtils.m
//	ZKit
//
//  Created by Kaz Yoshikawa on 10/10/19.
//  Copyright 2010 Digital Lynx. All rights reserved.
//

#import "ZGeometricUtils.h"

#ifdef __cplusplus
extern "C" {
#endif

#if TARGET_OS_MAC
NSString *NSStringFromCGPoint(CGPoint point)
{
	return [NSString stringWithFormat:@"{%f,%f}", point.x, point.y];
}
#endif


CGFloat DegreesToRadians(CGFloat degrees)
{
	return degrees * M_PI / 180;
};

CGFloat RadiansToDegrees(CGFloat radians)
{
	return radians * 180/M_PI;
};


CGRect CGRectMakeAspectToFill_(CGSize imageSize, CGRect bounds)
{
	CGRect result;
	double horizontalRatioToFit = bounds.size.width / imageSize.width;
	double verticalRatioToFit = bounds.size.height / imageSize.height;
	
	double imageHeightWhenItFitsHorizontally = horizontalRatioToFit * imageSize.height;
	double imageWidthWhenItFitsVertically = verticalRatioToFit * imageSize.width;

	float minX = CGRectGetMinX(bounds);
	float minY = CGRectGetMinY(bounds);

	if (imageHeightWhenItFitsHorizontally > bounds.size.height) {
		float margin = (imageHeightWhenItFitsHorizontally - bounds.size.height) * 0.5;
		result = CGRectMake(minX, minY - margin, imageSize.width * horizontalRatioToFit, imageSize.height * horizontalRatioToFit);
	}
	else {
		float margin = (imageWidthWhenItFitsVertically - bounds.size.width) * 0.5;
		result = CGRectMake(minX - margin, minY, imageSize.width * verticalRatioToFit, imageSize.height * verticalRatioToFit);
	}
	return result;
}

CGRect CGRectMakeAspectFit_(CGSize imageSize, CGRect bounds)
{
	float minX = CGRectGetMinX(bounds);
	float minY = CGRectGetMinY(bounds);
	double widthRatio = (double)bounds.size.width / (double)imageSize.width;
	double heightRatio = (double)bounds.size.height / (double)imageSize.height;
	double ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio;
	float width = imageSize.width * ratio;
	float height = imageSize.height * ratio;
	float xmargin = (bounds.size.width - width) / 2.0;
	float ymargin = (bounds.size.height - height) / 2.0;
	return CGRectMake(minX + xmargin, minY + ymargin, width, height);
}

CGSize CGSizeMakeAspectFit_(CGSize imageSize, CGSize frameSize)
{
	double widthRatio = (double)frameSize.width / (double)imageSize.width;
	double heightRatio = (double)frameSize.height / (double)imageSize.height;
	double ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio;
	float width = imageSize.width * ratio;
	float height = imageSize.height * ratio;
	return CGSizeMake(width, height);
}

CGSize CGSizeIntegral_(CGSize size)
{
	return CGSizeMake(roundf(size.width), roundf(size.height));
}

CGRect CGRectRounded_(CGRect rect)
{
	CGFloat x = roundf(CGRectGetMinX(rect));
	CGFloat y = roundf(CGRectGetMinY(rect));
	CGFloat width = roundf(CGRectGetWidth(rect));
	CGFloat height = roundf(CGRectGetHeight(rect));
	return CGRectMake(x, y, width, height);
}

NSString *CGPointString(CGPoint point)
{
	return NSStringFromCGPoint(point);
}

#pragma mark -

CGPoint CGRectGetMidXMidYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectGetMinXMinYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetMaxXMaxYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetMinXMaxYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetMaxXMinYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetMinXMidYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectGetMaxXMidYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
}

CGPoint CGRectGetMidXMinYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetMidXMaxYPoint_(CGRect rect)
{
	return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
}

#pragma mark -

CGPoint CGPointOffset_(CGPoint point, CGPoint offset)
{
	return CGPointMake(point.x + offset.x, point.y + offset.y);
}

CGRect CGRectMakeWithPoints_(CGPoint point1, CGPoint point2)
{
	CGFloat minX = fminf(point1.x, point2.x);
	CGFloat minY = fminf(point1.y, point2.y);
	CGFloat maxX = fmaxf(point1.x, point2.x);
	CGFloat maxY = fmaxf(point1.y, point2.y);
	return CGRectMake(minX, minY, maxX - minX, maxY - minY);
}

#pragma mark -

CGPathRef CGPathCreateRoundRect_(CGRect rect, CGFloat aRadius)
{
	assert(CGRectGetWidth(rect) >= aRadius * 2.0f);
	assert(CGRectGetHeight(rect) >= aRadius * 2.0f);

	CGFloat t = CGRectGetMinY(rect);
	CGFloat b = CGRectGetMaxY(rect);
	CGFloat l = CGRectGetMinX(rect);
	CGFloat r = CGRectGetMaxX(rect);

	CGMutablePathRef pathRef = CGPathCreateMutable();
	CGPathMoveToPoint(pathRef, NULL, l+aRadius, t);
	CGPathAddArcToPoint(pathRef, NULL, l, t, l, t+aRadius, aRadius);
	CGPathAddArcToPoint(pathRef, NULL, l, b, l+aRadius, b, aRadius);
	CGPathAddArcToPoint(pathRef, NULL, r, b, r, b-aRadius, aRadius);
	CGPathAddArcToPoint(pathRef, NULL, r, t, r-aRadius, t, aRadius);
	CGPathCloseSubpath(pathRef);

	return pathRef;
}


#ifdef __cplusplus
}
#endif

//
//	ZPoint
//

@implementation ZPoint

@synthesize CGPointValue = _point;

+ (id)pointWithCGPoint:(CGPoint)point
{
	return [[ZPoint alloc] initWithCGPoint:point];
}

- (id)initWithCGPoint:(CGPoint)point
{
	if ((self = [super init])) {
		_point = point;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init])) {
		_point.x = [decoder decodeFloatForKey:@"x"];
		_point.y = [decoder decodeFloatForKey:@"y"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeFloat:_point.x forKey:@"x"];
	[encoder encodeFloat:_point.y forKey:@"y"];
}

@end


//
//	ZRect
//

@implementation ZRect

@synthesize CGRectValue = _rect;

+ (id)rectWithCGRect:(CGRect)rect
{
	return [[ZRect alloc] initWithCGRect:rect];
}

- (id)initWithCGRect:(CGRect)rect
{
	if ((self = [super init])) {
		_rect = rect;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init])) {
		_rect.origin.x = [decoder decodeFloatForKey:@"x"];
		_rect.origin.y = [decoder decodeFloatForKey:@"y"];
		_rect.size.width = [decoder decodeFloatForKey:@"w"];
		_rect.size.height = [decoder decodeFloatForKey:@"h"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeFloat:_rect.origin.x forKey:@"x"];
	[encoder encodeFloat:_rect.origin.y forKey:@"y"];
	[encoder encodeFloat:_rect.size.width forKey:@"w"];
	[encoder encodeFloat:_rect.size.height forKey:@"h"];
}

- (CGSize)size
{
	return _rect.size;
}

- (void)setSize:(CGSize)size
{
	_rect.size = size;
}

@end


//
//	ZRange
//

@implementation ZRange

@synthesize NSRangeValue = _range;


+ (id)rangeWithNSRange:(NSRange)range
{
	return [[ZRange alloc] initWithNSRange:range];
}

- (id)initWithNSRange:(NSRange)range
{
	if ((self = [super init])) {
		_range = range;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init])) {
		_range.location = (NSUInteger)[decoder decodeIntegerForKey:@"location"];
		_range.length = (NSUInteger)[decoder decodeIntegerForKey:@"length"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeInteger:_range.location forKey:@"location"];
	[encoder encodeInteger:_range.length forKey:@"length"];
}

- (NSUInteger)location
{
	return _range.location;
}

- (void)setLocation:(NSUInteger)location
{
	_range.location = location;
}

- (NSUInteger)length
{
	return _range.length;
}

- (void)setLength:(NSUInteger)length
{
	_range.length = length;
}

@end
