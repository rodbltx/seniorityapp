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

    
    factorsDegreeValues = [[NSMutableDictionary alloc] init];
    
    imageNameArray = [NSMutableArray arrayWithArray:@[@"image1",@"image2",@"image3",@"image4",@"image5",@"image6",@"image7"]];
    
    
    
    //   factors = [NSArray arrayWithObjects:@"Formal Education",@"Experience", @"Management", @"Communication",@"Technical Skills",@"Leadership experience",@"Empowerment",  nil];

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
        
        SecondTableViewController *destViewController = segue.destinationViewController;
        destViewController.delegate = self;
        destViewController.factorName = [factors objectAtIndex:selectedIndexPath.row];
        destViewController.title = destViewController.factorName;

    }
    
    
    if ([[segue identifier]isEqualToString:@"showResults"]) {
        ResultTableViewController *resultViewController = segue.destinationViewController;
        
        resultViewController.delegate = self;
        resultViewController.factorsDegreeValues = factorsDegreeValues;
        resultViewController.factors = factors;
     //   NSLog(@"%@", factorsDegreeValues);
        

    }
   
}

#pragma mark - Protocol Methods

-(void)setFactorDegree:(NSString*)factorDegree{
    
    _factorDegreeString = factorDegree;

}


-(void)setFactorArray:(NSArray*)factorArray{
    
    _factorDegreeArray = factorArray;

    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];

    cell.detailTextLabel.text = [_factorDegreeArray objectAtIndex:0];
  
    [factorsDegreeValues setObject:[_factorDegreeArray objectAtIndex:1] forKey:cell.textLabel.text];
    
    
}


//- (IBAction)calculate:(UIBarButtonItem *)sender {}

//-(void)setFactorDegreeValueOnArray:(NSInteger)factorDegreeValue{}




@end


