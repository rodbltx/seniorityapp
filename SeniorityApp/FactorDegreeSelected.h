//
//  FactorDegreeSelected.h
//  PushingTableViews
//
//  Created by Rodrigo Salas C on 7/12/17.
//  Copyright © 2017 Belatrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FactorDegreeSelected <NSObject>

-(void)setFactorDegree:(NSString*)factorDegree;
-(void)setFactorArray:(NSArray*)factorArray;
-(void)setFactorDetailIndexPath:(NSIndexPath*)factorDetailIndexPath;
-(int)calulateTableViewRows;



@end
