//
//  TTPickerViewController.h
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTPickerViewControllerDelegate.h"
#import "TTPickerTableViewController.h"


/**
 * @class TTPickerViewController
 * @brief Ofrece un TTPickerTableViewController embebido en un navigation 
 *        controller, preparado para ser presentado modalmente como picker
 */

@interface TTPickerViewController : UINavigationController

@property (nonatomic, readonly) TTPickerTableViewController *tableViewController;
@property (nonatomic, weak) id<UINavigationControllerDelegate, TTPickerViewControllerDelegate> delegate;
@end
