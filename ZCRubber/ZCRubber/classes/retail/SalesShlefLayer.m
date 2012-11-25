//
//  SalesShlefLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-20.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SalesShlefLayer.h"


@implementation SalesShlefLayer
-(id) init {
    if((self = [super init])) {
        dic4IndexAndImageName = [[NSMutableDictionary dictionaryWithObjectsAndKeys:
                          @"cx_1.png",[NSNumber numberWithInt: 0],
                          @"cx_2.png",[NSNumber numberWithInt: 1],nil] retain];
        [self buildWtihImagePrefix:@"cx_s_" dic:dic4IndexAndImageName];
    }
    //self.isTouchEnabled = YES;
    //[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    return self;
    
}
@end
