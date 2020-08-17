@interface NSMutableArray (Convenience)
-(void) moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
@end


@interface HSUIFolderEditTableViewController : UITableViewController {
  NSDictionary *dict;
  NSMutableArray *pages;
}

@property (assign, nonatomic) NSInteger pageIndex;
@property (assign, nonatomic) NSInteger iconIndex;
@end