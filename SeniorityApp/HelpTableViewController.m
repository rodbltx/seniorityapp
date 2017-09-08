//
//  HelpTableViewController.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/24/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import "HelpTableViewController.h"

@interface HelpTableViewController (){


NSMutableDictionary *helpTips;
NSDictionary *factorsDict;
NSString *helpTipSelected;
}

@end

@implementation HelpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    helpTips = [[NSMutableDictionary alloc] init];
    [self loadJsonData];
    
    [_helpTipLabel setNumberOfLines:0];
    [_helpTipLabel sizeToFit];
    

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

- (void)loadJsonData {
    NSError *error = nil;
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"factors" ofType:@"json"];
    
    NSData *responseData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    
    factorsDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    if(factorsDict){
        
        for (id factorDict in [factorsDict objectForKey:@"factors"]){
            NSString *factorName = [factorDict objectForKey:@"factor"];
            NSString *helpTip = [factorDict objectForKey:@"help"];
            [helpTips setValue:helpTip forKey:factorName];
        }
        
        helpTipSelected = [helpTips objectForKey:_factorName];
        
        _helpTipLabel.text = helpTipSelected;
    }
    
}


@end
