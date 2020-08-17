#import "HSUIViewController.h"


@implementation HSUIViewController
-(void) viewDidLoad {
  [super viewDidLoad];

  NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/SpringBoard/IconState.plist"];


  dockView = [HSUIDockView new];
  [dockView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [dockView configure:dict[@"buttonBar"]];
  [self.view addSubview:dockView];

  [dockView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
  [dockView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
  [dockView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
  [dockView.heightAnchor constraintEqualToConstant:114].active = YES;


  HSUIPageViewController *pageViewController = [[HSUIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
  [[pageViewController view] setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self addChildViewController:pageViewController];
    [[self view] addSubview:[pageViewController view]];

    [pageViewController.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [pageViewController.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [pageViewController.view.bottomAnchor constraintEqualToAnchor:dockView.topAnchor constant:-40].active = YES;
    [pageViewController.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;

    [pageViewController didMoveToParentViewController:self];
}


-(void) updateBadges {
  dispatch_async(dispatch_get_main_queue(), ^{
    [dockView.collectionView reloadData];
  });
}
@end
