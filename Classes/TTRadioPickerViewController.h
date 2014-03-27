//
//  TTRadioPickerViewController
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRadioPickerViewControllerDelegate.h"

/**
 * @class TTRadiopickerRadioViewController
 * @brief 
 */

@interface TTRadioPickerViewController : UITableViewController

@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic) NSArray *selectedRows;
@property (nonatomic, weak) id<TTRadioPickerViewControllerDelegate> delegate;
@end
