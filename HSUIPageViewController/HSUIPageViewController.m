#import "HSUIPageViewController.h"


@implementation HSUIPageViewController
-(void) viewDidLoad {
  [super viewDidLoad];
  NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/SpringBoard/IconState.plist"];
  pages = dict[@"iconLists"];


  HSUIIconListCollectionViewController *iconListController = [self viewControllerAtIndex:0];
  NSArray *viewControllers = @[iconListController];

  [self setDataSource:self];
  [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
  NSUInteger index = [(HSUIIconListCollectionViewController *)viewController index];
    
  if(index == 0) {
      return nil;
  } index--;
    
   return [self viewControllerAtIndex:index];
}
 
-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
  NSUInteger index = [(HSUIIconListCollectionViewController *)viewController index];
    
  index++;
  if(index == pages.count) {
    return nil;
  }

  return [self viewControllerAtIndex:index];
}


-(HSUIIconListCollectionViewController *) viewControllerAtIndex:(NSUInteger)index {
  UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

  HSUIIconListCollectionViewController *iconListController = [[HSUIIconListCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
  [iconListController setIconList:pages[index]];
  [iconListController setIndex:index];
  return iconListController;
}


/*
-(NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController {
  return 2;
}
 
-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
  return 0;
}
*/
@end