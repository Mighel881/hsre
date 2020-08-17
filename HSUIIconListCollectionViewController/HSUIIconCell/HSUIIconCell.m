#import "HSUIIconCell.h"


@implementation HSUIIconCell
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    self.iconView = [NSClassFromString(@"SBIconImageView") new];
    [self.iconView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.iconView setClipsToBounds:YES];
    [self.iconView.layer setContinuousCorners:YES];
    [self.iconView.layer setCornerRadius:19];
    [self addSubview:self.iconView];

    [self.iconView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.iconView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.iconView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-14].active = YES;
    [self.iconView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;


    self.badgeView = [UITextView new];
    [self.badgeView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.badgeView setUserInteractionEnabled:NO];
    [self.badgeView setBackgroundColor:nil];
    [self.badgeView setFont:[UIFont systemFontOfSize:15 weight:UIFontWeightMedium]];
    [self.badgeView setScrollEnabled:NO];
    [self.badgeView setTextAlignment:NSTextAlignmentCenter];
    [self.badgeView setTextContainerInset:UIEdgeInsetsMake(3, 0, 0, 0)];
    [self.badgeView setClipsToBounds:YES];
    [self.badgeView.layer setCornerRadius:12];
    [self addSubview:self.badgeView];

    [self.badgeView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:12].active = YES;
    [self.badgeView.centerYAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.badgeView.widthAnchor constraintEqualToConstant:24].active = YES;
    [self.badgeView.heightAnchor constraintEqualToConstant:24].active = YES;


    self.textLabel = [UILabel new];
    [self.textLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.textLabel setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]];
    [self.textLabel setTextAlignment:NSTextAlignmentCenter];
    [self.textLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:self.textLabel];

    [self.textLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:-8].active = YES;
    [self.textLabel.centerYAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.textLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:8].active = YES;
  } return self;
}


-(void) configure:(NSString *)arg1 {
  SBIconModel *model = ((SBIconController *)[NSClassFromString(@"SBIconController") sharedInstance]).model;
  SBApplicationIcon *icon = [model applicationIconForBundleIdentifier:arg1];

  [self.iconView setIcon:icon location:0 animated:YES];
  // [self.textLabel setText:[icon displayName]];
}
@end
