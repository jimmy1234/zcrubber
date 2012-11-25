//
//  PPBackgroundLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-10.
//
//

#import "PPBackgroundLayer.h"
#import <math.h>
#import <UIKit/UIKit.h>
#import "CCUIViewWrapper.h"
#import "CompanySummaryMenuLayer.h"
#import "CCVideoPlayer.h"



@implementation PPBackgroundLayer
-(id) init {
    if((self = [super init])) {
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        //[super setAnchorPoint: ccp(0, 0)];
        
        //set the background picture
        CCSprite *background = [CCSprite spriteWithFile:@"brand_bg.png"];
        background.position = ccp(screenSize.width/2, screenSize.height/2);
        NSLog(@"background.position: x:%f, y:%f", background.position.x, background.position.y);
        [self addChild:background z:1 tag:200];
       
        
        CCMenuItem *aboutMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary.png" selectedImage:@"brand_button_summary_hover.png" target:self selector:@selector(selectTodo:)];
        aboutMenu.position = ccp(180, 408) ;
        aboutMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *gameMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_driftRace.png" selectedImage:@"brand_button_driftRace_hover.png" target:self selector:@selector(selectTodo:)];
        gameMenu.position = ccp(600, 408);
        gameMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *adMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_video.png" selectedImage:@"brand_button_video_hover.png" target:self selector:@selector(palyVideo:)];
        adMenu.position = ccp(180, 138);
        adMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *websiteMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_website.png" selectedImage:@"brand_button_website_hover.png" target:self selector:@selector(openURL:)];
        websiteMenu.position = ccp(600, 138);
        websiteMenu.anchorPoint = ccp(0, 0);
        
        
        
        
        CCMenu *menu = [CCMenu menuWithItems:aboutMenu, gameMenu, adMenu, websiteMenu, nil];
        menu.position = ccp(0, 0);
        //[menu setAnchorPoint: ccp(0, 0)];
        
        [self addChild:menu z:3 tag:201];  
      
    }
    return self;
}

-(void) selectTodo: (id) sender {
    // for test
    //ImageUIViewScrollViewLayer *layer = [[ImageUIViewScrollViewLayer alloc]init];
    //TableViewLayer *layer = [[TableViewLayer alloc]init];
    //[layer initWithFilenames:[NSArray arrayWithObjects:@"brand_button_website.png", @"tbody.png",@"brand_button_driftRace.png",@"brand_button_summary.png",nil]];
  
    //[self addChild:layer  z:8];
    
    CompanySummaryMenuLayer *summaryLayer = [[CompanySummaryMenuLayer alloc]init];
    [self addChild:summaryLayer  z:8];


   
}

-(void) palyVideo: (id) sender {
    [CCVideoPlayer playMovieWithFile:@"edition2nd.mov"];
}

-(void) openURL: (id) sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.chaoyang.com"]];    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{   
    
    return TRUE;
}

@end
