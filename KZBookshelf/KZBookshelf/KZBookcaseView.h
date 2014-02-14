//
//  KZBookcaseView.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZBookcaseItem.h"
@class KZBookcaseView;


//
//	KZBookcaseViewDataSource
//

@protocol KZBookcaseViewDataSource <UICollectionViewDataSource>

- (id <KZBookcaseItem>)bookcaseView:(KZBookcaseView *)bookcaseView bookcaseItemAtIndexPath:(NSIndexPath *)indexPath;

@end

//
//	KZBookcaseViewDelegate
//

@protocol KZBookcaseViewDelegate <UICollectionViewDelegate>

@end

//
//	KZBookcaseView
//

@interface KZBookcaseView : UICollectionView

@property (weak, nonatomic) IBOutlet id <KZBookcaseViewDataSource> dataSource;
@property (weak, nonatomic) IBOutlet id <KZBookcaseViewDelegate> delegate;
@property (strong) NSString *baseImageName;

- (UIImage *)rowImageForWidth:(CGFloat)width;
- (UIImage *)shelfImageForWidth:(CGFloat)width;
- (UIImage *)sectionImageForWidth:(CGFloat)width;

@end
