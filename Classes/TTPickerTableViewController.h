//
//  TTPickerTableViewController.h
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTPickerTableViewControllerDelegate.h"

/**
 * @class TTPickerTableViewController
 * @brief 
 */

@interface TTPickerTableViewController : UITableViewController

@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic) NSArray *selectedRows;
@property (nonatomic, weak) id<TTPickerTableViewControllerDelegate> delegate;
@end
