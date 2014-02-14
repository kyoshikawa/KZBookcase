//
//  KZBookshelfItem.m
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookshelfItem.h"


//
//	KZBookshelfItem
//

@implementation KZBookshelfItem

+ (id)bookshelfItemWithTitle:(NSString *)title image:(UIImage *)image
{
	return [[self alloc] initWithTitle:title image:image];
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image;
{
	if (self = [super init]) {
		self.title = title;
		self.image = image;
	}
	return self;
}

@end
