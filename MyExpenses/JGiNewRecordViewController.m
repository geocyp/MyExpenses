//
//  JGiNewRecordViewController.m
//  MyExpenses
//
//  Created by jio on 14/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import "JGiNewRecordViewController.h"
#import "JGiTransactions.h"

@interface JGiNewRecordViewController ()

@end

@implementation JGiNewRecordViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"JGiNewRecord-viewDidLoad");

    // initialize variables
    allTrxnsTitle = [[NSMutableArray alloc] init];
    allTrxnsAmount = [[NSMutableArray alloc] init];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnRecordItem:(UIButton *)sender {
    JGiTransactions *trxn = [[JGiTransactions alloc] init];
    JGiTrxnCategory *trxnCat = [[JGiTrxnCategory alloc] init];
    JGiAccounts *trxnAcc = [[JGiAccounts alloc] init];
    
    NSDictionary *dicTrxns = [[NSDictionary alloc] init];
    NSDate *currDate = [NSDate date];
    
    trxn.trxndate = currDate;
    trxnAcc.name = [self.txtAccount text];
    trxnCat.title = [self.txtCategory text];
    trxn.title = [self.txtTitle text];
    trxn.amount = [NSNumber numberWithFloat: [[self.txtAmount text] floatValue]];
    
    float amountInFloat = [trxn.amount floatValue];
    self.accBalance += amountInFloat;
    
    dicTrxns = @{ TRXNDATE : trxn.trxndate,
                  TRXNAMT : trxn.amount,
                  TRXNTITLE : trxn.title,
                  TRXNCATEGORY : trxnCat.title,
                  TRXNACCOUNT : trxnAcc.name };
    
    [allTrxnsTitle addObject:[NSString stringWithFormat:@"%@", trxn.title]];
    [allTrxnsAmount addObject:[NSString stringWithFormat:@"%.02f", amountInFloat]];
    
    trxn = nil;
    trxnAcc = nil;
    trxnCat = nil;
    
    self.totalBalance = self.accBalance + self.cashBalance;
}



- (void)printArray:(NSMutableArray *)array {
    for (NSString *string in array) {
        NSLog(@"Transactions Array: %@", string);
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // in order to enable push data, define destinationViewController
    JGiViewController *nextView = segue.destinationViewController;
    if ([sender tag] == 201) {
        nextView.totalBalance = self.totalBalance;
        nextView.accBalance = self.accBalance;
        nextView.cashBalance = self.cashBalance;
        nextView.savingBalance = self.savingBalance;
    }
    else {
        NSLog(@"Sender: %@", sender);
    }
}



@end
