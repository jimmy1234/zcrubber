//
//  SPLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SPLayer : CCLayer
@property (nonatomic,retain) NSString *wheelId;
-(void)initWithWheelId:(NSString *)wheelId;
@end
