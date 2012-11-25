//
//  WheelLayer.m
//  Helloworld
//
//  Created by quan jimmy on 12-10-28.
//
//

#import "WheelRotateLayer.h"
#import "math.h"
@implementation WheelRotateLayer
@synthesize backgroundImage, imgIndex,wheelId;
- (id) init {
    self = [super init];
    if(self != nil) {

       
        
    }
    return self;
}

-(void) initWithWheelId:(NSString*) wheelId {
    self.wheelId = wheelId;
    backgroundImage = [CCSprite spriteWithFile:[wheelId stringByAppendingFormat: @"_360_0000.png"]];
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    [self addChild:backgroundImage z:6 tag:10];
    //self.isTouchEnabled = YES;
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return TRUE;
}
-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];

    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    if (abs(translation.x) < 5) {
        return;
    }
    if (translation.x > 0) {
        imgIndex++;
        if (imgIndex > 71) {
            imgIndex = 0;
        }
    } else {
        imgIndex--;
        if (imgIndex < 0) {
            imgIndex = 71;
        }
    }

    NSString *str = nil;
    if(imgIndex < 10) {
        str = [wheelId stringByAppendingFormat: @"_360_000%d.png", imgIndex];
    } else str = [wheelId stringByAppendingFormat: @"_360_00%d.png", imgIndex];
    
	// get the label by its tag - CCLabel is of course derived from CCNode
	backgroundImage.texture = [[CCTextureCache sharedTextureCache] addImage:str];
}

- (void) dealloc
{
	[backgroundImage release];
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
