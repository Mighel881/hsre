#import "../../../SpringBoard.h"


@interface HSUIFolderEditIconCell : UITableViewCell
@property (nonatomic, strong) SBIconImageView *iconView;
@property (nonatomic, strong) UILabel *appLabel;

-(void) configure:(NSString *)arg1;
@end