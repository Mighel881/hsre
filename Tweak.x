#import "HSUIViewController.h"

@interface SBHomeScreenWindow : UIWindow
@end


HSUIViewController *vc;
%hook SBHomeScreenWindow
-(id)_initWithScreen:(id)arg1 layoutStrategy:(id)arg2 debugName:(id)arg3 rootViewController:(id)arg4 scene:(id)arg5 {
  SBHomeScreenWindow *orig = %orig;


  vc = [[HSUIViewController alloc] init];
  if(![orig.rootViewController isKindOfClass:[HSUIViewController class]]) {
    [self setRootViewController:vc];
  } return orig;
}
%end


%hook SBIcon
-(void) setBadge:(id)arg1 {
  %orig;
  [vc updateBadges];
}
%end
