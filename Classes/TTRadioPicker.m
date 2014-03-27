//
//  TTNavRadioPickerViewController
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import "TTRadioPicker.h"


@implementation TTRadioPicker


- (instancetype)initWithID:(NSString *)ID
{
    TTRadioPickerViewController *rootVC = [[TTRadioPickerViewController alloc] initWithID:ID];
    if (self = [super initWithRootViewController:rootVC]) {
    }
    return self;
}


- (TTRadioPickerViewController *)radioPickerViewController
{
    return (TTRadioPickerViewController *)self.topViewController;
}


@end