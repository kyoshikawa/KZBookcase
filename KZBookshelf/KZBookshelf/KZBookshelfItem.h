//
//  KZBookshelfItem.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//	KZBookshelfItem
//

@protocol KZBookshelfItem <NSObject>

@property (readonly) NSString *title;
@property (readonly) UIImage *image;

@end


//
//	KZBookshelfItem
//

@interface KZBookshelfItem : NSObject <KZBookshelfItem>

@property (strong) NSString *title;
@property (strong) UIImage *image;

+ (id)bookshelfItemWithTitle:(NSString *)title image:(UIImage *)image;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image;

@end
