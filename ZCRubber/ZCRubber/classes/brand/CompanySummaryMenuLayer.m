#import "CompanySummaryMenuLayer.h"

@implementation CompanySummaryMenuLayer

@synthesize parentLayer;

-(id) init {
    if((self = [super init])) {
        NSLog(@"menuPara init");
        NSArray *resources = [NSArray  arrayWithObjects:
                                   [NSArray arrayWithObjects:@"brand_button_driftRace_hover.png|100|100", @"brand_button_driftRace.png|200|500", nil],
                                   [NSArray arrayWithObjects:@"brand_button_summary_hover.png|400|100", @"brand_button_summary.png|500|500", nil],
                                   [NSArray arrayWithObjects:@"brand_button_video_hover.png|700|100", @"brand_button_video.png|800|500", nil], 
                                   nil];
        
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"brand_summary_bg.png"];
        background.position = ccp(screenSize.width/2, screenSize.height/2);
        [self addChild:background];        
        
        CCMenuItem *chaMenuItem = [CCMenuItemImage itemFromNormalImage:@"cha.png" selectedImage:@"cha.png" target:self selector:@selector(closeButton:)];
        chaMenuItem.anchorPoint = ccp(0, 0);
        chaMenuItem.position = CGPointMake(938, 700);
        
        CCMenu *menu = [CCMenu menuWithItems: chaMenuItem, nil];
        for (NSArray *p in resources) {
            NSArray *params = [[p objectAtIndex:0] componentsSeparatedByString:@"|"];
            CCMenuItem *menuItem = [CCMenuItemImage itemFromNormalImage:[params objectAtIndex:0] selectedImage:[params objectAtIndex:0] target:self selector:@selector(selectTodo:)];
            menuItem.position = ccp([(NSNumber*)[params objectAtIndex:1] floatValue], [(NSNumber*)[params objectAtIndex:2] floatValue]);
            menuItem.anchorPoint = ccp(0, 0);
            menuItem.userData = [p objectAtIndex:1];
            [menu addChild:menuItem];
        }

        menu.anchorPoint = ccp(0, 0);
        menu.position = ccp(0, 0);
        [self addChild:menu];
    }    
    return self;    
}

-(void) selectTodo: (id)sender {    
    CCMenuItem *img = (CCMenuItem *)sender;
    NSArray *p = [(NSString*)img.userData componentsSeparatedByString:@"|"];
    CCSprite *detail = [CCSprite spriteWithFile:(NSString*)[p objectAtIndex:0]];
    detail.position = ccp([(NSNumber*)[p objectAtIndex:1] floatValue], [(NSNumber*)[p objectAtIndex:2] floatValue]);
    [self moveDetailImg];
    [self addChild:detail z:5 tag:DEDAIL_MAP_TAG];   
    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    Boolean isTouchSprite = FALSE;
    for (CCSprite *sprite in [self children]) {
        CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
        if(CGRectContainsPoint(sprite.boundingBox, touchLocation)) {
            isTouchSprite = TRUE;
            break;
        }
    }
    if(!isTouchSprite){
        [self moveDetailImg];
    }
    
    return TRUE;
}

-(void) moveDetailImg{
    for (CCSprite *pre in [self children]) {
        if(pre.tag == DEDAIL_MAP_TAG){
            [self removeChild:pre cleanup:TRUE];
        }
    }    
}

-(void) closeButton:(id) sender {
    CCDirector *director = [CCDirector sharedDirector];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:parentLayer priority:0 swallowsTouches:YES];
    [director popScene];
}

@end
