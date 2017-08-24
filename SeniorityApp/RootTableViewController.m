//
//  RootTableViewController.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/3/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import "RootTableViewController.h"
#import "ItemImageCell.h"



@interface RootTableViewController ()  {
    NSMutableArray *factors;
    NSDictionary *factorsDict;
    
    NSMutableArray *imageNameArray;
    NSIndexPath *selectedIndexPath;
    
    NSMutableDictionary *factorsDegreeValues;

}

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadJsonData];

    _calculateButton.enabled = NO;
    
    
    factorsDegreeValues = [[NSMutableDictionary alloc] init];
    
    _factorDetailIndexPath2 = [[NSMutableDictionary alloc] init];
    
   NSLog(@"dicionario: %@", _factorDetailIndexPath2);


    imageNameArray = [NSMutableArray arrayWithArray:@[@"image1",@"image2",@"image3",@"image4",@"image5",@"image6",@"image7"]];
    

}


- (void)loadJsonData {
    NSError *error = nil;
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"factors" ofType:@"json"];
    
    NSData *responseData = [[NSData alloc] initWithContentsOfFile:jsonPath];

    factorsDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    
    if(factorsDict){
        factors = [NSMutableArray array];
        for (id factorDict in [factorsDict objectForKey:@"factors"]){
            NSString *factorName = [factorDict objectForKey:@"factor"];
            [factors addObject:factorName];
        }
     // NSLog(@"JSON: %@", factors);
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return factors.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"FactorCell";
   
    ItemImageCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil){
        cell = [[ItemImageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
        
    }
    
    
    cell.textLabel.text = [factors objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:imageNameArray[indexPath.row]];

    
    return cell;
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArrayDetail"]) {
        
        selectedIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *factorName = [factors objectAtIndex:selectedIndexPath.row];
        
        SecondTableViewController *destViewController = segue.destinationViewController;
        destViewController.delegate = self;
        destViewController.factorName = factorName;
        destViewController.title = destViewController.factorName;
        
       // destViewController.lastIndexPath = _factorDetailIndexPath;
        destViewController.lastIndexPath = [_factorDetailIndexPath2 objectForKey:factorName] ;
        
    }
    
    
    if ([[segue identifier]isEqualToString:@"showResults"]) {
        ResultTableViewController *resultViewController = segue.destinationViewController;
        
        resultViewController.delegate = self;
        resultViewController.factorsDegreeValues = factorsDegreeValues;
        resultViewController.factors = factors;
        

    }
   
}

#pragma mark - Protocol Methods

-(void)setFactorDegree:(NSString*)factorDegree{
    
    _factorDegreeString = factorDegree;

}

-(void)setFactorDetailIndexPath:(NSIndexPath*)factorDetailIndexPath{
    
    _factorDetailIndexPath = factorDetailIndexPath;
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];
    
    [_factorDetailIndexPath2 setObject:_factorDetailIndexPath forKey:cell.textLabel.text];
    


}


-(void)setFactorArray:(NSArray*)factorArray{
    
    _factorDegreeArray = factorArray;

    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];

    cell.detailTextLabel.text = [_factorDegreeArray objectAtIndex:0];
  
    [factorsDegreeValues setObject:[_factorDegreeArray objectAtIndex:1] forKey:cell.textLabel.text];
    
    if ([factorsDegreeValues count]==7){
        
        _calculateButton.enabled = YES;
        [self resetTableViewContents];

    }
    

    
}

-(int)calulateTableViewRows{
    int sections = [self.tableView numberOfSections];
    int rows = 0;
 
    for(int i=0; i < sections; i++)
    {
        rows += [self.tableView numberOfRowsInSection:i];
    }

    return rows;
 }

-(void)resetTableViewContents{
    UITableViewCell *cell;
    NSIndexPath *index;
    int rows = [self calulateTableViewRows];
    
    for (int i = 0 ; i < rows; i++) {
        index = [NSIndexPath indexPathForRow:i inSection:0];
        cell = [self.tableView cellForRowAtIndexPath:index];
        cell.detailTextLabel.text = @"";
    }

    [self viewDidLoad];
    //NSLog(@"rows : %d", rows);
}

@end


