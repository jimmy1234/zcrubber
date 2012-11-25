//
//  ScrollView.h
//  ZCRubber
//
//  Created by quan jimmy on 12-11-13.
//
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
@interface ScrollViewLayer : CCLayer
@property (nonatomic) NSInteger offset;
@property (nonatomic) float bodyWidth;
@property (nonatomic) float bodyHeight;
@property (nonatomic) float contentHeight;
@property (nonatomic,retain) CCSprite* head;
@property (nonatomic,retain) CCSprite* body;

-(void) setTablePostion:(CGPoint)position;
- (void) initWithFile:(NSString*) headFile :(NSString*) bodyFile :(float) contentH;
@end
