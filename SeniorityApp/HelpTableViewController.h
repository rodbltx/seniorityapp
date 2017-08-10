//
//  HelpTableViewController.h
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/24/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passFactorName <NSObject>
@end

@interface HelpTableViewController : UITableViewController
@property (nonatomic, weak) id<passFactorName> delegate;
@property (nonatomic, strong) NSString *factorName;

@property (weak, nonatomic) IBOutlet UILabel *helpTipLabel;

@end
