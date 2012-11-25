//
//  CPBackgroundLayer.h
//  Helloworld
//
//  Created by quan jimmy on 12-11-3.
//
//

#import "cocos2d.h"
#import "WheelRotateLayer.h"
#import "CPScrollViewLayer.h"

@interface CPDetailViewLayer : CCLayer
@property(nonatomic,retain) CCLayer *lastLayer;
@property(nonatomic,retain) CCMenuItem *lastMenuItem;
@property(nonatomic,retain) NSMutableDictionary *dic4Wheel;
@property(nonatomic,retain) NSMutableArray *detailLayers;
@property(nonatomic,retain) NSString *wheelId;
@property(nonatomic,retain) CPScrollViewLayer *cpLayer;

typedef enum {FRONT, BACKGROUND} model;

-(void) initWithWheelId:(NSString *)wheelId;
-(void) replaceBackgroundUsingBg;
-(void) replaceBackgroundUsingFt;
-(void) replaceDisplayLayer:(CCLayer *)layer;
-(void)changeMenuItemState:(CCMenuItem *) newMenuItem;

@end
