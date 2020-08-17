#import "HSUIFolderIconCell.h"


@implementation HSUIFolderIconCell
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self addIconView];
  } return self;
}


-(void) addIconView {
  self.iconView = [NSClassFromString(@"SBIconImageView") new];
  [self.iconView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.iconView setClipsToBounds:YES];
  [self.iconView.layer setContinuousCorners:YES];
  [self.iconView.layer setCornerRadius:2];
  [self addSubview:self.iconView];

  [self.iconView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [self.iconView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [self.iconView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
  [self.iconView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}


-(void) configure:(NSString *)arg1 {
  SBIconModel *model = ((SBIconController *)[NSClassFromString(@"SBIconController") sharedInstance]).model;
  SBApplicationIcon *icon = [model applicationIconForBundleIdentifier:arg1];

  [self.iconView setIcon:icon location:0 animated:YES];
}
@end
