#import "HSUIIconListCollectionViewController.h"
#import "HSUIFolderEditTableViewController/HSUIFolderEditTableViewController.h"
#import "HSUIFolderViewController/HSUIFolderViewController.h"
#import "HSUIIconCell/HSUIIconCell.h"
#import "HSUIFolderCell/HSUIFolderCell.h"


@implementation HSUIIconListCollectionViewController
-(void) viewDidLoad {
  [super viewDidLoad];
  [self.collectionView setBackgroundColor:nil];
  [self.collectionView registerClass:[HSUIIconCell class] forCellWithReuseIdentifier:@"Icon"];
  [self.collectionView registerClass:[HSUIFolderCell class] forCellWithReuseIdentifier:@"Folder"];


  UILongPressGestureRecognizer *editLongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleEditLongPress:)];
  [editLongPress setDelegate:self];
  [editLongPress setMinimumPressDuration:0.5];
  [editLongPress setDelaysTouchesBegan:YES];
  [self.collectionView addGestureRecognizer:editLongPress];
}


-(void) handleEditLongPress:(UILongPressGestureRecognizer *)recognizer {
  CGPoint p = [recognizer locationInView:self.collectionView];
  NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];


  if(indexPath) {
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];

    if([cell isKindOfClass:[HSUIFolderCell class]]) {
      // HSUIFolderCell *folder = (HSUIFolderCell *)cell;

      HSUIFolderEditTableViewController *vc = [[HSUIFolderEditTableViewController alloc] initWithStyle:UITableViewStyleInsetGrouped];
      vc.pageIndex = self.index;
      vc.iconIndex = indexPath.item;

      UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
      [nav setModalPresentationStyle:UIModalPresentationPageSheet];
      [nav.navigationBar setPrefersLargeTitles:YES];

      [self presentViewController:nav animated:YES completion:nil];
    }
  }
}


-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  if([self.iconList[indexPath.item] isKindOfClass:[NSString class]]) {
    [[UIApplication sharedApplication] launchApplicationWithIdentifier:self.iconList[indexPath.item] suspended:NO];
  } else {
    HSUIFolderViewController *vc = [HSUIFolderViewController new];
    vc.pages = self.iconList[indexPath.item][@"iconLists"];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];

    [self presentViewController:vc animated:YES completion:nil];
  }
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.iconList.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  if([self.iconList[indexPath.item] isKindOfClass:[NSString class]]) {
    HSUIIconCell *cell = (HSUIIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Icon" forIndexPath:indexPath];
    [cell configure:self.iconList[indexPath.item]];
    return cell;
  } else {
    HSUIFolderCell *cell = (HSUIFolderCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Folder" forIndexPath:indexPath];
    [cell configure:self.iconList[indexPath.item][@"iconLists"]];
    [cell configureBadgeForApps:self.iconList[indexPath.item][@"iconLists"]];
    return cell;
  }
}


-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(60, 74);
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 27;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 27;
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  CGFloat statusBarHeight = [[UIApplication sharedApplication] windows][0].windowScene.statusBarManager.statusBarFrame.size.height;
  return UIEdgeInsetsMake(statusBarHeight+27, 27, 27, 27);
}
@end
