//
//  HWLayer.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-11.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HWLayer : CCLayer
@property (nonatomic,retain) CCSprite *backgroundImage;
@property (nonatomic,retain) NSString *wheelId;
@property(nonatomic,retain) CCMenuItem *lastMenuItem;
@property (nonatomic) NSInteger preTag;

-(void) initWithWheelId:(NSString *) wheelId;
-(void)changeMenuItemState:(CCMenuItem *) newMenuItem newSprite:(CCSprite *)newSprite;
@end
