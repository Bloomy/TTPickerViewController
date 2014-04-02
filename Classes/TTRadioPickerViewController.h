//
//  TTRadioPickerViewController
//
//  Created by Orlando Aleman Ortiz on 08/07/13.
//  Copyright (c) 2013 orlandoaleman.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRadioPickerViewControllerDelegate.h"
#import "TTRadioPickerViewControllerDataSource.h"


/**
 * @class TTRadioradioPickerViewController
 * @brief 
 */

@interface TTRadioPickerViewController : UITableViewController

- (instancetype)initWithID:(NSString *)ID;

@property (nonatomic) NSString *ID;
@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic, assign) BOOL allowsEmptySelection;
@property (nonatomic) NSArray *selectedRows;
@property (nonatomic, weak) id<TTRadioPickerViewControllerDelegate> delegate;
@property (nonatomic, weak) id<TTRadioPickerViewControllerDataSource> dataSource;

@end
