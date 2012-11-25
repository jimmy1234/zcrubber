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
    backgroundImage.position = ccp(screenSize.width/2, 124);
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
    
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw1.png"]];
    [self changeMenuItemState:(CCMenuItem *)sender newSprite:sprite];

}

-(void) button2Tapped:(id) sender {
    CCSprite *sprite = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat:@"_hw2.png"]];
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
