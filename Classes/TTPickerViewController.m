//
//  TTPickerViewController.m
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import "TTPickerViewController.h"
#import "TTPickerTableViewController.h"


@interface TTPickerViewController() {
    TTPickerTableViewController *pickerTableVC_;
}

@end


@implementation TTPickerViewController


- (id)init
{
    TTPickerTableViewController *pickerTableVC = [[TTPickerTableViewController alloc] init];
    if (self = [super initWithRootViewController:pickerTableVC]) {
        pickerTableVC_ = pickerTableVC;
    }
    return self;
}


- (TTPickerTableViewController *)tableViewController
{
    return pickerTableVC_;
}


@end