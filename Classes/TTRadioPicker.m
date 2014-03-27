//
//  TTNavRadioPickerViewController
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import "TTRadioPicker.h"


@interface TTRadioPicker() {
}

@end


@implementation TTRadioPicker


- (id)init
{
    TTRadioPickerViewController *rootVC = [[TTRadioPickerViewController alloc] init];
    if (self = [super initWithRootViewController:rootVC]) {
    }
    return self;
}


- (UITableViewController *)tableViewController
{
    return (UITableViewController *)self.topViewController;
}


@end