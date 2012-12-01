//
//  SummaryMenuLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-12-1.
//
//

#import "SummaryMenuLayer.h"

@implementation SummaryMenuLayer

-(id) init {
    if((self = [super init])) {
        CGSize screenSize = [[CCDirector sharedDirector]winSize];

        CCSprite *background = [CCSprite spriteWithFile:@"brand_summary_bg.png"];
        background.position = ccp(screenSize.width/2, screenSize.height/2);
        [self addChild:background z:11 tag:210];        
        
        CCMenuItem *summaryTop10Menu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary_top10.png" selectedImage:@"brand_button_summary_top10_hover.png" target:self selector:@selector(displayTop10:)];
        summaryTop10Menu.position = ccp(180, 408) ;
        summaryTop10Menu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *summaryOrgMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary_org.png" selectedImage:@"brand_button_summary_org_hover.png" target:self selector:@selector(showCompanyOrg:)];
        summaryOrgMenu.position = ccp(600, 408);
        summaryOrgMenu.anchorPoint = ccp(0, 0);
        
        CCMenuItem *summaryVideoMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary_video.png" selectedImage:@"brand_button_summary_video_hover.png" target:self selector:@selector(playSummaryVideo:)];
        summaryVideoMenu.position = ccp(180, 138);
        summaryVideoMenu.anchorPoint = ccp(0, 0);
  
        CCMenu *menu = [CCMenu menuWithItems:summaryTop10Menu, summaryOrgMenu, summaryVideoMenu, nil];
        menu.position = ccp(0, 0);
        
        [self addChild:menu z:4 tag:211];

        
    }
    return self;
}

-(void) summaryTop10Menu: (id) sender {
    
}

-(void) showCompanyOrg: (id) sender {
    
}

-(void) playSummaryVideo: (id) sender {    
    
}

@end
