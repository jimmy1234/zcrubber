//
//  ZMDShlefLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ShlefLayer.h"
#import "CCScrollLayer.h"

@interface ZMDShlefLayer : ShlefLayer
    
@property (nonatomic,retain)CCScrollLayer *d2Layer;
@property (nonatomic,retain)CCScrollLayer *d3Layer;
@end
