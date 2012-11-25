//
//  BackgroundLayer.m
//  Helloworld
//
//  Created by quan jimmy on 12-10-28.
//
//

#import "BackgroundLayer.h"
#import "CPScrollViewLayer.h"
#import "MenuLayer.h"
#import "PPBackgroundLayer.h"
#import "LSBackgroundLayer.h"
#import "KJBackgroundLayer.h"

@implementation BackgroundLayer
- (id) init {
    self = [super init];
    if(self != nil) {
        CCSprite *backgroundImage = [CCSprite spriteWithFile:@"bg.png"];
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
        [self addChild:backgroundImage z:0 tag:0];
        
        self.isTouchEnabled = YES;
        
        CCMenuItem *ppMenuItem = [CCMenuItemImage itemFromNormalImage:@"button_brand.png" selectedImage:@"button_brand.png" target:self selector:@selector(ppButtonTapped:)];
        ppMenuItem.position = CGPointMake(742, 513);
        
        CCMenuItem *cpMenuItem = [CCMenuItemImage itemFromNormalImage:@"button_product.png" selectedImage:@"button_product.png" target:self selector:@selector(cpButtonTapped:)];
        cpMenuItem.position = CGPointMake(724, 413);
        
        CCMenuItem *kjMenuItem = [CCMenuItemImage itemFromNormalImage:@"button_tech.png" selectedImage:@"button_tech.png" target:self selector:@selector(kjButtonTapped:)];
        kjMenuItem.position = CGPointMake(750, 313);
        
        CCMenuItem *lsMenuItem = [CCMenuItemImage itemFromNormalImage:@"button_retail.png" selectedImage:@"button_retail.png" target:self selector:@selector(lsButtonTapped:)];
        lsMenuItem.position = CGPointMake(742, 213);
        
        
        CCMenu *menu = [CCMenu menuWithItems:ppMenuItem, lsMenuItem, kjMenuItem, cpMenuItem, nil];
        menu.position = CGPointMake(0, 0);
        [self addChild:menu z:0 tag:20];
    }
    return self;
}
-(CCScene *) makeSecondScene:(NSInteger) index {
    CCScene *scene = [CCScene node];
    MenuLayer *menu = [MenuLayer node];
    [scene addChild:menu z:1];
    menu.scene = scene;
    CPScrollViewLayer *cpLayer = [CPScrollViewLayer node];
    LSBackgroundLayer *lsLayer = [LSBackgroundLayer node];
    PPBackgroundLayer *ppLayer = [PPBackgroundLayer node];
    KJBackgroundLayer *kjLayer = [KJBackgroundLayer node];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:ppLayer,cpLayer,kjLayer,lsLayer, nil];
    menu.layers = array;
    [menu setIndex:index];
    //[scene addChild:cpLayer z:0];
    CCDirector *director = [CCDirector sharedDirector];
    [director pushScene:scene];
    return scene;
}
-(void) cpButtonTapped:(id) sender {
    [self makeSecondScene:1];
    
}

-(void) lsButtonTapped:(id) sender {
    [self makeSecondScene:3];
}

-(void) ppButtonTapped:(id) sender {
    [self makeSecondScene:0];
}

-(void) kjButtonTapped:(id) sender {
    [self makeSecondScene:2];
}
@end
