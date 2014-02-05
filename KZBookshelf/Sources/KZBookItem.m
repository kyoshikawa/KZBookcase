//
//  KZBookItem.m
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZBookItem.h"

//
//	KZBookItem
//

@implementation KZBookItem

+ (id)bookItemWithTitle:(NSString *)title coverImage:(UIImage *)image
{
	return [[self alloc] initWithTitle:title coverImage:image];
}

- (id)initWithTitle:(NSString *)title coverImage:(UIImage *)image;
{
	if (self = [super init]) {
		self.title = title;
		self.coverImage = image;
	}
	return self;
}

@end
