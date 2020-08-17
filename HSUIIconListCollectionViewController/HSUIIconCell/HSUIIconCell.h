#import "../SpringBoard.h"


@interface HSUIIconCell : UICollectionViewCell
@property (nonatomic, strong) SBIconImageView *iconView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UITextView *badgeView;

-(void) configure:(NSString *)arg1;
@end