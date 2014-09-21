//
//  JGiViewController.m
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import "JGiViewController.h"
#import "JGiTransactions.h"
#import "JGiTrxnDetails.h"

@interface JGiViewController ()

@end


@implementation JGiViewController


- (NSMutableArray *)totalBalanceArray
{
    if (!_totalBalanceArray) {
        _totalBalanceArray = [[NSMutableArray alloc] init];
    }
    return _totalBalanceArray;
}
- (NSMutableArray *)accountBalanceArray
{
    if (!_accountBalanceArray) {
        _accountBalanceArray = [[NSMutableArray alloc] init];
    }
    return _accountBalanceArray;
}
- (NSMutableArray *)cashBalanceArray
{
    if (!_cashBalanceArray) {
        _cashBalanceArray = [[NSMutableArray alloc] init];
    }
    return _cashBalanceArray;
}
- (NSMutableArray *)savingsBalanceArray
{
    if (!_savingsBalanceArray) {
        _savingsBalanceArray = [[NSMutableArray alloc] init];
    }
    return _savingsBalanceArray;
}


# pragma mark - Original Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



# pragma mark - Exchange Data between forms

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[JGiTrxnDetails class]])
    {
        JGiTrxnDetails *targetViewController = segue.destinationViewController;
        NSIndexPath *path = [self.transactionsView indexPathForCell:sender];
        JGiTransactions *selectedObject = self.totalBalanceArray[path.row];
        targetViewController.trxnObject = selectedObject;
    }
    
    if ([segue.destinationViewController isKindOfClass:[JGiNewRecordViewController class]]){
        JGiNewRecordViewController *addObject = segue.destinationViewController;
        addObject.delegate = self;
    }
}



# pragma mark - JGiNewRecordViewController Delegate

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addTrxnObject:(JGiTransactions *)trxnsObject
{
    if ([trxnsObject.account isEqualToString: @"Cash"])
    {
        [self.cashBalanceArray addObject:trxnsObject];
    }
    else if ([trxnsObject.account isEqualToString: @"Savings"])
    {
        [self.savingsBalanceArray addObject:trxnsObject];
    }
    else if ([trxnsObject.account isEqualToString: @"Account"])
    {
        [self.accountBalanceArray addObject:trxnsObject];
    }
    
    [self.totalBalanceArray addObject:trxnsObject];

    [self reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}



# pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.totalBalanceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    JGiTransactions *trxn = [self.totalBalanceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = trxn.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", trxn.amount];

    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push trxndetails" sender:indexPath];
}



# pragma mark - Handle balances

- (void)reloadData {
    // need to count the total in the array and print in TotalBalance
    float totalBalance = [self countBalance:self.accountBalanceArray]
                        + [self countBalance:self.cashBalanceArray]
                        + [self countBalance:self.savingsBalanceArray];

    self.totalBalanceLabel.text = [NSString stringWithFormat:@"%.02f", totalBalance];
    self.accountBalanceLabel.text = [NSString stringWithFormat:@"%.02f", [self countBalance:self.accountBalanceArray]];
    self.cashBalanceLabel.text = [NSString stringWithFormat:@"%.02f", [self countBalance:self.cashBalanceArray]];
    self.savingsBalanceLabel.text = [NSString stringWithFormat:@"%.02f", [self countBalance:self.savingsBalanceArray]];
}

-(float)countBalance:(NSMutableArray *)array {
    float balance = 0;

    for (JGiTransactions *trxns in array) {
        balance += trxns.amount;
    }
    return balance;
}



# pragma mark Print Array and Dictionary
- (void)printArray:(NSMutableArray *)array {
    for (NSString *string in array) {
        NSLog(@"Transactions Array: %@", string);
    }
}

@end
