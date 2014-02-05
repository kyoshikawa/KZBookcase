//
//  KZBookItemCell.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>


//
//	KZBookItemCell
//

@interface KZBookItemCell : UICollectionViewCell

+ (NSString *)kind;

@property (strong) UIImage *coverImage;
@property (readonly) UIImageView *imageView;

@end
