#import "../HSUIFolderPageIconCell/HSUIFolderPageIconCell.h"

@interface HSUIFolderPageCell : UICollectionViewCell <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *applications;

@property (nonatomic, strong) UICollectionView *collectionView;

-(void) configure:(NSArray *)arg1;
@end
