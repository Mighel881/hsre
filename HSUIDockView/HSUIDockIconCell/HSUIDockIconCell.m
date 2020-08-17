#import "HSUIDockIconCell.h"


@implementation HSUIDockIconCell
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self addIconView];
    [self addBadgeView];
  } return self;
}


-(void) addIconView {
  self.iconView = [NSClassFromString(@"SBIconImageView") new];
  [self.iconView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.iconView setClipsToBounds:YES];
  [self.iconView.layer setContinuousCorners:YES];
  [self.iconView.layer setCornerRadius:19];
  [self addSubview:self.iconView];

  [self.iconView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [self.iconView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [self.iconView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
  [self.iconView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}

-(void) addBadgeView {
  self.badgeView = [UITextView new];
  [self.badgeView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.badgeView setUserInteractionEnabled:NO];
  [self.badgeView setBackgroundColor:nil];
  [self.badgeView setFont:[UIFont systemFontOfSize:15 weight:UIFontWeightMedium]];
  [self.badgeView setScrollEnabled:NO];
  [self.badgeView setTextAlignment:NSTextAlignmentCenter];
  [self.badgeView setTextContainerInset:UIEdgeInsetsMake(3, 0, 0, 0)];
  [self.badgeView setClipsToBounds:YES];
  [self.badgeView setContinuousCorners:YES];
  [self.badgeView.layer setCornerRadius:12];
  [self addSubview:self.badgeView];

  [self.badgeView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:12].active = YES;
  [self.badgeView.centerYAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [self.badgeView.widthAnchor constraintEqualToConstant:24].active = YES;
  [self.badgeView.heightAnchor constraintEqualToConstant:24].active = YES;
}


-(void) configure:(NSString *)arg1 {
  SBIconModel *model = ((SBIconController *)[NSClassFromString(@"SBIconController") sharedInstance]).model;
  SBApplicationIcon *icon = [model applicationIconForBundleIdentifier:arg1];

  [self.iconView setIcon:icon location:0 animated:YES];
  [self.badgeView setBackgroundColor:[icon badgeValue] > 0 ? [UIColor systemRedColor] : [UIColor clearColor]];
  [self.badgeView setText:[icon badgeValue] > 0 ? [NSString stringWithFormat:@"%lli", [icon badgeValue]] : @""];
}
@end
