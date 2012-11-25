//
//  LSBackgroundLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-10.
//
//

#import "LSBackgroundLayer.h"
#import "SalesShlefLayer.h"
#import "CCScrollLayer.h"
#import "POPShlefLayer.h"
#import "ZMDShlefLayer.h"

@implementation LSBackgroundLayer
-(id) init {
    if((self = [super init])) {
        CCSprite *background = [CCSprite spriteWithFile:@"etail_bg.png"];
        background.anchorPoint = ccp(0,0);
        [self addChild:background];
        
        [self initMenu];
        
        //SalesShlefLayer *shlef = [SalesShlefLayer node];
//        SalesShlefLayer *shlef1 = [SalesShlefLayer node];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:shlef,shlef1, nil];
//        CCScrollLayer *scroll = [CCScrollLayer nodeWithLayers:array widthOffset:0];
        //[self addChild:shlef z:4];
    }
    return self;
}

- (void) initMenu {

        CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
        CCMenuItem *storeMenuItem = [CCMenuItemImage itemFromNormalImage:@"etail_button_store.png" selectedImage:@"etail_button_store_hover.png" target:self selector:@selector(storeButtonTapped:)];
        storeMenuItem.position = CGPointMake(500, 550);
        
        CCMenuItem *popMenuItem = [CCMenuItemImage itemFromNormalImage:@"etail_button_sale.png" selectedImage:@"etail_button_sale_hover.png" target:self selector:@selector(popButtonTapped:)];
        popMenuItem.position = CGPointMake(250, 300);
        
        CCMenuItem *saleMenuItem = [CCMenuItemImage itemFromNormalImage:@"etail_button_pop.png" selectedImage:@"etail_button_pop_hover.png" target:self selector:@selector(saleButtonTapped:)];
        saleMenuItem.position = CGPointMake(750, 300);
        
        
        CCMenu *menu = [CCMenu menuWithItems:storeMenuItem, popMenuItem, saleMenuItem, nil];
        menu.position = CGPointMake(0, 0);
        [self addChild:menu z:3 tag:20];

}

-(void) popButtonTapped:(id) sender {
    POPShlefLayer *layer = [POPShlefLayer node];
    [self setIndex:layer];
}

-(void) saleButtonTapped:(id) sender {
    SalesShlefLayer *layer = [SalesShlefLayer node];
    [self setIndex:layer];
}

-(void) storeButtonTapped:(id) sender {
    ZMDShlefLayer *layer = [ZMDShlefLayer node];
    [self setIndex:layer];
    
}

-(void) setIndex:(ShlefLayer *)shlefLayer {
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *scene = [CCScene node];
    [scene addChild:shlefLayer];
    shlefLayer.preLayer = self;
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [director pushScene:scene];
}


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    
    return TRUE;
}
@end
