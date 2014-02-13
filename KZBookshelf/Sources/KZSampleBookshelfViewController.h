//
//  KZSampleBookshelfViewController.h
//  KZBookshelf
//
//  Created by Kaz Yoshikawa on 14/2/2.
//  Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZBookcaseView.h"


//
//	KZSampleBookshelfViewController
//

@interface KZSampleBookshelfViewController : UIViewController <KZBookcaseViewDataSource, KZBookcaseViewDelegate>

@property (strong) IBOutlet KZBookcaseView *bookcaseView;

@end
