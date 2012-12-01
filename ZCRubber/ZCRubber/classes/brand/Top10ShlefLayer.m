//
//  Top10ShlefLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-12-1.
//
//

#import "Top10ShlefLayer.h"

@implementation Top10ShlefLayer

-(id) init {
    if((self = [super init])) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:8];
        
        NSArray* imgs = [NSArray arrayWithObjects:@"cy_2d.png", @"hy_2d.png", nil];
        for (NSString* img in imgs) {
            [array addObject:[self addImg: img]];
        }

        [self addChild:[CCScrollLayer nodeWithLayers:array widthOffset:0]];        
    }
    return self;
}

-(CCLayer*) addImg :(NSString*) file{
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        CCLayer *layer = [CCLayer node];
        CCSprite *sprite = [CCSprite spriteWithFile:file];
        sprite.position = ccp(screenSize.width/2, screenSize.height/2);
        [layer addChild:sprite];       
        return layer;
}

@end
