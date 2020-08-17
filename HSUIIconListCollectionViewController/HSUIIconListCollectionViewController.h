@interface HSUIIconListCollectionViewController : UICollectionViewController <UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSArray *iconList;
@property (assign, nonatomic) NSInteger index;
@end