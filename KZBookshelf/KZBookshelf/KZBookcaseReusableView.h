//
//  KZBookcaseReusableView.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/3.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KZBookcaseView;


//
//	KZBookcaseReusableView
//

@interface KZBookcaseReusableView : UICollectionReusableView

+ (NSString *)kind;

@property (strong) UIImage *image;
@property (readonly) KZBookcaseView *bookcasefView;

@end
