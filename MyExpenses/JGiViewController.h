//
//  JGiViewController.h
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGiNewRecordViewController.h"

@interface JGiViewController : UIViewController <JGiNewRecordViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *totalBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *accountBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *cashBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *savingsBalanceLabel;

@property (strong, nonatomic) NSMutableArray *totalBalanceArray;
@property (strong, nonatomic) NSMutableArray *accountBalanceArray;
@property (strong, nonatomic) NSMutableArray *cashBalanceArray;
@property (strong, nonatomic) NSMutableArray *savingsBalanceArray;

@property (strong, nonatomic) IBOutlet UITableView *transactionsView;
@end