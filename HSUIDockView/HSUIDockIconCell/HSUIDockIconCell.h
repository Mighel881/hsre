#import "../../SpringBoard.h"


@interface HSUIDockIconCell : UICollectionViewCell
@property (nonatomic, strong) SBIconImageView *iconView;
@property (nonatomic, strong) UITextView *badgeView;

-(void) configure:(NSString *)arg1;
@end
