//
//  JGiTrxnDetails.h
//  MyExpenses
//
//  Created by jio on 20/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGiTransactions.h"

@interface JGiTrxnDetails : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) JGiTransactions *trxnObject;

@end
