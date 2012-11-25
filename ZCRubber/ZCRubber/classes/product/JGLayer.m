//
//  JGLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "JGLayer.h"


@implementation JGLayer
@synthesize wheelId,lastMenuItem;
- (id) init {
    self = [super init];
    if(self != nil) {
        
        
    }
    return self;
}

-(void) initWithWheelId:(NSString *) wheelId {
    self.wheelId = wheelId;
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    NSString *hwFile = [wheelId stringByAppendingFormat:@"_hw0.png"];
    CCSprite *backgroundImage = [CCSprite spriteWithFile:hwFile];
    backgroundImage.position = ccp(screenSize.width/2, 320);
    [self addChild:backgroundImage z:0 tag:10];
    [self buildMenu];
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
}

-(void) buildMenu {
    if ([wheelId isEqualToString :@"rp26"]) {
        CCMenuItemImage  *btnItem1 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button1Tapped:)];
        btnItem1.position = ccp(410, 30);
        CCMenuItemImage  *btnItem2 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button2Tapped:)];
        btnItem2.position = ccp(420, 340);
        
        CCMenu *menu = [CCMenu menuWithItems:btnItem1, btnItem2, nil];
        menu.anchorPoint = ccp(0, 0);
        menu.position = ccp(0, 0);
        [self addChild:menu z:1];
        
    }
    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return TRUE;
}


-(void) button1Tapped:(id) sender {
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void) button2Tapped:(id) sender {
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void)changeMenuItemState:(CCMenuItem *) newMenuItem {
    if(lastMenuItem != nil) {
        [lastMenuItem setIsEnabled:YES];
    }
    [newMenuItem setIsEnabled:NO];
    lastMenuItem = newMenuItem;
}

@end
