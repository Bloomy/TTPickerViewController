//
//  TTRadioPickerViewControllerDelegate
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TTRadioPickerViewController;


@protocol TTRadioPickerViewControllerDelegate <NSObject>

- (void)pickerRadioViewControllerDidCancel:(TTRadioPickerViewController *)controller;
- (void)pickerRadioViewController:(TTRadioPickerViewController *)controller
        didFinishWithSelectedRows:(NSArray *)rows;

@optional
- (void)pickerRadioViewController:(TTRadioPickerViewController *)controller didSelectIndex:(NSInteger)row;

@end
