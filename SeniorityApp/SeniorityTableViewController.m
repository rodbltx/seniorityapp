//
//  SeniorityTableViewController.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 8/2/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import "SeniorityTableViewController.h"

@interface SeniorityTableViewController ()



@end

@implementation SeniorityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self calculateScore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (void)calculateScore {
    
    int result=0;
    for (NSString* key in [_factorsDegreeValues allKeys]) {
        int value = [[_factorsDegreeValues objectForKey:key]integerValue];
        
        if ([key isEqualToString:@"Formal Education"]){
            value = value * 5;
        }
        if ([key isEqualToString:@"Experience"]){
            value = value * 20;
        }
        if ([key isEqualToString:@"Management"]){
            value = value * 20;
        }
        if ([key isEqualToString:@"Communication"]){
            value = value * 15;
        }
        if ([key isEqualToString:@"Technical Skills"]){
            value = value * 20;
        }
        if ([key isEqualToString:@"Leadership experience"]){
            value = value * 10;
        }
        if ([key isEqualToString:@"Empowerment"]){
            value = value * 10;
        }
        
        result = result + value;
        
    }
    
    NSLog(@"%u", result);
    
    _points.text = [NSString stringWithFormat:@"Score: %d", result];
    
    _category.text = [NSString stringWithFormat:@"Seniority level: Eng 1"];
    if(result > 105 && result <= 180){
        _category.text = [NSString stringWithFormat:@"Seniority level: Eng 2"];
    }
    if(result > 180 && result <= 265){
        _category.text = [NSString stringWithFormat:@"Seniority level: Eng 3"];
    }
    if(result > 265 && result <= 395){
        _category.text = [NSString stringWithFormat:@"Seniority level: SR A"];
    }
    if(result > 395 && result <= 460){
        _category.text = [NSString stringWithFormat:@"Seniority level: SR B"];
    }
    if(result > 460 && result <= 535){
        _category.text = [NSString stringWithFormat:@"Seniority level: SR C / SME A"];
    }
    if(result > 535 && result <= 660){
        _category.text = [NSString stringWithFormat:@"Seniority level: SR D / SME B"];
    }
    if(result > 660 && result <= 750){
        _category.text = [NSString stringWithFormat:@"Seniority level: LD A"];
    }
    
}



@end
