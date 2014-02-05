//
//	KZSampleBookshelfViewController.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZSampleBookshelfViewController.h"
#import "KZBookItem.h"


//
//	KZSampleBookshelfViewController ()
//

@interface KZSampleBookshelfViewController ()

@property (strong) NSArray *bookItems;

@end


//
//	KZSampleBookshelfViewController
//

@implementation KZSampleBookshelfViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.bookItems = @[
		[KZBookItem bookItemWithTitle:@"Janurary" coverImage:[UIImage imageNamed:@"yourmagazine.01.png"]],
		[KZBookItem bookItemWithTitle:@"February" coverImage:[UIImage imageNamed:@"yourmagazine.02.png"]],
		[KZBookItem bookItemWithTitle:@"March" coverImage:[UIImage imageNamed:@"yourmagazine.03.png"]],
		[KZBookItem bookItemWithTitle:@"April" coverImage:[UIImage imageNamed:@"yourmagazine.04.png"]],
		[KZBookItem bookItemWithTitle:@"May" coverImage:[UIImage imageNamed:@"yourmagazine.05.png"]],
		[KZBookItem bookItemWithTitle:@"June" coverImage:[UIImage imageNamed:@"yourmagazine.06.png"]],
		[KZBookItem bookItemWithTitle:@"July" coverImage:[UIImage imageNamed:@"yourmagazine.07.png"]],
		[KZBookItem bookItemWithTitle:@"August" coverImage:[UIImage imageNamed:@"yourmagazine.08.png"]],
		[KZBookItem bookItemWithTitle:@"September" coverImage:[UIImage imageNamed:@"yourmagazine.09.png"]],
		[KZBookItem bookItemWithTitle:@"October" coverImage:[UIImage imageNamed:@"yourmagazine.10.png"]],
		[KZBookItem bookItemWithTitle:@"November" coverImage:[UIImage imageNamed:@"yourmagazine.11.png"]],
		[KZBookItem bookItemWithTitle:@"December" coverImage:[UIImage imageNamed:@"yourmagazine.12.png"]],
	];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark -

- (NSInteger)numberOfSectionsInBookcaseView:(KZBookcaseView *)bookshelfView
{
	return 13;
}

- (NSInteger)bookcaseView:(KZBookcaseView *)bookshelfView numberOfItemsInSection:(NSInteger)section
{
	return self.bookItems.count;
}

- (id <KZBookcaseItem>)bookcaseView:(KZBookcaseView *)bookcaseView bookcaseItemAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.bookItems objectAtIndex:indexPath.row];
}

- (NSString *)bookcaseView:(KZBookcaseView *)bookcaseView titleForSection:(NSInteger)section;
{
	return [NSString stringWithFormat:@"Year %d", 2000 + section];
}

#pragma mark -

- (void)bookcaseView:(KZBookcaseView *)bookcaseView didSelectAtIndexPath:(NSIndexPath *)indexPath;
{
	id <KZBookcaseItem> item = [self bookcaseView:bookcaseView bookcaseItemAtIndexPath:indexPath];

	[[[UIAlertView alloc] initWithTitle:@"Item" message:[item title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
