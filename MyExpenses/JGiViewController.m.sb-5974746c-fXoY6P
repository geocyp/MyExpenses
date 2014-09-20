//
//  JGiViewController.m
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import "JGiViewController.h"
#import "JGiTransactions.h"

@interface JGiViewController ()

@end


@implementation JGiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize variables
    totalBalance = 0;
    accBalance = 0;
    cashBalance = 0;
    savingBalance = 0;
    

    // load values from datasource
    allTrxns = [[NSMutableArray alloc] init];
    
    // print the results on the screen
    self.lblTotBalance.text = [NSString stringWithFormat:@"%.02f", totalBalance];
    self.lblAccBalance.text = [NSString stringWithFormat:@"%.02f", accBalance];
    self.lblCashBalance.text = [NSString stringWithFormat:@"%.02f", cashBalance];
    self.lblSavBalance.text = [NSString stringWithFormat:@"%.02f", savingBalance];
    NSLog(@"Been here");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAddIncome:(UIButton *)sender {

    UIAlertView *addIncome = [[UIAlertView alloc]
                             initWithTitle:@"Add Income"
                             message:@"Enter amount"
                             delegate:self
                             cancelButtonTitle:@"Cancel"
                             otherButtonTitles:@"Add Income", nil];

    addIncome.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[addIncome textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [addIncome show];
}

- (IBAction)btnAddExpense:(UIButton *)sender {
    UIAlertView *addExpense = [[UIAlertView alloc]
                             initWithTitle:@"Add Expense"
                             message:@"Enter amount"
                             delegate:self
                             cancelButtonTitle:@"Cancel"
                             otherButtonTitles:@"Add Expense", nil];
    
    addExpense.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[addExpense textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [addExpense show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if (buttonIndex == 1) {
        float amount = [[[alertView textFieldAtIndex:0] text] floatValue];

        JGiTransactions *trxn = [[JGiTransactions alloc] init];

        if ([title isEqualToString:@"Add Expense"]) {
            trxn.title = @"Food @ Work";
            trxn.amount = amount * -1;
        }
        else if ([title isEqualToString:@"Add Income"]) {
            trxn.title = @"Salary";
            trxn.amount = amount;
        }

        accBalance += trxn.amount;
        [allTrxns addObject:[NSString stringWithFormat:@"%.02f", trxn.amount]];
        trxn = nil;

        for (NSString *string in allTrxns) {
            NSLog(@"Transactions Array: %@", string);
        }

        totalBalance = accBalance + cashBalance;
        [transactionsView reloadData];

        self.lblTotBalance.text = [NSString stringWithFormat:@"%.02f", totalBalance];
        self.lblAccBalance.text = [NSString stringWithFormat:@"%.02f", accBalance];
        self.lblCashBalance.text = [NSString stringWithFormat:@"%.02f", cashBalance];
        self.lblSavBalance.text = [NSString stringWithFormat:@"%.02f", savingBalance];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [allTrxns count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [allTrxns objectAtIndex:indexPath.row];
    return cell;
}

@end
