//
//  JGiNewRecordTableViewController.h
//  MyExpenses
//
//  Created by jio on 14/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGiTransactions.h"

@protocol JGiNewRecordViewControllerDelegate <NSObject>

@required

-(void)addObject:(JGiTransactions *)trxnObject;
-(void)didCancel;

@end

@interface JGiNewRecordViewController : UIViewController

@property (weak, nonatomic) id <JGiNewRecordViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *categoryTextField;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;

@end
