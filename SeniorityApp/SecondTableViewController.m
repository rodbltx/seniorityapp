//
//  SecondTableViewController.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/3/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController {
    NSArray *formalEducation;
    NSArray *experience;
    NSArray *management;
    NSArray *communication;
    NSArray *technicalSkills;
    NSArray *leadershipExperience;
    NSArray *empowerment;
    NSArray *elements;
    
    NSInteger elementId;
    
    HelpTableViewController *destViewController;

}


@synthesize delegate, factorDegreeString, factorDegreeArray;

- (id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    formalEducation = @[@[@"Incomplete tertiary education",@1],@[@"Complete tertiary education, incomplete Bachelor level",@2],@[@"Bachelor",@3],@[@"Graduated + specialization",@5],@[@"Master",@6]];
    
    experience = @[@[@"Without experience.",@0],@[@"1 or more year of experience.",@1],@[@"2 or more year of experience.",@2],@[@"3 or more year of experience.",@3],@[@"4 or more year of experience.",@4],@[@"5 or more year of experience.",@5],@[@"7 or more year of experience.",@6],@[@"9 or more year of experience.",@7],@[@"11 or more year of experience.",@8],@[@"13 or more year of experience.",@9],@[@"15 or more year of experience.",@10]];
    
    management = @[@[@"Tasks are assigned objetively",@0],@[@"Tasks are assigned through an issue tracker",@1],@[@"Receives a list of tasks and can prioritize them",@2],@[@"Participates actively in planning meetings",@3]];
    
    communication = @[@[@"Basic Interaction: Only participates as receiver and not sender of communications",@1],@[@"Basic interaction: In the scrums (reporting own tasks)",@2],@[@"Frequent contact with the client",@3],@[@"Operational roles with outstanding management of communcation issues",@4]];
    
    technicalSkills = @[@[@"Has little knowledge of programming tasks",@1],@[@"Knows some programming language",@2],@[@"Knows and uses som of the best known namespaces/packages",@3],@[@"Has a good knowledge of the namespaces/packages provided natively",@4]];
    
    leadershipExperience = @[@[@"Without experience.",@0],@[@"1 or more year of experience.",@1],@[@"2 or more year of experience.",@2],@[@"3 or more year of experience.",@3],@[@"4 or more year of experience.",@5],@[@"5 or more year of experience.",@6],@[@"7 or more year of experience.",@7],@[@"9 or more year of experience.",@8],@[@"11 or more year of experience.",@9],@[@"13 or more year of experience.",@10],@[@"15 or more year of experience.",@10]];
    empowerment = @[@[@"High",@3],@[@"Medium",@2],@[@"Low",@1]];
    elements = @[formalEducation,experience,management,communication,technicalSkills,leadershipExperience,empowerment];
    
    _instructions.text = [NSString stringWithFormat:@"Select the %s option for this employee:", [_factorName UTF8String]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if ([_factorName isEqualToString:@"Formal Education"]){
        elementId = 0;
        return [elements[(int)elementId] count];
    }
    if ([_factorName isEqualToString:@"Experience"]){
        elementId = 1;
        return [elements[(int)elementId] count];
    }
    if ([_factorName isEqualToString:@"Management"]){
        elementId = 2;
        return [elements[(int)elementId] count];
    }
    if ([_factorName isEqualToString:@"Communication"]){
        elementId = 3;
        return [elements[(int)elementId] count];
    }
    if ([_factorName isEqualToString:@"Technical Skills"]){
        elementId = 4;
        return [elements[(int)elementId] count];
    }
    if ([_factorName isEqualToString:@"Leadership Experience"]){
        elementId = 5;
        return [elements[(int)elementId] count];
    }
    if ([_factorName isEqualToString:@"Empowerment"]){
        elementId = 6;
        return [elements[(int)elementId] count];
    }
 
    return 0;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *simpleTableIdentifier = @"DetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    if ([_factorName isEqualToString:@"Formal Education"]){
        cell.textLabel.text = [[formalEducation objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    if ([_factorName isEqualToString:@"Experience"]){
        cell.textLabel.text = [[experience objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    if ([_factorName isEqualToString:@"Management"]){
        cell.textLabel.text = [[management objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    if ([_factorName isEqualToString:@"Communication"]){
        cell.textLabel.text = [[communication objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    if ([_factorName isEqualToString:@"Technical Skills"]){
        cell.textLabel.text = [[technicalSkills objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    if ([_factorName isEqualToString:@"Leadership Experience"]){
        cell.textLabel.text = [[leadershipExperience objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    if ([_factorName isEqualToString:@"Empowerment"]){
        cell.textLabel.text = [[empowerment objectAtIndex:indexPath.row] objectAtIndex:0];
    }
    
    return cell;

    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    factorDegreeArray = [elements[(int)elementId] objectAtIndex:indexPath.row];
                         
    factorDegreeString = [[elements[(int)elementId] objectAtIndex:indexPath.row] objectAtIndex:0];
    
    [[self delegate]setFactorDegree:factorDegreeString];
    [[self delegate]setFactorArray:factorDegreeArray];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end





