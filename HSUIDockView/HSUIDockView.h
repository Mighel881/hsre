#import "HSUIDockIconCell/HSUIDockIconCell.h"


@interface HSUIDockView : UIView <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *applications;

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) UICollectionView *collectionView;

-(void) configure:(NSArray *)arg1;
@end
