//
//	KZSampleBookshelfViewController.m
//	KZBookshelf
//
//	Created by Kaz Yoshikawa on 14/2/2.
//	Copyright (c) 2014 Digital Lynx. All rights reserved.
//

#import "KZSampleBookshelfViewController.h"
#import "KZBookItem.h"
#import "KZBookItemCell.h"
#import "KZBookcaseView.h"
#import "KZBookcaseSectionView.h"


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
		[KZBookItem bookItemWithTitle:@"Janurary" image:[UIImage imageNamed:@"yourmagazine.01.png"]],
		[KZBookItem bookItemWithTitle:@"February" image:[UIImage imageNamed:@"yourmagazine.02.png"]],
		[KZBookItem bookItemWithTitle:@"March" image:[UIImage imageNamed:@"yourmagazine.03.png"]],
		[KZBookItem bookItemWithTitle:@"April" image:[UIImage imageNamed:@"yourmagazine.04.png"]],
		[KZBookItem bookItemWithTitle:@"May" image:[UIImage imageNamed:@"yourmagazine.05.png"]],
		[KZBookItem bookItemWithTitle:@"June" image:[UIImage imageNamed:@"yourmagazine.06.png"]],
		[KZBookItem bookItemWithTitle:@"July" image:[UIImage imageNamed:@"yourmagazine.07.png"]],
		[KZBookItem bookItemWithTitle:@"August" image:[UIImage imageNamed:@"yourmagazine.08.png"]],
		[KZBookItem bookItemWithTitle:@"September" image:[UIImage imageNamed:@"yourmagazine.09.png"]],
		[KZBookItem bookItemWithTitle:@"October" image:[UIImage imageNamed:@"yourmagazine.10.png"]],
		[KZBookItem bookItemWithTitle:@"November" image:[UIImage imageNamed:@"yourmagazine.11.png"]],
		[KZBookItem bookItemWithTitle:@"December" image:[UIImage imageNamed:@"yourmagazine.12.png"]],
	];

	NSParameterAssert(self.bookcaseView);
	[self.bookcaseView registerClass:[KZBookItemCell class] forCellWithReuseIdentifier:[KZBookItemCell kind]];
	[self.bookcaseView registerClass:[KZBookcaseSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[KZBookcaseSectionView kind]];
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
	KZBookItem *item = [self.bookItems objectAtIndex:indexPath.row];
	KZBookItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[KZBookItemCell kind] forIndexPath:indexPath];
	cell.image = item.image;
	return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		KZBookcaseSectionView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[KZBookcaseSectionView kind] forIndexPath:indexPath];
		NSString *title = [self titleForSection:indexPath.section];
		view.textLabel.text = title ;
		return view;
	}
	return nil;
}

#pragma mark -

- (id <KZBookcaseItem>)bookcaseView:(KZBookcaseView *)bookcaseView bookcaseItemAtIndexPath:(NSIndexPath *)indexPath
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
	KZBookItem *item = [self.bookItems objectAtIndex:indexPath.row];
	[[[UIAlertView alloc] initWithTitle:@"Item" message:[item title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

@end
