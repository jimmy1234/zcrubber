//
//  ImageViewLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ImageViewLayer : CCLayer
@property (nonatomic) NSInteger offset;
@property (nonatomic) float bodyWidth;
@property (nonatomic) float bodyHeight;
@property (nonatomic) float contentHeight;
@property (nonatomic,retain) CCSprite* body;
@property (nonatomic, retain) CCLayer* parentLayer;

-(void) setImagePostion:(CGPoint)position;
- (void) initWithFile:(NSString*) bodyFile :(float) contentH;
@end
