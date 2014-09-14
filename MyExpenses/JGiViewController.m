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

    // load values from datasource
    NSLog(@"JGiViewController-viewDidLoad");
    
    // print the results on the screen
    [self reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnAddIncome:(UIButton *)sender {
}



- (IBAction)btnAddExpense:(UIButton *)sender {
    [self reloadData];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JGiNewRecordViewController *nextView = segue.destinationViewController;
    if ([sender tag] == 101) {
        nextView.totalBalance = self.totalBalance;
        nextView.accBalance = self.accBalance;
        nextView.cashBalance = self.cashBalance;
        nextView.savingBalance = self.savingBalance;
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;//[allTrxnsTitle count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.textLabel.text = [allTrxnsTitle objectAtIndex:indexPath.row];
//    cell.detailTextLabel.text = [allTrxnsAmount objectAtIndex:indexPath.row];
    return cell;
}



- (void)printArray:(NSMutableArray *)array {
    for (NSString *string in array) {
        NSLog(@"Transactions Array: %@", string);
    }
}


- (void)reloadData {
    [transactionsView reloadData];
    self.lblTotBalance.text = [NSString stringWithFormat:@"%.02f", self.totalBalance];
    self.lblAccBalance.text = [NSString stringWithFormat:@"%.02f", self.accBalance];
    self.lblCashBalance.text = [NSString stringWithFormat:@"%.02f", self.cashBalance];
    self.lblSavBalance.text = [NSString stringWithFormat:@"%.02f", self.savingBalance];
}
@end
