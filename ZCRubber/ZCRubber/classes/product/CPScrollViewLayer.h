//
//  CPScrollViewLayer.h
//  Helloworld
//
//  Created by quan jimmy on 12-11-3.
//
//

#import "cocos2d.h"

@interface CPScrollViewLayer : CCLayer
@property (nonatomic,retain) CCSprite *background;
@property (nonatomic,retain) CCSprite *selSprite;
@property (nonatomic,retain) NSMutableArray *movableSprites;
@property (nonatomic) CGPoint beginPoint;
@property (nonatomic,retain) NSDictionary *index2WheelId;

-(void) panForTranslation:(CGPoint)translation;
-(NSInteger) indexofCenter:(CGPoint)touchLocation;
@end
