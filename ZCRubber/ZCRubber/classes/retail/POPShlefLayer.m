//
//  POPShlefLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "POPShlefLayer.h"


@implementation POPShlefLayer
-(id) init {
    if((self = [super init])) {
        dic4IndexAndImageName = [[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"ls_1.png",[NSNumber numberWithInt: 0],
                                  @"ls_2.png",[NSNumber numberWithInt: 1],
                                  @"ls_3.png",[NSNumber numberWithInt: 2],
                                  @"ls_4.png",[NSNumber numberWithInt: 3],nil] retain];
        [self buildWtihImagePrefix:@"ls_s_" dic:dic4IndexAndImageName];
    }
    //self.isTouchEnabled = YES;
    //[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    return self;
    
}
@end
