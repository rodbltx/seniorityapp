//
//  SeniorityTableViewController.h
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 8/2/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeniorityDataInfo.h"

@interface SeniorityTableViewController : UITableViewController <SeniorityDataInfo>

@property (nonatomic, weak) id<SeniorityDataInfo> delegate;

@property(nonatomic,strong)NSMutableDictionary *factorsDegreeValues;
@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UILabel *category;

@end
