#import "HSUIFolderPageCell.h"


@implementation HSUIFolderPageCell
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[HSUIFolderPageIconCell class] forCellWithReuseIdentifier:@"Icon"];
    [self.collectionView setBackgroundColor:nil];
    [self addSubview:self.collectionView];

    [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
  } return self;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.applications.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  HSUIFolderPageIconCell *cell = (HSUIFolderPageIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Icon" forIndexPath:indexPath];
  [cell configure:self.applications[indexPath.item]];
  return cell;
}


-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(60, 74);
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 26;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 26;
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(26, 26, 26, 26);
}


-(void) configure:(NSArray *)arg1 {
  if(_applications != arg1) {
    _applications = arg1;
  }
}
@end
