//
//  JGiTransactions.h
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JGiTrxnCategory.h"

#define TRXNDATE @"Transaction Date"
#define TRXNAMT @"Transaction Amount"
#define TRXNTITLE @"Transaction Title"
#define TRXNCATEGORY @"Transaction Category"
#define TRXNACCOUNT @"Transaction Account"

@interface JGiTransactions : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic) float amount;
@property (nonatomic) time_t date;
@property (nonatomic, strong) JGiTrxnCategory *Category;


@end
