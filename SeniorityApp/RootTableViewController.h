//
//  RootTableViewController.h
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/3/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondTableViewController.h"
#import "ResultTableViewController.h"


@interface RootTableViewController : UITableViewController <FactorDegreeSelected>

@property(nonatomic,strong)NSString *factorDegreeString;
@property(nonatomic,strong)NSArray *factorDegreeArray;

@property (weak, nonatomic) IBOutlet UILabel *points;

@end


//- (IBAction)calculate:(UIBarButtonItem *)sender;
