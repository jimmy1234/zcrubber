//
//  ImageViewLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImageViewLayer.h"


@implementation ImageViewLayer
@synthesize offset, bodyWidth, bodyHeight,body,contentHeight,parentLayer;

- (id) init {
    self = [super init];
    if(self != nil) {
        
    }
    return self;
}

- (void) initWithFile:(NSString*) bodyFile :(float) contentH {
    
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    contentHeight = contentH;
    
    body = [[CCSprite spriteWithFile:bodyFile] retain];
    bodyHeight = body.contentSize.height;
    bodyWidth = body.contentSize.width;
    [body setTextureRect:CGRectMake(0, 0, bodyWidth, contentHeight)];
    [self addChild:body z:1 tag:201];
    CCMenuItem *chaMenuItem = [CCMenuItemImage itemFromNormalImage:@"cha.png" selectedImage:@"cha.png" target:self selector:@selector(chaButtonTapped:)];
    chaMenuItem.anchorPoint = ccp(0, 0);
    chaMenuItem.position = CGPointMake(938, 700);
    
    CCMenu *menu = [CCMenu menuWithItems:chaMenuItem, nil];
    menu.position = CGPointMake(0, 0);
    menu.anchorPoint = ccp(0, 0);
    [self addChild:menu z:6 tag:20];
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    
}

-(void) setImagePostion:(CGPoint)position {
    
    body.position = ccp(position.x, position.y);
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

}

-(void) chaButtonTapped:(id) sender {
    CCDirector *director = [CCDirector sharedDirector];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:parentLayer priority:0 swallowsTouches:YES];
    //[self removeChild:lastLayer cleanup:YES];
    [director popScene];
}

- (void) dealloc
{
    //	[movableSprites release];
    [body release];
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
