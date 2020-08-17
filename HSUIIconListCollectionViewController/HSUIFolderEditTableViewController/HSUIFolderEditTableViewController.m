#import "HSUIFolderEditTableViewController.h"
#import "HSUIFolderEditIconCell/HSUIFolderEditIconCell.h"


@implementation NSMutableArray (Convenience)
-(void) moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
  if(to != from) {
    id obj = [self objectAtIndex:from];
    [self removeObjectAtIndex:from];
    if(to >= [self count]) {
      [self addObject:obj];
    } else {
      [self insertObject:obj atIndex:to];
    }
  }
}
@end


@implementation HSUIFolderEditTableViewController
-(void) viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor systemBackgroundColor]];
  [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)] animated:YES];


  dict = [[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/SpringBoard/IconState.plist"] mutableCopy];
  NSArray *iconLists = dict[@"iconLists"];
  NSArray *page = iconLists[self.pageIndex];
  NSDictionary *folder = page[self.iconIndex];

  [self setTitle:folder[@"displayName"]];
  pages = [folder[@"iconLists"] mutableCopy];


  [self.tableView registerClass:[HSUIFolderEditIconCell class] forCellReuseIdentifier:@"Icon"];
  [self.tableView setSeparatorColor:[UIColor tertiarySystemBackgroundColor]];
  [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
}


-(void) edit:(UIBarButtonItem *)sender {
  if([self.tableView isEditing]) {
    [self.tableView setEditing:NO animated:YES];
    [sender setTitle:@"Edit"];
  } else {
    [self.tableView setEditing:YES animated:YES];
    [sender setTitle:@"Done"];
  }
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];

  [self dismissViewControllerAnimated:YES completion:^{
    if([pages[indexPath.section][indexPath.item] isKindOfClass:[NSString class]]) {
      [[UIApplication sharedApplication] launchApplicationWithIdentifier:pages[indexPath.section][indexPath.row] suspended:NO];
    }
  }];
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
  return pages.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSArray *appsForPage = pages[section];
  return appsForPage.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  HSUIFolderEditIconCell *cell = (HSUIFolderEditIconCell *)[tableView dequeueReusableCellWithIdentifier:@"Icon"];

  if(cell == nil) {
    cell = [[HSUIFolderEditIconCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Icon"];
  }

  NSArray *appsForSection = pages[indexPath.section];
  [cell configure:appsForSection[indexPath.row]];
  return cell;
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [NSString stringWithFormat:@"PAGE %li", 1+section];
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 44;
}

-(BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
  if(sourceIndexPath != destinationIndexPath) {
    [pages moveObjectFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    [tableView reloadData];
  }
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
  return UITableViewCellEditingStyleNone;
}
@end
