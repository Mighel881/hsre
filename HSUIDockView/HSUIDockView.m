#import "HSUIDockView.h"


@implementation HSUIDockView
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self addVisualEffectView];
    [self addCollectionView];
  } return self;
}


-(void) addVisualEffectView {
  self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterial]];
  [self.visualEffectView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.visualEffectView setClipsToBounds:YES];
  [self.visualEffectView.layer setContinuousCorners:YES];
  [self.visualEffectView.layer setCornerRadius:30];
  [self addSubview:self.visualEffectView];

  [self.visualEffectView.topAnchor constraintEqualToAnchor:self.topAnchor constant:10].active = YES;
  [self.visualEffectView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10].active = YES;
  [self.visualEffectView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10].active = YES;
  [self.visualEffectView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10].active = YES;
}


-(void) addCollectionView {
  UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

  self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
  [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.collectionView setDataSource:self];
  [self.collectionView setDelegate:self];
  [self.collectionView registerClass:[HSUIDockIconCell class] forCellWithReuseIdentifier:@"Icon"];
  [self.collectionView setBackgroundColor:nil];
  [self.visualEffectView.contentView addSubview:self.collectionView];

  [self.collectionView.topAnchor constraintEqualToAnchor:self.visualEffectView.contentView.topAnchor].active = YES;
  [self.collectionView.leadingAnchor constraintEqualToAnchor:self.visualEffectView.contentView.leadingAnchor].active = YES;
  [self.collectionView.bottomAnchor constraintEqualToAnchor:self.visualEffectView.contentView.bottomAnchor].active = YES;
  [self.collectionView.trailingAnchor constraintEqualToAnchor:self.visualEffectView.contentView.trailingAnchor].active = YES;
}


-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  if([self.applications[indexPath.item] isKindOfClass:[NSString class]]) {
    [[UIApplication sharedApplication] launchApplicationWithIdentifier:self.applications[indexPath.item] suspended:NO];
  }
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.applications.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  HSUIDockIconCell *cell = (HSUIDockIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Icon" forIndexPath:indexPath];
  [cell configure:self.applications[indexPath.item]];
  return cell;
}


-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(60, 60);
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 27;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 27;
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(17, 17, 17, 17);
}


-(void) configure:(NSArray *)arg1 {
  if(_applications != arg1) {
    _applications = arg1;
  }
}
@end
