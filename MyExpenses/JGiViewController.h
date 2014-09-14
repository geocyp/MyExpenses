//
//  JGiViewController.h
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGiTransactions.h"
#import "JGiNewRecordViewController.h"

@interface JGiViewController : UIViewController <UITableViewDelegate, UITableViewDelegate> {

    IBOutlet UITableView *transactionsView;
}

@property (strong, nonatomic) IBOutlet UILabel *lblTotBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblAccBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblCashBalance;
@property (strong, nonatomic) IBOutlet UILabel *lblSavBalance;

@property (nonatomic) float totalBalanceTrnsf;
@property (nonatomic) float accBalanceTrnsf;
@property (nonatomic) float cashBalanceTrnsf;
@property (nonatomic) float savingBalanceTrnsf;

@property (nonatomic) float totalBalance;
@property (nonatomic) float accBalance;
@property (nonatomic) float cashBalance;
@property (nonatomic) float savingBalance;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *trxnList;

- (IBAction)btnAddIncome:(UIButton *)sender;
- (IBAction)btnAddExpense:(UIButton *)sender;

@end
