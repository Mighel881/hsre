#import "HSUIFolderEditIconCell.h"


@implementation HSUIFolderEditIconCell
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    [self setBackgroundColor:[UIColor secondarySystemBackgroundColor]];

    [self addIconView];
    [self addAppLabel];
  } return self;
}


-(void) addIconView {
  self.iconView = [NSClassFromString(@"SBIconImageView") new];
  [self.iconView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.iconView setClipsToBounds:YES];
  [self.iconView.layer setContinuousCorners:YES];
  [self.iconView.layer setCornerRadius:6.5];
  [self addSubview:self.iconView];

  [self.iconView.topAnchor constraintEqualToAnchor:self.topAnchor constant:8].active = YES;
  [self.iconView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15].active = YES;
  [self.iconView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8].active = YES;
  [self.iconView.widthAnchor constraintEqualToAnchor:self.iconView.heightAnchor].active = YES;
}


-(void) addAppLabel {
  self.appLabel = [UILabel new];
  [self.appLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.appLabel setFont:[UIFont systemFontOfSize:17]];
  [self.appLabel setTextAlignment:NSTextAlignmentLeft];
  [self.appLabel setTextColor:[UIColor labelColor]];
  [self addSubview:self.appLabel];

  [self.appLabel.leadingAnchor constraintEqualToAnchor:self.iconView.trailingAnchor constant:15].active = YES;
  [self.appLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
  [self.appLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15].active = YES;
}


-(void) configure:(NSString *)arg1 {
  SBIconModel *model = ((SBIconController *)[NSClassFromString(@"SBIconController") sharedInstance]).model;
  SBApplicationIcon *icon = [model applicationIconForBundleIdentifier:arg1];

  [self.iconView setIcon:icon location:0 animated:YES];
  [self.appLabel setText:[icon displayName]];
}
@end