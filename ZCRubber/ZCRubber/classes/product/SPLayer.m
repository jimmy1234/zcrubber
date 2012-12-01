//
//  SPLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SPLayer.h"
#import "ScrollViewLayer.h"


@implementation SPLayer
@synthesize wheelId;
- (id) init {
    self = [super init];
    if(self != nil) {
        
    }
    return self;
}

-(void)initWithWheelId:(NSString *)wheelId{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    ScrollViewLayer *layer = [ScrollViewLayer node];
    NSString *headerFile = @"header_sp.png";
    NSString *bodyFile = [wheelId stringByAppendingFormat:@"_body.png"];
    [layer initWithFile:headerFile :bodyFile :550.0 ];
    [layer setTablePostion:ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:layer];
}

@end
