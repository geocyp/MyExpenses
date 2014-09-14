//
//  JGiNewRecordViewController.h
//  MyExpenses
//
//  Created by jio on 14/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGiViewController.h"

@interface JGiNewRecordViewController : UIViewController {
    NSMutableArray *allTrxnsTitle;
    NSMutableArray *allTrxnsAmount;

}
@property (nonatomic) float totalBalance;
@property (nonatomic) float accBalance;
@property (nonatomic) float cashBalance;
@property (nonatomic) float savingBalance;

@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtAmount;
@property (strong, nonatomic) IBOutlet UITextField *txtCategory;
@property (strong, nonatomic) IBOutlet UITextField *txtAccount;

- (IBAction)btnRecordItem:(UIButton *)sender;
@end
