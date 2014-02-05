//
//  UIView+Debug.h
//  ZKit
//
//  Created by Kaz Yoshikawa on 13/12/26.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>

//
//	UIView (Debug)
//

@interface UIView (Debug)

#if DEBUG
- (NSString *)recursiveDescription;
#endif

@end
