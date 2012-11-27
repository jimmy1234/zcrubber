//
//  SummaryShlefLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-11-25.
//
//

#import "SummaryShlefLayer.h"
#import "ImageViewLayer.h"
#import "CompanySummaryMenuLayer.h"

@implementation SummaryShlefLayer

-(id) init {
    if((self = [super init])) {
        dic4IndexAndImageName = [[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  @"brands_1.png",[NSNumber numberWithInt: 0],
                                  @"doUnnormal",[NSNumber numberWithInt: 1],
                                  @"brands_3.png",[NSNumber numberWithInt: 2],nil] retain];
        [self buildWtihImagePrefix:@"brands_s_" dic:dic4IndexAndImageName];
    }
    //self.isTouchEnabled = YES;
    //[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    return self;
    
}

-(void)selectSpriteForTouch:(CGPoint)touchLocation{
    NSInteger indexOfTouchedSprite = [self spriteOfTouch:touchLocation];
    
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *scene = [CCScene node];
    
    if(indexOfTouchedSprite == 1){
        
        CompanySummaryMenuLayer *summaryLayer = [[CompanySummaryMenuLayer alloc]init];
        [scene addChild:summaryLayer];
        summaryLayer.parentLayer = self;
        
    }else{
    
        CGSize screenSize = [[CCDirector sharedDirector]winSize];      
        ImageViewLayer *imageLayer = [ImageViewLayer node];
        NSString *bigImgName = [dic4IndexAndImageName objectForKey:[NSNumber numberWithInt: indexOfTouchedSprite ]];
        [imageLayer initWithFile:bigImgName :screenSize.height];
        [imageLayer setImagePostion:ccp(screenSize.width/2, screenSize.height/2) ];
        [scene addChild:imageLayer];
        imageLayer.parentLayer = self;        
        
    }
    
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [director pushScene:scene];

}

@end
