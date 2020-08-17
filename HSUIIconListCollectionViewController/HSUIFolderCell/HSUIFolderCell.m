#import "HSUIFolderCell.h"


@implementation HSUIFolderCell
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self addVisualEffectView];
    [self addCollectionView];
    [self addBadgeView];
    [self addTextLabel];
  } return self;
}


-(void) addVisualEffectView {
  self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterial]];
  [self.visualEffectView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.visualEffectView setClipsToBounds:YES];
  [self.visualEffectView.layer setContinuousCorners:YES];
  [self.visualEffectView.layer setCornerRadius:19];
  [self addSubview:self.visualEffectView];

  [self.visualEffectView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [self.visualEffectView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [self.visualEffectView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-14].active = YES;
  [self.visualEffectView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}


-(void) addCollectionView {
  UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

  self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
  [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.collectionView setUserInteractionEnabled:NO];
  [self.collectionView setDataSource:self];
  [self.collectionView setDelegate:self];
  [self.collectionView registerClass:[HSUIFolderIconCell class] forCellWithReuseIdentifier:@"Icon"];
  [self.collectionView setBackgroundColor:nil];
  [self.visualEffectView.contentView addSubview:self.collectionView];

  [self.collectionView.topAnchor constraintEqualToAnchor:self.visualEffectView.contentView.topAnchor].active = YES;
  [self.collectionView.leadingAnchor constraintEqualToAnchor:self.visualEffectView.contentView.leadingAnchor].active = YES;
  [self.collectionView.bottomAnchor constraintEqualToAnchor:self.visualEffectView.contentView.bottomAnchor].active = YES;
  [self.collectionView.trailingAnchor constraintEqualToAnchor:self.visualEffectView.contentView.trailingAnchor].active = YES;
}


-(void) addBadgeView {
  self.badgeView = [UITextView new];
  [self.badgeView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.badgeView setUserInteractionEnabled:NO];
  [self.badgeView setBackgroundColor:nil];
  [self.badgeView setFont:[UIFont systemFontOfSize:15 weight:UIFontWeightMedium]];
  [self.badgeView setScrollEnabled:NO];
  [self.badgeView setTextAlignment:NSTextAlignmentCenter];
  [self.badgeView setTextContainerInset:UIEdgeInsetsMake(3, 0, 0, 0)];
  [self.badgeView setClipsToBounds:YES];
  [self.badgeView.layer setContinuousCorners:YES];
  [self.badgeView.layer setCornerRadius:12];
  [self addSubview:self.badgeView];

  [self.badgeView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:12].active = YES;
  [self.badgeView.centerYAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [self.badgeView.widthAnchor constraintEqualToConstant:24].active = YES;
  [self.badgeView.heightAnchor constraintEqualToConstant:24].active = YES;
}


-(void) addTextLabel {
  self.textLabel = [UILabel new];
  [self.textLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.textLabel setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]];
  [self.textLabel setTextAlignment:NSTextAlignmentCenter];
  [self.textLabel setTextColor:[UIColor whiteColor]];
  [self addSubview:self.textLabel];

  [self.textLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:-8].active = YES;
  [self.textLabel.centerYAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
  [self.textLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:8].active = YES;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  NSArray *appsForPage = self.applications[section];
  return appsForPage.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  HSUIFolderIconCell *cell = (HSUIFolderIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Icon" forIndexPath:indexPath];

  NSArray *appsForPage = self.applications[indexPath.section];
  [cell configure:appsForPage[indexPath.item]];
  return cell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(36/3, 36/3);
}


-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 4;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 4;
}


-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(8, 8, 8, 8);
}


-(void) configure:(NSArray *)arg1 {
  if(_applications != arg1) {
    _applications = arg1;
  }
}

-(void) configureBadgeForApps:(NSArray *)apps {
  int notifications = 0;
  for(NSArray *appArray in apps) {
    for(NSString *app in appArray) {
      SBIconModel *model = ((SBIconController *)[NSClassFromString(@"SBIconController") sharedInstance]).model;
      SBApplicationIcon *icon = [model applicationIconForBundleIdentifier:app];

      notifications += [icon badgeValue];
    }
  }

  [self.badgeView setBackgroundColor:notifications > 0 ? [UIColor systemRedColor] : [UIColor clearColor]];
  [self.badgeView setText:notifications > 0 ? [NSString stringWithFormat:@"%i", notifications] : @""];
}
@end
