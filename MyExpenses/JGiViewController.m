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
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[JGiNewRecordViewController class]]){
        JGiNewRecordViewController *addObject = segue.destinationViewController;
        addObject.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - JGiNewRecordViewController Delegate
-(void)didCancel
{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)addObject:(JGiTransactions *)trxnsObject
{
    if (!self.addedTrxns){
        self.addedTrxns = [[NSMutableArray alloc] init];
    }
    [self.addedTrxns addObject:trxnsObject];
    [self dismissViewControllerAnimated:YES completion:nil];
}



# pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.addedTrxns count]){
        return 2;
    }
    else {
        return 1;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 1){
        return [self.addedTrxns count];
    }
    else {
        return [self.trxns count];
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 1){
        JGiTransactions *trxn = [self.addedTrxns objectAtIndex:indexPath.row];
        cell.textLabel.text = trxn.title;
        cell.detailTextLabel.text = trxn.title;
    }
    else {
        JGiTransactions *trxn = [self.trxns objectAtIndex:indexPath.row];
        cell.textLabel.text = trxn.title;
        cell.detailTextLabel.text = trxn.title;
    }
    
    return cell;
}



# pragma mark UITableVIew Delegate
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to data" sender:indexPath];
}



# pragma mark Print Array and Dictionary
//- (void)printArray:(NSMutableArray *)array {
//    for (NSString *string in array) {
//        NSLog(@"Transactions Array: %@", string);
//    }
//}
//
//
//
//-(void) printDic: (NSDictionary *)dic {
//    NSLog(@"VCDictionary: %@", dic);
//}
//

# pragma mark Reload interface fields
//- (void)reloadData {
//    [transactionsView reloadData];
//    self.lblTotBalance.text = [NSString stringWithFormat:@"%.02f", self.totalBalance];
//    self.lblAccBalance.text = [NSString stringWithFormat:@"%.02f", self.accBalance];
//    self.lblCashBalance.text = [NSString stringWithFormat:@"%.02f", self.cashBalance];
//    self.lblSavBalance.text = [NSString stringWithFormat:@"%.02f", self.savingBalance];
//}

@end
