//
//  JGiViewController.h
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <UIKit/UIKit.h>

float totalBalance;
float accBalance;
float cashBalance;
float savingBalance;

@interface JGiViewController : UIViewController <UITableViewDelegate, UITableViewDelegate> {
    IBOutlet UITableView *transactionsView;
    NSMutableArray *allTrxns;
}

@property (strong, nonatomic) IBOutlet UILabel *lblTotBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblAccBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblCashBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblSavBalance;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *trxnList;

- (IBAction)btnAddIncome:(UIButton *)sender;
- (IBAction)btnAddExpense:(UIButton *)sender;

@end
