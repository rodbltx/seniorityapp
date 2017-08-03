//
//  ResultTableViewController.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/25/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultTableViewController.h"


@interface ResultTableViewController () {
    NSArray *factors;
    NSArray * allKeys;
    NSArray *allValues;
    
    NSMutableDictionary *factorsDegreeValues;
}
    
@end

@implementation ResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", _factorsDegreeValues);
    
    allKeys = [_factorsDegreeValues allKeys];
    allValues = [_factorsDegreeValues allValues];
    _points.text = [NSString stringWithFormat:@"This is the Summary Results for this employee:"];

 
    NSLog(@"Count : %d", [allKeys count]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
      return [allKeys count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *simpleTableIdentifier = @"ResultsCell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
 
    [cell.textLabel setText:[allKeys objectAtIndex:indexPath.row]];
    
    NSString *factorKey = [allKeys objectAtIndex:indexPath.row];
    int factorValue = [[allValues objectAtIndex:indexPath.row] integerValue];
    
 
    if ([factorKey isEqualToString:@"Formal Education"]){
        factorValue = factorValue * 5;
    }
    if ([factorKey isEqualToString:@"Experience"]){
        factorValue = factorValue * 20;
    }
    if ([factorKey isEqualToString:@"Management"]){
        factorValue = factorValue * 20;
    }
    if ([factorKey isEqualToString:@"Communication"]){
        factorValue = factorValue * 15;
    }
    if ([factorKey isEqualToString:@"Technical Skills"]){
        factorValue = factorValue * 20;
    }
    if ([factorKey isEqualToString:@"Leadership experience"]){
        factorValue = factorValue * 10;
    }
    if ([factorKey isEqualToString:@"Empowerment"]){
        factorValue = factorValue * 10;
    }
    
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d",factorValue]];
    
     NSLog(@"%@", [allValues objectAtIndex:indexPath.row]);
     return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier]isEqualToString:@"showSeniority"]) {
        SeniorityTableViewController *seniorityViewController = segue.destinationViewController;
        seniorityViewController.delegate = self;
        seniorityViewController.factorsDegreeValues = _factorsDegreeValues;
    }
    
}



- (IBAction)calculate:(UIBarButtonItem *)sender {
}
@end
