//
//  HelpTableViewController.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/24/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import "HelpTableViewController.h"

@interface HelpTableViewController (){

//NSMutableArray *helpTips;
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
//         NSLog(@"helpTipSelected - %@", helpTipSelected);
        
        _helpTipLabel.text = helpTipSelected;
    }
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
