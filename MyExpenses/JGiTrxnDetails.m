//
//  JGiTrxnDetails.m
//  MyExpenses
//
//  Created by jio on 20/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import "JGiTrxnDetails.h"

@interface JGiTrxnDetails ()

@end

@implementation JGiTrxnDetails

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
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* Set the TableView's delegate and datasource properties. This will allow the DataViewController to recieve messages from the UITableViewDelegate and UITableViewDataSource */
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /* Use a switch statement to update the cell's properties based on the current row in the TableView. */
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"%@", self.trxnObject.trxndate];
            break;
        case 1:
            cell.textLabel.text = self.trxnObject.account;
            break;
        case 2:
            cell.textLabel.text = self.trxnObject.category;
            break;
        case 3:
            cell.textLabel.text = self.trxnObject.title;
            break;
        case 4:
            cell.textLabel.text = [NSString stringWithFormat:@"%.02f", self.trxnObject.amount];
            break;
        default:
            break;
    }
    
    return cell;
}

/* The TableView will have 8 rows. */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
