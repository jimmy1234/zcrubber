//
//  ShlefLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ShlefLayer : CCLayer {
    NSMutableArray *movableSprites;
    NSDictionary *dic4IndexAndImageName;
    CGPoint beginPoint;
    CCLayer *preLayer;
    BOOL isScrollable;
}

@property (nonatomic,retain) NSMutableArray *movableSprites;
@property (nonatomic,retain) NSDictionary *dic4IndexAndImageName;
@property (nonatomic) CGPoint beginPoint;
@property (nonatomic,retain) CCLayer *preLayer;
@property (nonatomic) BOOL isScrollable;

-(void) buildWtihImagePrefix:(NSString *)prefix dic:(NSMutableDictionary *) indexAndImage;
@end
