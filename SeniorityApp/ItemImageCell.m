//
//  ItemImageCell.m
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/23/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ItemImageCell.h"




@implementation ItemImageCell
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, 10, 10);
}

@end
