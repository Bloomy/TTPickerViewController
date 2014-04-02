//
//  TTRadioPickerViewControllerDelegate
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TTRadioPickerViewController;


@protocol TTRadioPickerViewControllerDelegate <NSObject>

- (void)radioPickerViewControllerDidCancel:(TTRadioPickerViewController *)controller;
- (void)radioPickerViewController:(TTRadioPickerViewController *)controller
        didFinishWithSelectedRows:(NSArray *)rows;

@optional
- (void)radioPickerViewController:(TTRadioPickerViewController *)controller didSelectIndex:(NSInteger)row;

@end
