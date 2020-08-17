#import "HSUIDockView/HSUIDockView.h"
#import "HSUIPageViewController/HSUIPageViewController.h"


@interface HSUIViewController : UIViewController {
  HSUIDockView *dockView;
}


-(void) updateBadges;
@end
