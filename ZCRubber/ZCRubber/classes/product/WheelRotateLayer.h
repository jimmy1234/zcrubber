//
//  WheelLayer.h
//  Helloworld
//
//  Created by quan jimmy on 12-10-28.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface WheelRotateLayer : CCLayer
@property (nonatomic,retain) CCSprite *backgroundImage;
@property (nonatomic) NSInteger imgIndex;
@property (nonatomic,retain) NSString *wheelId;
-(void) initWithWheelId:(NSString *)wheelId;
@end
