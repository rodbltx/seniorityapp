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


@property(strong) NSIndexPath *factorDetailIndexPath;

@property (strong, nonatomic) NSMutableDictionary *factorDetailIndexPath2;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *calculateButton;

@end



