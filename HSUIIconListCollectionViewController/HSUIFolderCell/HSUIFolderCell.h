#import "../HSUIFolderIconCell/HSUIFolderIconCell.h"


@interface HSUIFolderCell : UICollectionViewCell <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *applications;

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITextView *badgeView;
@property (nonatomic, strong) UILabel *textLabel;

-(void) configure:(NSArray *)arg1;
-(void) configureBadgeForApps:(NSArray *)apps;
@end
