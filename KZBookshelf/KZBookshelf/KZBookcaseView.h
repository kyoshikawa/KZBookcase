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

@protocol KZBookcaseViewDataSource <NSObject>

- (NSInteger)numberOfSectionsInBookcaseView:(KZBookcaseView *)bookcaseView;
- (NSInteger)bookcaseView:(KZBookcaseView *)bookcaseView numberOfItemsInSection:(NSInteger)section;
- (id <KZBookcaseItem>)bookcaseView:(KZBookcaseView *)bookcaseView bookcaseItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)bookcaseView:(KZBookcaseView *)bookcaseView titleForSection:(NSInteger)section;

@end


//
//	KZBookcaseViewDelegate
//

@protocol KZBookcaseViewDelegate <NSObject>

- (void)bookcaseView:(KZBookcaseView *)bookcaseView didSelectAtIndexPath:(NSIndexPath *)indexPath;

@end


//
//	KZBookcaseView
//

@interface KZBookcaseView : UIView

@property (weak, nonatomic) IBOutlet id <KZBookcaseViewDataSource> dataSource;
@property (weak, nonatomic) IBOutlet id <KZBookcaseViewDelegate> delegate;
@property (strong) NSString *baseImageName;

- (UIImage *)rowImageForWidth:(CGFloat)width;
- (UIImage *)shelfImageForWidth:(CGFloat)width;
- (UIImage *)sectionImageForWidth:(CGFloat)width;

- (void)reloadData;

@end
