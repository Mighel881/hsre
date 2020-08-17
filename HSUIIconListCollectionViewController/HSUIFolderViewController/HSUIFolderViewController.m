#import "HSUIFolderViewController.h"


@interface HSUIFolderViewController ()
@end


@implementation HSUIFolderViewController
-(void) viewDidLoad {
  [super viewDidLoad];
  UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

  self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
  [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.collectionView setDataSource:self];
  [self.collectionView setDelegate:self];
  [self.collectionView setPagingEnabled:YES];
  [self.collectionView registerClass:[HSUIFolderPageCell class] forCellWithReuseIdentifier:@"Page"];
  [self.collectionView setBackgroundColor:nil];
  [self.collectionView setShowsHorizontalScrollIndicator:NO];
  [self.view addSubview:self.collectionView];

  [self.collectionView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
  [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:36].active = YES;
  [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-36].active = YES;
  [self.collectionView.heightAnchor constraintEqualToAnchor:self.collectionView.widthAnchor constant:20].active = YES;


  UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterial]];
  [visualEffectView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [visualEffectView setClipsToBounds:YES];
  [visualEffectView.layer setCornerRadius:30];
  [self.view addSubview:visualEffectView];
  [self.view insertSubview:visualEffectView belowSubview:self.collectionView];

  [visualEffectView.topAnchor constraintEqualToAnchor:self.collectionView.topAnchor].active = YES;
  [visualEffectView.leadingAnchor constraintEqualToAnchor:self.collectionView.leadingAnchor].active = YES;
  [visualEffectView.bottomAnchor constraintEqualToAnchor:self.collectionView.bottomAnchor].active = YES;
  [visualEffectView.trailingAnchor constraintEqualToAnchor:self.collectionView.trailingAnchor].active = YES;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.pages.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  HSUIFolderPageCell *cell = (HSUIFolderPageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Page" forIndexPath:indexPath];
  [cell configure:self.pages[indexPath.item]];
  return cell;
}


-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return collectionView.bounds.size;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 0;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 0;
}
@end
