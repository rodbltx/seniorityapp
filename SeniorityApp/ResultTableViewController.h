//
//  ResultTableViewController.h
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/25/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultDataInfo.h"
#import "SeniorityTableViewController.h"

@interface ResultTableViewController : UITableViewController <ResultDataInfo>

    @property (nonatomic, weak) id<ResultDataInfo> delegate;

    @property (weak, nonatomic) IBOutlet UILabel *summaryComment;
 
    @property(nonatomic,strong)NSMutableArray *factors;
    @property(nonatomic,strong)NSMutableDictionary *factorsDegreeValues;


@end
