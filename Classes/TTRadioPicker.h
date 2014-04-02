//
//  TTNavRadioPickerViewController
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRadioPickerViewController.h"


/**
 * @class TTPickerViewController
 * @brief Ofrece un TTRadioradioPickerViewController embebido en un navigation 
 *        controller, preparado para ser presentado modalmente como picker
 */

@interface TTRadioPicker : UINavigationController

- (instancetype)initWithID:(NSString *)ID;

@property (nonatomic, readonly) TTRadioPickerViewController *radioPickerViewController;
@end
