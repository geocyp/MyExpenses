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


- (NSMutableArray *)addedTrxns
{
    if (!_addedTrxns) {
        _addedTrxns = [[NSMutableArray alloc] init];
    }
    return _addedTrxns;
}


# pragma mark - Original Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
        JGiTransactions *selectedObject = self.addedTrxns[path.row];
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

-(void)addObject:(JGiTransactions *)trxnsObject
{
    [self.addedTrxns addObject:trxnsObject];
    [self dismissViewControllerAnimated:YES completion:nil];
}



# pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.addedTrxns count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    JGiTransactions *trxn = [self.addedTrxns objectAtIndex:indexPath.row];
    cell.textLabel.text = trxn.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", trxn.amount];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push trxndetails" sender:indexPath];
}

# pragma mark Print Array and Dictionary
- (void)printArray:(NSMutableArray *)array {
    for (NSString *string in array) {
        NSLog(@"Transactions Array: %@", string);
    }
}

@end
