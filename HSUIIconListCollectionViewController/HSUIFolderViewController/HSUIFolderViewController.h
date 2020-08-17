#import "HSUIFolderPageCell/HSUIFolderPageCell.h"

@interface HSUIFolderViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *pages;

@property (nonatomic, strong) UICollectionView *collectionView;
@end
