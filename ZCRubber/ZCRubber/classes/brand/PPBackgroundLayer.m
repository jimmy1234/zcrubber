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
#import "PlayVedioLayer.h";
#import "SummaryMenuLayer.h"



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
        
        CCSprite *topImage = [CCSprite spriteWithFile:@"top.png"];
        [topImage setPosition:CGPointMake(screenSize.width/2, 768-topImage.contentSize.height/2)];
        [self addChild:topImage z:1 tag:201];
        
        
        CCMenuItem *aboutMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary.png" selectedImage:@"brand_button_summary_hover.png" target:self selector:@selector(diplaySummaryMenu:)];
        aboutMenu.position = ccp(180, 408) ;
        aboutMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *gameMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_driftRace.png" selectedImage:@"brand_button_driftRace_hover.png" target:self selector:@selector(palyDriftVideo:)];
        gameMenu.position = ccp(600, 408);
        gameMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *adMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_video.png" selectedImage:@"brand_button_video_hover.png" target:self selector:@selector(palyADVideo:)];
        adMenu.position = ccp(180, 138);
        adMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *websiteMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_website.png" selectedImage:@"brand_button_website_hover.png" target:self selector:@selector(openWebsite:)];
        websiteMenu.position = ccp(600, 138);
        websiteMenu.anchorPoint = ccp(0, 0);
        
        
        
        
        CCMenu *menu = [CCMenu menuWithItems:aboutMenu, gameMenu, adMenu, websiteMenu, nil];
        menu.position = ccp(0, 0);
        
        [self addChild:menu z:1 tag:202];

       
        /*
        
        CCMenuItem *topMenu = [CCMenuItemImage itemFromNormalImage:@"brand_menu_top.png" selectedImage:@"brand_menu_top_hover.png" target:self selector:@selector(dispalyTop10:)];
        topMenu.position = ccp(110, 458) ;
        topMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *gameMenu = [CCMenuItemImage itemFromNormalImage:@"brand_menu_drift.png" selectedImage:@"brand_menu_drift_hover.png" target:self selector:@selector(palyDriftVideo:)];
        gameMenu.position = ccp(600, 458);
        gameMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *adMenu = [CCMenuItemImage itemFromNormalImage:@"brand_menu_ad.png" selectedImage:@"brand_menu_ad_hover.png" target:self selector:@selector(palyADVideo:)];
        adMenu.position = ccp(110, 88);
        adMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *websiteMenu = [CCMenuItemImage itemFromNormalImage:@"brand_menu_website.png" selectedImage:@"brand_menu_website_hover.png" target:self selector:@selector(openWebsite:)];
        websiteMenu.position = ccp(600, 88);
        websiteMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *orgMenu = [CCMenuItemImage itemFromNormalImage:@"brand_menu_org.png" selectedImage:@"brand_menu_org_hover.png" target:self selector:@selector(dispalyOrg:)];
        orgMenu.position = ccp(360, 268);
        orgMenu.anchorPoint = ccp(0, 0);       
        
        CCMenu *menu = [CCMenu menuWithItems:topMenu, gameMenu, adMenu, websiteMenu, orgMenu, nil];
        menu.position = ccp(0, 0);
        //[menu setAnchorPoint: ccp(0, 0)];
        
        [self addChild:menu z:3 tag:201];
         
         */
        [CCVideoPlayer setDelegate: self];
      
    }
    return self;
}


-(void) diplaySummaryMenu: (id) sender {
    SummaryMenuLayer* summaryLayer = [[SummaryMenuLayer alloc] init];
    summaryLayer.parentLayer = self;
   [self addChild:summaryLayer z:1 tag:203];   
}

-(void) palyADVideo: (id) sender {
    //[CCVideoPlayer playMovieWithFile:@"edition2nd.mov"];
    //[CCVideoPlayer setNoSkip: YES];
    
    PlayVedioLayer* play = [[PlayVedioLayer alloc] init];
    [play playFile:@"edition2nd.mov"];
}

-(void) palyDriftVideo: (id) sender {
    //[CCVideoPlayer playMovieWithFile:@"drift.MP4"];
    //[CCVideoPlayer setNoSkip: YES];

}

-(void) openWebsite: (id) sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:COMPANY_WEBSITE]];    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    NSLog(@"test111");
    
    return TRUE;
    //return FALSE;
}

-(void)moviePlaybackFinished{
   [[CCDirector sharedDirector] startAnimation];
}

-(void)movieStartsPlaying{
   [[CCDirector sharedDirector] stopAnimation];

}

@end
