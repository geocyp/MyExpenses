//
//  JGiTransactions.h
//  MyExpenses
//
//  Created by jio on 13/09/14.
//  Copyright (c) 2014 Jio Gi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGiTransactions : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic) float amount;
@property (nonatomic, strong) NSDate *trxndate;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *account;

@end
