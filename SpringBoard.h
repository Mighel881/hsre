@interface SBIcon : NSObject
@property (copy, nonatomic, readonly) NSString *displayName;

-(id) applicationBundleID;
-(long long) badgeValue;
-(void) setBadge:(id)arg1;
@end

@interface SBApplicationIcon : SBIcon
-(UIImage *) generateIconImage:(int)arg1;
@end

@interface SBIconImageView : UIImageView
-(void) setIcon:(SBIcon *)arg1 location:(long long)arg2 animated:(BOOL)arg3;
@end

@interface SBIconModel : NSObject
-(SBIcon *) expectedIconForDisplayIdentifier:(NSString *)arg1 createIfNecassary:(BOOL)arg2;
-(SBApplicationIcon *) applicationIconForBundleIdentifier:(NSString *)arg1;
@end

@interface SBIconController : UIViewController
+(SBIconController *) sharedInstance;
-(void) displayContentController: (UIViewController *)content;

@property (nonatomic, retain) SBIconModel *model;
@end


@interface UIApplication (Launch)
-(void) launchApplicationWithIdentifier:(NSString *)arg1 suspended:(BOOL)arg2;
@end


@interface CALayer (Continuous)
@property (assign) BOOL continuousCorners; 
@end