//
//  KZBookshelfView.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZBookshelfItem.h"
@class KZBookshelfView;


//
//	KZBookshelfViewDataSource
//

@protocol KZBookshelfViewDataSource <UICollectionViewDataSource>

- (id <KZBookshelfItem>)bookshelfView:(KZBookshelfView *)bookshelfView bookshelfItemAtIndexPath:(NSIndexPath *)indexPath;

@end


//
//	KZBookshelfViewDelegate
//

@protocol KZBookshelfViewDelegate <UICollectionViewDelegate>

@end


//
//	KZBookshelfView
//

@interface KZBookshelfView : UICollectionView

@property (weak, nonatomic) IBOutlet id <KZBookshelfViewDataSource> dataSource;
@property (weak, nonatomic) IBOutlet id <KZBookshelfViewDelegate> delegate;
@property (strong) NSString *baseImageName;

- (UIImage *)bodyImageForWidth:(CGFloat)width;
- (UIImage *)bottomImageForWidth:(CGFloat)width;
- (UIImage *)sectionImageForWidth:(CGFloat)width;

@end
