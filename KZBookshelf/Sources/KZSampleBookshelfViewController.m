//
//	KZSampleBookshelfViewController.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZSampleBookshelfViewController.h"
#import "KZBookshelfItem.h"
#import "KZBookshelfItemCell.h"
#import "KZBookshelfView.h"
#import "KZBookshelfSectionView.h"


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
		[KZBookshelfItem bookshelfItemWithTitle:@"Janurary" image:[UIImage imageNamed:@"yourmagazine.01.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"February" image:[UIImage imageNamed:@"yourmagazine.02.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"March" image:[UIImage imageNamed:@"yourmagazine.03.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"April" image:[UIImage imageNamed:@"yourmagazine.04.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"May" image:[UIImage imageNamed:@"yourmagazine.05.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"June" image:[UIImage imageNamed:@"yourmagazine.06.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"July" image:[UIImage imageNamed:@"yourmagazine.07.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"August" image:[UIImage imageNamed:@"yourmagazine.08.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"September" image:[UIImage imageNamed:@"yourmagazine.09.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"October" image:[UIImage imageNamed:@"yourmagazine.10.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"November" image:[UIImage imageNamed:@"yourmagazine.11.png"]],
		[KZBookshelfItem bookshelfItemWithTitle:@"December" image:[UIImage imageNamed:@"yourmagazine.12.png"]],
	];

	NSParameterAssert(self.bookshelfView);
	[self.bookshelfView registerClass:[KZBookshelfItemCell class] forCellWithReuseIdentifier:[KZBookshelfItemCell kind]];
	[self.bookshelfView registerClass:[KZBookshelfSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[KZBookshelfSectionView kind]];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 21;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.bookItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	KZBookshelfItem *item = [self.bookItems objectAtIndex:indexPath.row];
	KZBookshelfItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[KZBookshelfItemCell kind] forIndexPath:indexPath];
	cell.image = item.image;
	return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		KZBookshelfSectionView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[KZBookshelfSectionView kind] forIndexPath:indexPath];
		NSString *title = [self titleForSection:indexPath.section];
		view.textLabel.text = title ;
		return view;
	}
	return nil;
}

#pragma mark -

- (id <KZBookshelfItem>)bookshelfView:(KZBookshelfView *)bookshelfView bookshelfItemAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.bookItems objectAtIndex:indexPath.row];
}

- (NSString *)titleForSection:(NSInteger)section;
{
	return [NSString stringWithFormat:@"Year %d", 2000 + section];
}

#pragma mark -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	KZBookshelfItem *item = [self.bookItems objectAtIndex:indexPath.row];
	[[[UIAlertView alloc] initWithTitle:@"Item" message:[item title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
