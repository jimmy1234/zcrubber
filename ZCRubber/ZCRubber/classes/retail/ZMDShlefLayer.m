//
//  ZMDShlefLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZMDShlefLayer.h"


@implementation ZMDShlefLayer
@synthesize d2Layer,d3Layer;
-(id) init {
    if((self = [super init])) {

        [self initD2Layer];
        [self initMenu];
        
    }
    return self;
}

-(void) initD2Layer{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    CCLayer *layer1 = [CCLayer node];
    CCSprite *sprite1 = [CCSprite spriteWithFile:@"cy_2d.png"];
    sprite1.position = ccp(screenSize.width/2, screenSize.height/2);
    [layer1 addChild:sprite1];
    
    CCLayer *layer2 = [CCLayer node];
    CCSprite *sprite2 = [CCSprite spriteWithFile:@"hy_2d.png"];
    sprite2.position = ccp(screenSize.width/2, screenSize.height/2);
    [layer2 addChild:sprite2];
    
    CCLayer *layer3 = [CCLayer node];
    CCSprite *sprite3 = [CCSprite spriteWithFile:@"ws_2d.png"];
    sprite3.position = ccp(screenSize.width/2, screenSize.height/2);
    [layer3 addChild:sprite3];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:layer1,layer2,layer3, nil];
    d2Layer = [CCScrollLayer nodeWithLayers:array widthOffset:0];
    [self addChild:d2Layer];
}

-(void) initD3Layer{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    CCLayer *layer1 = [CCLayer node];
    CCSprite *sprite1 = [CCSprite spriteWithFile:@"cy_3d.png"];
    sprite1.position = ccp(screenSize.width/2, screenSize.height/2);
    [layer1 addChild:sprite1];
    
    CCLayer *layer2 = [CCLayer node];
    CCSprite *sprite2 = [CCSprite spriteWithFile:@"hy_3d.png"];
    sprite2.position = ccp(screenSize.width/2, screenSize.height/2);
    [layer2 addChild:sprite2];
    
    CCLayer *layer3 = [CCLayer node];
    CCSprite *sprite3 = [CCSprite spriteWithFile:@"ws_3d.png"];
    sprite3.position = ccp(screenSize.width/2, screenSize.height/2);
    [layer3 addChild:sprite3];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:layer1,layer2,layer3, nil];
    d3Layer = [CCScrollLayer nodeWithLayers:array widthOffset:0];
    
    [self addChild:d3Layer];
}

- (void) initMenu {
    
    
    CCMenuItem *storeMenuItem = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png" selectedImage:@"bluebtn1.png" target:self selector:@selector(d2ButtonTapped:)];
    storeMenuItem.position = CGPointMake(500, 650);
    
    CCMenuItem *popMenuItem = [CCMenuItemImage itemFromNormalImage:@"bluebtn2.png" selectedImage:@"bluebtn1.png" target:self selector:@selector(d3ButtonTapped:)];
    popMenuItem.position = CGPointMake(550, 650);
    
    
    
    CCMenu *menu = [CCMenu menuWithItems:storeMenuItem, popMenuItem, nil];
    menu.position = CGPointMake(0, 0);
    [self addChild:menu z:3 tag:20];
    
}

-(void) d2ButtonTapped:(id) sender {
    NSInteger index = d3Layer.currentScreen;
    [self removeChild:d3Layer cleanup:YES];
    [self initD2Layer];
    [d2Layer selectPage:index];
}

-(void) d3ButtonTapped:(id) sender {
    NSInteger index = d2Layer.currentScreen;
    [self removeChild:d2Layer cleanup:YES];
    [self initD3Layer];
    [d3Layer selectPage:index];
    
}


@end
