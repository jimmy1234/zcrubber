//
//  HWLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-11.
//
//

#import "HWLayer.h"
#define TAG 1001

@implementation HWLayer
@synthesize backgroundImage,wheelId,lastMenuItem,preTag;
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
    backgroundImage = [CCSprite spriteWithFile:hwFile];
    backgroundImage.position = ccp(screenSize.width/2, backgroundImage.contentSize.height/2);
    [self addChild:backgroundImage z:0 tag:TAG];
    [self buildMenu];
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
}

-(void) buildMenu {
    if ([wheelId isEqualToString :@"RP26"]) {
        CCMenuItemImage  *btnItem1 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                             selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button1Tapped:)];
        btnItem1.position = ccp(390, 400);
        CCMenuItemImage  *btnItem2 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                             selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button2Tapped:)];
        btnItem2.position = ccp(540, 570);
        
        CCMenuItemImage  *btnItem3 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button3Tapped:)];
        btnItem3.position = ccp(370, 250);
        CCMenu *menu = [CCMenu menuWithItems:btnItem1, btnItem2, btnItem3, nil];
        menu.anchorPoint = ccp(0, 0);
        menu.position = ccp(0, 0);
        [self addChild:menu z:1];
        
    } else if([wheelId isEqualToString :@"SL369"]) {
        CCMenuItemImage  *btnItem1 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button1Tapped:)];
        btnItem1.position = ccp(390, 400);
        
        CCMenuItemImage  *btnItem2 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button2Tapped:)];
        btnItem2.position = ccp(540, 570);
        
        CCMenuItemImage  *btnItem3 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button3Tapped:)];
        btnItem3.position = ccp(370, 250);
        
        CCMenuItemImage  *btnItem4 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button4Tapped:)];
        btnItem4.position = ccp(390, 400);
        
        CCMenuItemImage  *btnItem5 = [CCMenuItemImage itemFromNormalImage:@"bluebtn1.png"
                                                            selectedImage:@"bluebtn2.png" disabledImage:@"bluebtn2.png" target:self selector:@selector(button5Tapped:)];
        btnItem5.position = ccp(540, 570);
        CCMenu *menu = [CCMenu menuWithItems:btnItem1, btnItem2, btnItem3, btnItem4,btnItem5,nil];
        menu.anchorPoint = ccp(0, 0);
        menu.position = ccp(0, 0);
        [self addChild:menu z:1];
        
    }

}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return TRUE;
}


-(void) button1Tapped:(id) sender {
    
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw1.png"]];
    [self changeMenuItemState:(CCMenuItem *)sender newSprite:sprite];

}

-(void) button2Tapped:(id) sender {
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw2.png"]];
    [self changeMenuItemState:(CCMenuItem *)sender newSprite:sprite];
}

-(void) button3Tapped:(id) sender {
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw3.png"]];
    [self changeMenuItemState:(CCMenuItem *)sender newSprite:sprite];
}

-(void) button4Tapped:(id) sender {
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw4.png"]];
    [self changeMenuItemState:(CCMenuItem *)sender newSprite:sprite];
}

-(void) button5Tapped:(id) sender {
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw5.png"]];
    [self changeMenuItemState:(CCMenuItem *)sender newSprite:sprite];
}

-(void)changeMenuItemState:(CCMenuItem *) newMenuItem newSprite:(CCSprite *)newSprite {
    [self removeChildByTag:TAG cleanup:YES];
    if(lastMenuItem != nil) {
        [lastMenuItem setIsEnabled:YES];
    }
    [newMenuItem setIsEnabled:NO];
    lastMenuItem = newMenuItem;
    [self addChild:newSprite z:0 tag:TAG];
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    newSprite.position=ccp(screenSize.width/2, newSprite.contentSize.height/2);
}

@end
