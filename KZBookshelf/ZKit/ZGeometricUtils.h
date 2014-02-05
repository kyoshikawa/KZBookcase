//
//  ZGeometricUtils.h
//	ZKit
//
//  Created by Kaz Yoshikawa on 10/10/19.
//  Copyright 2010 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

#if TARGET_OS_MAC
extern NSString *NSStringFromCGPoint();
#endif

extern CGFloat DegreesToRadians(CGFloat degrees);
extern CGFloat RadiansToDegrees(CGFloat radians);
extern CGRect CGRectMakeAspectToFill_(CGSize imageSize, CGRect bounds);
extern CGRect CGRectMakeAspectFit_(CGSize imageSize, CGRect bounds);
extern CGSize CGSizeMakeAspectFit_(CGSize imageSize, CGSize frameSize);
extern CGSize CGSizeIntegral_(CGSize size);
extern CGRect CGRectRounded_(CGRect rect);
extern NSString *CGPointString(CGPoint point);
extern CGPoint CGRectGetMidXMidYPoint_(CGRect rect);
extern CGPoint CGRectGetMinXMinYPoint_(CGRect rect);
extern CGPoint CGRectGetMaxXMaxYPoint_(CGRect rect);
extern CGPoint CGRectGetMinXMaxYPoint_(CGRect rect);
extern CGPoint CGRectGetMaxXMinYPoint_(CGRect rect);
extern CGPoint CGRectGetMinXMidYPoint_(CGRect rect);
extern CGPoint CGRectGetMaxXMidYPoint_(CGRect rect);
extern CGPoint CGRectGetMidXMinYPoint_(CGRect rect);
extern CGPoint CGRectGetMidXMaxYPoint_(CGRect rect);

extern CGPoint CGPointOffset_(CGPoint point, CGPoint aOffset);
extern CGRect CGRectMakeWithPoints_(CGPoint point1, CGPoint point2);
extern CGPathRef CGPathCreateRoundRect_(CGRect rect, CGFloat radius);


CG_INLINE CGFloat CGAffineTransformGetHorizontalScaleFactor_(CGAffineTransform t)
{
	return sqrtf(t.a * t.a + t.c * t.c);
}

CG_INLINE CGFloat CGAffineTransformGetVerticalScaleFactor_(CGAffineTransform t)
{
	return sqrtf(t.b * t.b + t.d * t.d);
}

#ifdef __cplusplus
}
#endif



@interface ZPoint : NSObject <NSCoding>
@property (assign) CGPoint CGPointValue;

+ (id)pointWithCGPoint:(CGPoint)point;
- (id)initWithCGPoint:(CGPoint)point;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end


@interface ZRect : NSObject <NSCoding>
@property (assign) CGRect CGRectValue;

+ (id)rectWithCGRect:(CGRect)rect;
- (id)initWithCGRect:(CGRect)rect;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end


@interface ZRange : NSObject <NSCoding>
@property (assign) NSRange NSRangeValue;
@property (assign) NSUInteger location;
@property (assign) NSUInteger length;


+ (id)rangeWithNSRange:(NSRange)range;
- (id)initWithNSRange:(NSRange)range;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;


@end
