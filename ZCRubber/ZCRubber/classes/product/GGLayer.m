//
//  GGLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GGLayer.h"
#import "CCUIViewWrapper.h"
#import "ScrollViewLayer.h"


@implementation GGLayer
@synthesize wheelId;
- (id) init {
    self = [super init];
    if(self != nil) {
//        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        

//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tbody.png"]];
//        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(-200, -600, 400, imageView.image.size.height)];
//        scrollView.contentSize = CGSizeMake(600, 400);
//        [scrollView addSubview:imageView];
//        CCUIViewWrapper *wrapper = [CCUIViewWrapper wrapperForUIView:imageView];
//        [wrapper setRotation:90];
//        ScrollViewLayer *layer = [ScrollViewLayer node];
//        [layer initWithFile:@"theader.png" :@"tbody.png" :400.0 ];
//        [layer setTablePostion:ccp(screenSize.width/2, screenSize.height/2)];
//        [self addChild:layer];
    }
    return self;
}

-(void) initWithWheelId:(NSString *) wheelId {
    self.wheelId = wheelId;
    NSString *header = @"header.png";
    if ([wheelId isEqualToString:@"SU317"] || [wheelId isEqualToString:@"SL369"]) {
        header = @"header_2.png";
    }
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    ScrollViewLayer *layer = [ScrollViewLayer node];
    [layer initWithFile:header : [wheelId stringByAppendingFormat:@"_gg.png"] :550 ];
    [layer setTablePostion:ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:layer];

    
    //[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return TRUE;
}


@end
