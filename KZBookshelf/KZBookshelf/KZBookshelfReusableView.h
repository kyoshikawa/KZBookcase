//
//  KZBookshelfReusableView.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/3.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KZBookshelfView;


//
//	KZBookshelfReusableView
//

@interface KZBookshelfReusableView : UICollectionReusableView

+ (NSString *)kind;

@property (strong) UIImage *image;
@property (readonly) KZBookshelfView *bookshelffView;

@end
