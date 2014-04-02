//
//  TTRadioPickerViewControllerDelegate
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TTRadioPickerViewController;


@protocol TTRadioPickerViewControllerDataSource <NSObject>

- (NSInteger)numberOfItemsInRadioPickerViewController:(TTRadioPickerViewController *)controller;
- (UITableViewCell *)radioPickerViewController:(TTRadioPickerViewController *)controller
                                     tableView:(UITableView *)tableView
                                  cellForRowAt:(NSInteger)row;
@end
