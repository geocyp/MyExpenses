//
//  JGiNewRecordTableViewController.m
//  MyExpenses
//
//  Created by jio on 14/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import "JGiNewRecordViewController.h"

@interface JGiNewRecordViewController ()

@end

@implementation JGiNewRecordViewController
//@synthesize dicData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"JGiNewRecord-Init");
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Add Objects delegate

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    JGiTransactions *newTrxnsObject = [self returnNewTrxnObject];
    [self.delegate addObject:newTrxnsObject];
}

-(JGiTransactions *)returnNewTrxnObject
{
    JGiTransactions *addedTrxnObject = [[JGiTransactions alloc] init];
    addedTrxnObject.title = self.titleTextField.text;
    addedTrxnObject.amount = [self.amountTextField.text floatValue];
    return addedTrxnObject;
}

@end
