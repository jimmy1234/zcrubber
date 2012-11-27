//
//  CPBackgroundLayer.m
//  Helloworld
//
//  Created by quan jimmy on 12-11-3.
//
//

#import "CPDetailViewLayer.h"
#import "HWLayer.h"
#import "WheelZRotateLayer.h"
#import "WheelXRotateLayer.h"
#import "GGLayer.h"
#import "SPLayer.h"

@implementation CPDetailViewLayer
@synthesize lastLayer,wheelId,dic4Wheel,detailLayers,cpLayer,lastMenuItem;
model m = BACKGROUND;
- (id) init {
    self = [super init];
    if(self != nil) {
        CCSprite *backgroundImage1 = [CCSprite spriteWithFile:@"detail_view_panoramic.png"];
        backgroundImage1.anchorPoint = ccp(0, 0);
        backgroundImage1.position = ccp(0,0);
        [self addChild:backgroundImage1 z:2 tag:101];
        
        CCSprite *top = [CCSprite spriteWithFile:@"top.png"];
        top.anchorPoint = ccp(0, 0);
        top.position = ccp(0, 725);
        [self addChild:top z:3 tag:1102];
        
        
        CCSprite *left = [CCSprite spriteWithFile:@"sub_bar_left.png"];
        left.anchorPoint = ccp(0, 0);
        left.position = ccp(0, 100);
        [self addChild:left z:3 tag:102];
        
        CCSprite *right = [CCSprite spriteWithFile:@"sub_bar_right.png"];
        right.anchorPoint = ccp(0, 0);
        right.position = ccp(938, 100);
        [self addChild:right z:3 tag:103];
        

        self.isTouchEnabled = YES;
        
        CCMenuItem *menu360Item = [CCMenuItemImage itemFromNormalImage:@"bar_left_360.png" selectedImage:@"bar_left_360_hover.png" disabledImage:@"bar_left_360_hover.png" target:self selector:@selector(button360Tapped:)];
        [menu360Item setIsEnabled:NO];
        lastMenuItem = menu360Item;
        menu360Item.anchorPoint = ccp(0, 0);
        menu360Item.position = CGPointMake(0, 530);
        
        CCMenuItem *csMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_left_s.png" selectedImage:@"bar_left_s_hover.png" disabledImage:@"bar_left_s_hover.png" target:self selector:@selector(csButtonTapped:)];
        csMenuItem.anchorPoint = ccp(0, 0);
        csMenuItem.position = CGPointMake(0, 430);
        
        CCMenuItem *zsMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_left_t.png" selectedImage:@"bar_left_t_hover.png" disabledImage:@"bar_left_t_hover.png" target:self selector:@selector(zsButtonTapped:)];
        zsMenuItem.anchorPoint = ccp(0, 0);
        zsMenuItem.position = CGPointMake(0, 330);
        
        CCMenuItem *videoMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_left_video.png" selectedImage:@"bar_left_video_hover.png" disabledImage:@"bar_left_video_hover.png" target:self selector:@selector(videoButtonTapped:)];
        videoMenuItem.anchorPoint = ccp(0, 0);
        videoMenuItem.position = CGPointMake(0, 230);
        
        CCMenuItem *grainMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_right_grain.png" selectedImage:@"bar_right_grain_hover.png" disabledImage:@"bar_right_grain_hover.png"  target:self selector:@selector(grainButtonTapped:)];
        grainMenuItem.anchorPoint = ccp(0, 0);
        grainMenuItem.position = CGPointMake(938, 530);
        
        CCMenuItem *structMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_right_struct.png" selectedImage:@"bar_right_struct_hover.png" disabledImage:@"bar_right_struct_hover.png" target:self selector:@selector(grainButtonTapped:)];
        structMenuItem.anchorPoint = ccp(0, 0);
        structMenuItem.position = CGPointMake(938, 430);
        
        CCMenuItem *formularMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_right_formula.png" selectedImage:@"bar_right_formula_hover.png" disabledImage:@"bar_right_formula_hover.png" target:self selector:@selector(formularButtonTapped:)];
        formularMenuItem.anchorPoint = ccp(0, 0);
        formularMenuItem.position = CGPointMake(938, 330);
        
        CCMenuItem *ruleMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_right_ruler.png" selectedImage:@"bar_right_ruler_hover.png" disabledImage:@"bar_right_ruler_hover.png" target:self selector:@selector(ruleButtonTapped:)];
        ruleMenuItem.anchorPoint = ccp(0, 0);
        ruleMenuItem.position = CGPointMake(938, 230);
        
        CCMenuItem *styleMenuItem = [CCMenuItemImage itemFromNormalImage:@"bar_right_style.png" selectedImage:@"bar_right_style_hover.png" disabledImage:@"bar_right_style_hover.png" target:self selector:@selector(styleButtonTapped:)];
        styleMenuItem.anchorPoint = ccp(0, 0);
        styleMenuItem.position = CGPointMake(938, 130);
        
        CCMenuItem *chaMenuItem = [CCMenuItemImage itemFromNormalImage:@"return_button.png" selectedImage:@"return_button.png" target:self selector:@selector(chaButtonTapped:)];
        chaMenuItem.anchorPoint = ccp(0, 0);
        chaMenuItem.position = CGPointMake(10, 728);
        
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"productUI" ofType:@"xml"];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile :plistPath];
        NSArray *funcs = [dic objectForKey:wheelId];
        CCMenu *menu = [CCMenu menuWithItems:menu360Item, csMenuItem, zsMenuItem, videoMenuItem,grainMenuItem,structMenuItem,formularMenuItem,ruleMenuItem,styleMenuItem, chaMenuItem, nil];
        menu.position = CGPointMake(0, 0);
        menu.anchorPoint = ccp(0, 0);
        [self addChild:menu z:6 tag:20];
        
    }
    return self;
}

-(void) initWithWheelId:(NSString *)wheelId{
    self.wheelId = wheelId;
    lastLayer = [[WheelRotateLayer node] retain];
    [lastLayer initWithWheelId:wheelId];
    [self addChild:lastLayer z:10];
}

-(void) button360Tapped:(id) sender {
    [self replaceBackgroundUsingBg];
    WheelRotateLayer *layer = [[WheelRotateLayer node] retain];
    [layer initWithWheelId:wheelId];
    [self replaceDisplayLayer:layer];
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void) csButtonTapped:(id) sender {
    [self replaceBackgroundUsingBg];
    WheelZRotateLayer *layer = [[WheelZRotateLayer node] retain];
    [layer initWithWheelId:wheelId];
    [self replaceDisplayLayer:layer];
    [self changeMenuItemState:(CCMenuItem *)sender];
    
}

-(void) zsButtonTapped:(id) sender {
    [self replaceBackgroundUsingFt];

    WheelXRotateLayer *layer = [[WheelXRotateLayer node] retain];
    [layer initWithWheelId:wheelId];
    [self replaceDisplayLayer:layer];
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void) videoButtonTapped:(id) sender {
    [self replaceBackgroundUsingBg];
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void) grainButtonTapped:(id) sender {
    [self replaceBackgroundUsingFt];
    HWLayer *hwLyaer = [[HWLayer node] retain];
    [hwLyaer initWithWheelId:wheelId];
    [self replaceDisplayLayer:hwLyaer];
    [self changeMenuItemState:(CCMenuItem *)sender];
    
}

-(void) formularButtonTapped:(id) sender {
    [self replaceBackgroundUsingFt];
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void) ruleButtonTapped:(id) sender {
    [self replaceBackgroundUsingFt];
    GGLayer *ggLayer = [[GGLayer node] retain];
    [ggLayer initWithWheelId:wheelId];
    [self replaceDisplayLayer:ggLayer];
    [self changeMenuItemState:(CCMenuItem *)sender];
}

-(void) styleButtonTapped:(id) sender {
    [self replaceBackgroundUsingFt];
    SPLayer *spLyaer = [[SPLayer node] retain];
    [spLyaer initWithWheelId:wheelId];
    [self replaceDisplayLayer:spLyaer];
    [self changeMenuItemState:(CCMenuItem *)sender];
}


-(void) chaButtonTapped:(id) sender {
    CCDirector *director = [CCDirector sharedDirector];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:cpLayer priority:0 swallowsTouches:YES];
    [self removeChild:lastLayer cleanup:YES];
    [director popScene];
}

-(void) replaceBackgroundUsingFt{
    if (m == BACKGROUND) {
        [self removeChildByTag:101 cleanup:YES];
        CCSprite *backgroundImage1 = [CCSprite spriteWithFile:@"detail_view.png"];
        backgroundImage1.anchorPoint = ccp(0, 0);
        backgroundImage1.position = ccp(0,0);
        [self addChild:backgroundImage1 z:2 tag:102];
        m = FRONT;
    }

}

-(void) replaceBackgroundUsingBg{
    if (m == FRONT) {
        [self removeChildByTag:102 cleanup:YES];
        CCSprite *backgroundImage1 = [CCSprite spriteWithFile:@"detail_view_panoramic.png"];
        backgroundImage1.anchorPoint = ccp(0, 0);
        backgroundImage1.position = ccp(0,0);
        [self addChild:backgroundImage1 z:2 tag:101];
        m = BACKGROUND;
       
    }
}

-(void) replaceDisplayLayer:(CCLayer *) newLayer {

    [self removeChild:lastLayer cleanup:YES];
    [lastLayer release];
    [self addChild:newLayer z:10];
    lastLayer = newLayer;
}

-(void)changeMenuItemState:(CCMenuItem *) newMenuItem {
    if(lastMenuItem != nil) {
        [lastMenuItem setIsEnabled:YES];
    }
    [newMenuItem setIsEnabled:NO];
    lastMenuItem = newMenuItem;
}

@end
