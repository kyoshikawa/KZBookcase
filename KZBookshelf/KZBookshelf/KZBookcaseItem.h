//
//  KZBookcaseItem.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//	KZBookcaseItem
//

@protocol KZBookcaseItem <NSObject>

@property (readonly) NSString *title;
@property (readonly) UIImage *image;

@end
