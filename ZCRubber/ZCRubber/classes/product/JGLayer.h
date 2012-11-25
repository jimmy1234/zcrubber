//
//  JGLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface JGLayer : CCLayer
@property (nonatomic,retain) NSString *wheelId;
@property(nonatomic,retain) CCMenuItem *lastMenuItem;

-(void) initWithWheelId:(NSString *) wheelId;
@end
