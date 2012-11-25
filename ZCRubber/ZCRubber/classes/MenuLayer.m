//
//  MenuLayer.m
//  Helloworld
//
//  Created by quan jimmy on 12-11-3.
//
//

#import "MenuLayer.h"
#import "PPBackgroundLayer.h"
#import "CPScrollViewLayer.h"
#import "KJBackgroundLayer.h"
#import "LSBackgroundLayer.h"
#import "RootLayer.h"

@implementation MenuLayer
@synthesize scene,layers,lastIndex;
- (id) init {
    self = [super init];
    if(self != nil) {
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        
        CCSprite *menuImage = [CCSprite spriteWithFile:@"bottom.png"];
        [menuImage setPosition:CGPointMake(screenSize.width/2, menuImage.contentSize.height/2)];
        [self addChild:menuImage z:3 tag:15];
        
        self.isTouchEnabled = YES;
        
        CCMenuItem *ppMenuItem = [CCMenuItemImage itemFromNormalImage:@"bottom_button_brand.png" selectedImage:@"bottom_button_brand_hover.png" target:self selector:@selector(ppButtonTapped:)];
        ppMenuItem.position = CGPointMake(-360, 0);
        
        CCMenuItem *cpMenuItem = [CCMenuItemImage itemFromNormalImage:@"bottom_button_proudct.png" selectedImage:@"bottom_button_proudct_hover.png" target:self selector:@selector(cpButtonTapped:)];
        cpMenuItem.position = CGPointMake(-120, 0);
        
        CCMenuItem *kjMenuItem = [CCMenuItemImage itemFromNormalImage:@"bottom_button_tech.png" selectedImage:@"bottom_button_tech_hover.png" target:self selector:@selector(kjButtonTapped:)];
        kjMenuItem.position = CGPointMake(120, 0);
        
        CCMenuItem *lsMenuItem = [CCMenuItemImage itemFromNormalImage:@"bottom_button_retail.png" selectedImage:@"bottom_button_retail_hover.png" target:self selector:@selector(lsButtonTapped:)];
        lsMenuItem.position = CGPointMake(360, 0);
        

        
        
        CCMenu *menu = [CCMenu menuWithItems:ppMenuItem, lsMenuItem, kjMenuItem, cpMenuItem, nil];
        menu.position = CGPointMake(screenSize.width/2, menuImage.contentSize.height/2);
        [self addChild:menu z:3 tag:20];
    }
    return self;
}

-(void) cpButtonTapped:(id) sender {
    [self setIndex:1];
}

-(void) lsButtonTapped:(id) sender {
    [self setIndex:3];
}

-(void) ppButtonTapped:(id) sender {
    [self setIndex:0];
    
}

-(void) kjButtonTapped:(id) sender {
    [self setIndex:2];
}

-(void) setIndex:(NSInteger)index {
    if (lastIndex != -1) {
        CCLayer *layer = [layers objectAtIndex:lastIndex];
        [scene removeChild:layer cleanup:YES];
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:layer];
    }
    CCLayer *cpLayer = [layers objectAtIndex:index];
    [scene addChild:cpLayer z:0];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:cpLayer priority:0 swallowsTouches:NO];
    lastIndex = index;
}
@end
