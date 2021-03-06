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

@interface SecondTableViewController : UITableViewController <passFactorName>


@property (nonatomic, weak) id<FactorDegreeSelected> delegate;

@property (nonatomic, strong) NSString *factorName;

@property (weak, nonatomic) IBOutlet UILabel *instructions;

@property(strong)  NSIndexPath* lastIndexPath;

- (IBAction)Help:(UIBarButtonItem *)sender;


@end

