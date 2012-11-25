//
//  WheelZRotateLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-11.
//
//

#import "cocos2d.h"

@interface WheelZRotateLayer : CCLayer
@property (nonatomic,retain) CCSprite *backgroundImage;
@property (nonatomic) NSInteger imgIndex;
@property (nonatomic,retain) NSString *wheelId;
-(void) initWithWheelId:(NSString *)wheelId;
@end
