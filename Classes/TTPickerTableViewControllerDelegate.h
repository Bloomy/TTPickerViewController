//
//  TTPickerTableViewControllerDelegate.h
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TTPickerTableViewController;


@protocol TTPickerTableViewControllerDelegate <NSObject>

- (void)pickerTableViewControllerDidCancel:(TTPickerTableViewController *)controller;

- (NSInteger)numberOfRowsInPickerTableViewController:(TTPickerTableViewController *)controller;

- (UITableViewCell *)pickerTableViewController:(TTPickerTableViewController *)controller
                                     tableView:(UITableView *)tableView
                                  cellForRowAt:(NSInteger)row;

- (void)pickerTableViewController:(TTPickerTableViewController *)controller didFinishWithSelectedRows:(NSArray *)rows;

@optional
- (void)pickerTableViewController:(TTPickerTableViewController *)controller didSelectRow:(NSInteger)row;

@end
