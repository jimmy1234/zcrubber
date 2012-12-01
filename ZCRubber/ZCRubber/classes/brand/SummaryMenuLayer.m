//
//  SummaryMenuLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-12-1.
//
//

#import "SummaryMenuLayer.h"
#import "CompanyOrgLayer.h"
#import "Top10ShlefLayer.h"


@implementation SummaryMenuLayer

@synthesize parentLayer;

-(id) init {
    if((self = [super init])) {
        CGSize screenSize = [[CCDirector sharedDirector]winSize];       
        

        CCSprite *background = [CCSprite spriteWithFile:@"brand_summary_bg.png"];
        background.position = ccp(screenSize.width/2, screenSize.height/2);
        [self addChild:background z:1 tag:210];
        
        CCSprite *topImage = [CCSprite spriteWithFile:@"top.png"];
        [topImage setPosition:CGPointMake(screenSize.width/2, 768-topImage.contentSize.height/2)];
        [self addChild:topImage z:1 tag:211];
        
        CCMenuItem *returnMenuItem = [CCMenuItemImage itemFromNormalImage:@"return_button.png" selectedImage:@"return_button.png" target:self selector:@selector(returnBrand:)];
        returnMenuItem.anchorPoint = ccp(0, 0);
        returnMenuItem.position = CGPointMake(10, 728);
        
        CCMenuItem *summaryTop10Menu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary_top10.png" selectedImage:@"brand_button_summary_top10_hover.png" target:self selector:@selector(displayTop10:)];
        summaryTop10Menu.position = ccp(110, 138) ;
        summaryTop10Menu.anchorPoint = ccp(0, 0);

        CCMenuItem *summaryOrgMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary_org.png" selectedImage:@"brand_button_summary_org_hover.png" target:self selector:@selector(showCompanyOrg:)];
        summaryOrgMenu.position = ccp(360, 408);
        summaryOrgMenu.anchorPoint = ccp(0, 0);

        CCMenuItem *summaryVideoMenu = [CCMenuItemImage itemFromNormalImage:@"brand_button_summary_video.png" selectedImage:@"brand_button_summary_video_hover.png" target:self selector:@selector(playSummaryVideo:)];
        summaryVideoMenu.position = ccp(610, 138);
        summaryVideoMenu.anchorPoint = ccp(0, 0);

        CCMenu *menu = [CCMenu menuWithItems:returnMenuItem, summaryTop10Menu, summaryOrgMenu, summaryVideoMenu, nil];

        menu.position = ccp(0, 0);
        
        [self addChild:menu z:1 tag:212];

        
    }
    return self;
}


-(void) returnBrand: (id) sender {
    [parentLayer removeChild:self cleanup:TRUE];
}

-(void) displayTop10: (id) sender {
    Top10ShlefLayer *top10Layer = [Top10ShlefLayer node];
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *scene = [CCScene node];
    [scene addChild:top10Layer];
    top10Layer.preLayer = self;
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [director pushScene:scene];
    
}

-(void) showCompanyOrg: (id) sender {
    CompanyOrgLayer *orgLayer = [CompanyOrgLayer node];
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *scene = [CCScene node];
    [scene addChild:orgLayer];
    orgLayer.parentLayer = self;
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [director pushScene:scene];
    
}

-(void) playSummaryVideo: (id) sender {    
    
}

@end
