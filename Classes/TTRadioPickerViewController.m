//
//  TTRadioPickerViewController
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import "TTRadioPickerViewController.h"
#import "NSArray+Extras.h"


@interface TTRadioPickerViewController () {
}
@property (nonatomic) UIBarButtonItem *doneBtn;
@property (nonatomic) UIBarButtonItem *selectAllBtn;
@end


@implementation TTRadioPickerViewController


- (instancetype)initWithID:(NSString *)ID
{
    if (self = [super init]) {
        _ID = ID;
    }
    return self;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _allowsMultipleSelection = NO;
        _allowsEmptySelection = NO;
        _selectedRows = @[];
    }
    return self;
}


- (void)setSelectedRows:(NSArray *)selectedRows
{
    _selectedRows = [NSArray arrayWithArray:selectedRows];
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createMenu];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // La condición del assert equivale ¬(selectedRows.count > 1 && !self.allowsMultipleSelection)
    NSAssert(self.selectedRows.count <= 1 || self.allowsMultipleSelection, @"selectedRows.count > 1 with simple selection");
    
    [self updateMenuButtons];
}


- (void)createMenu
{
    if (self.allowsEmptySelection) {
        self.selectAllBtn = [[UIBarButtonItem alloc] initWithTitle:nil         // Se establece en el método -refreshSelectAllBtn
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(selectAllOrNoneAction)];
        self.navigationItem.leftBarButtonItem = self.selectAllBtn;
        
    }
    else {
        self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                     target:self
                                                                                     action:@selector(cancelAction)];
    }
    
    self.doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneBtn;
}


- (void)updateMenuButtons
{
    self.doneBtn.enabled = self.allowsEmptySelection || self.selectedRows.count > 0;
    
    if (self.selectedRows.count == 0) {
        self.selectAllBtn.title = LS(@"SelectAll");
    }
    else if (self.selectedRows.count == [self.dataSource numberOfItemsInRadioPickerViewController:self]) {
        self.selectAllBtn.title = LS(@"SelectNone");
    }
    else {
        self.selectAllBtn.title = LS(@"SelectAll");
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource numberOfItemsInRadioPickerViewController:self];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = cell = [self.dataSource radioPickerViewController:self
                                                                  tableView:tableView
                                                               cellForRowAt:indexPath.row];
    
    cell.accessoryType = [self.selectedRows containsObject:@(indexPath.row)] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.selectedRows = [self.selectedRows arrayByRemovingObject:@(indexPath.row)];
    }
    else {
        if (!self.allowsMultipleSelection) {
            NSNumber *lastObj = [self.selectedRows lastObject];
            if (lastObj) {
                self.selectedRows = [self.selectedRows arrayByRemovingObject:lastObj];
                [self.tableView reloadRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:[lastObj integerValue] inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            }
        }

        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedRows = [self.selectedRows arrayByAddingObject:@(indexPath.row)];
    
        if ([self.delegate respondsToSelector:@selector(radioPickerViewController:didSelectIndex:)]) {
            [self.delegate radioPickerViewController:self didSelectIndex:indexPath.row];
        }
    }
    [self updateMenuButtons];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark - Actions

- (void)cancelAction
{
    [self.delegate radioPickerViewControllerDidCancel:self];
}


- (void)doneAction
{
    [self.delegate radioPickerViewController:self
                   didFinishWithSelectedRows:self.selectedRows];
    
}


- (void)selectAllOrNoneAction
{
    if ([self.selectAllBtn.title isEqualToString:LS(@"SelectAll")]) {
        NSMutableArray *allRows = [NSMutableArray array];
        for (NSUInteger i = 0; i < [self.dataSource numberOfItemsInRadioPickerViewController:self]; i++) {
            [allRows addObject:@(i)];
        }
        self.selectedRows = allRows;
    }
    else {
        self.selectedRows = @[];
    }
    [self.tableView reloadData];
    [self updateMenuButtons];
}


@end
