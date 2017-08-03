//
//  SecondTableViewController.h
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/3/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FactorDegreeSelected.h"
#import "HelpTableViewController.h"

@interface SecondTableViewController : UITableViewController


@property (nonatomic, weak) id<FactorDegreeSelected> delegate;

@property (nonatomic, strong) NSString *factorName;

@property(nonatomic,strong)NSString *factorDegreeString;
@property(nonatomic,strong)NSArray *factorDegreeArray;

@property (weak, nonatomic) IBOutlet UILabel *instructions;


- (IBAction)Help:(UIBarButtonItem *)sender;


@end

