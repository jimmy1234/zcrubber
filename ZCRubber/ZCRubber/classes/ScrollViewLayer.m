//
//  ScrollView.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-13.
//
//

#import "ScrollViewLayer.h"

@implementation ScrollViewLayer
@synthesize offset, bodyWidth, bodyHeight,head,body,contentHeight;

- (id) init {
    self = [super init];
    if(self != nil) {
       
    }
    return self;
}

- (void) initWithFile:(NSString*) headFile :(NSString*) bodyFile :(float) contentH {

        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        contentHeight = contentH;
        head = [CCSprite spriteWithFile:headFile];
        bodyWidth = head.contentSize.width;        
//        head.position = ccp(screenSize.width/2, 600);
        [self addChild:head];
        body = [[CCSprite spriteWithFile:bodyFile rect:CGRectMake(0, 0, bodyWidth, contentHeight)]retain];
        CCSprite *temp = [CCSprite spriteWithFile:bodyFile];
//        body.position = ccp(screenSize.width/2, 380);
        bodyHeight = temp.contentSize.height;
        //[self setPosition:ccp(screenSize.width/2, screenSize.height/2)];
        [self addChild:body z:1 tag:201];
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    

}

-(void) setTablePostion:(CGPoint)position {
    float headY = body.contentSize.height/2 + position.y;
    head.position = ccp(position.x, headY);
    body.position = ccp(position.x, position.y-head.contentSize.height/2);
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
    offset = offset + translation.y;
    if (translation.y <0 && offset<0) {
        offset = 0;
        return;
    } else if(translation.y > 0 && offset > bodyHeight - contentHeight) {
        offset = bodyHeight - contentHeight;
        return;
    }
    [body setTextureRect:CGRectMake(0, offset, bodyWidth, contentHeight)];
//    CGPoint bodyPosition = body.position;
//    [self removeChildByTag:201 cleanup:YES];
    
//    body = [CCSprite spriteWithFile:@"tbody.png" rect:CGRectMake(0, offset, bodyWidth, contentHeight)];
//    body.position = bodyPosition;
//    [self addChild:body z:1 tag:201];
	// get the label by its tag - CCLabel is of course derived from CCNode
	//backgroundImage.texture = [[CCTextureCache sharedTextureCache] add];
}

- (void) dealloc
{
    //	[movableSprites release];
    [body release];
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
