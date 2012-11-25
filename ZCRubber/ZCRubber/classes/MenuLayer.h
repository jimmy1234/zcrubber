//
//  MenuLayer.h
//  Helloworld
//
//  Created by quan jimmy on 12-11-3.
//
//

#import "cocos2d.h"
#import "LSBackgroundLayer.h"
#import "KJBackgroundLayer.h"
#import "PPBackgroundLayer.h"
#import "CPScrollViewLayer.h"

@interface MenuLayer : CCLayer
@property (nonatomic,retain) CCScene* scene;
@property (nonatomic,retain) LSBackgroundLayer* lsBackground;
@property (nonatomic,retain) KJBackgroundLayer* kjBackground;
@property (nonatomic,retain) PPBackgroundLayer* ppBackground;
@property (nonatomic,retain) CPScrollViewLayer* cpBackground;
@property (nonatomic) NSInteger lastIndex;
@property (nonatomic,retain) NSMutableArray* layers;
-(void) setIndex:(NSInteger)index;
@end
