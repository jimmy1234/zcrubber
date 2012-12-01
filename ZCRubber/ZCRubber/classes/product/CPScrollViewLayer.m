//
//  CPScrollViewLayer.m
//  Helloworld
//
//  Created by quan jimmy on 12-11-3.
//
//

#import "CPScrollViewLayer.h"
#import "CPDetailViewLayer.h"
#import <math.h>

#define NUM 8
#define FACTOR_1 0.75
#define FACTOR_2 0.5


@implementation CPScrollViewLayer
@synthesize movableSprites,selSprite,background,beginPoint,index2WheelId,selNameSprite;

-(id) init {
    if((self = [super init])) {
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        index2WheelId = [[NSDictionary dictionaryWithObjectsAndKeys:
                         @"RP26",[NSNumber numberWithInt: 0],
                         @"SL369",[NSNumber numberWithInt: 1],
                         @"RP26",[NSNumber numberWithInt: 2],
                         @"RP26",[NSNumber numberWithInt: 3],
                         @"RP26",[NSNumber numberWithInt: 4],
                         @"RP26",[NSNumber numberWithInt: 5],
                         @"RP26",[NSNumber numberWithInt: 6],
                         @"RP26",[NSNumber numberWithInt: 7], nil] retain];
        background = [CCSprite spriteWithFile:@"cp.png"];
        background.anchorPoint = ccp(0,0);
        [self addChild:background];
        
        CCSprite *topImage = [CCSprite spriteWithFile:@"top.png"];
        [topImage setPosition:CGPointMake(screenSize.width/2, 768-topImage.contentSize.height/2)];
        [self addChild:topImage z:3 tag:15];
        
        movableSprites = [[NSMutableArray alloc] init];

        for (int i = 1; i< NUM+1; i++) {
            NSString * img = [NSString stringWithFormat:@"%d#.png", i];
            CCSprite *sprite = [CCSprite spriteWithFile:img];
            sprite.position = ccp((i-1)*sprite.contentSize.width, 350);
            [background addChild:sprite];
            [movableSprites addObject:sprite];
        }
        NSInteger indexOfCenter = [self indexofCenter:ccp(screenSize.width/2, screenSize.height/3)];
        [self caculateScale:indexOfCenter];
        //self.isTouchEnabled = YES;
    }
    return self;
}

-(void) caculateScale:(NSInteger)centerIndex {
    
    CCSprite *centerSprite = [movableSprites objectAtIndex:centerIndex];
    centerSprite.scale = 1;
    [self displayNameSprite:centerIndex];
    
    //centerSprite.position = ccp(screenSize.width/2, screenSize.height/3);
    if (centerIndex < NUM-2 && centerIndex > 1) {
        CCSprite *right1Sprite = [movableSprites objectAtIndex:centerIndex+1];
        CCSprite *right2Sprite = [movableSprites objectAtIndex:centerIndex+2];
        CCSprite *left1Sprite = [movableSprites objectAtIndex:centerIndex-1];
        CCSprite *left2Sprite = [movableSprites objectAtIndex:centerIndex-2];
        
        right1Sprite.scale = FACTOR_1;
        right2Sprite.scale = FACTOR_2;
        left1Sprite.scale = FACTOR_1;
        left2Sprite.scale = FACTOR_2;
        
//        right1Sprite.position = ccp(centerSprite.position.x+centerSprite.contentSize.width, screenSize.height/3);
//        right2Sprite.position = ccp(right1Sprite.position.x+right1Sprite.contentSize.width, screenSize.height/3);
//        left1Sprite.position = ccp(centerSprite.position.x-centerSprite.contentSize.width, screenSize.height/3);
//        left2Sprite.position = ccp(left1Sprite.position.x-left1Sprite.contentSize.width, screenSize.height/3);
        
    } else if (centerIndex == NUM-2) {
        CCSprite *right1Sprite = [movableSprites objectAtIndex:centerIndex+1];
        CCSprite *left1Sprite = [movableSprites objectAtIndex:centerIndex-1];
        CCSprite *left2Sprite = [movableSprites objectAtIndex:centerIndex-2];
        
        right1Sprite.scale = FACTOR_1;
        left1Sprite.scale = FACTOR_1;
        left2Sprite.scale = FACTOR_2;
//        
//        right1Sprite.position = ccp(centerSprite.position.x+centerSprite.contentSize.width, screenSize.height/3);
//        left1Sprite.position = ccp(centerSprite.position.x-centerSprite.contentSize.width, screenSize.height/3);
//        left2Sprite.position = ccp(left1Sprite.position.x-left1Sprite.contentSize.width, screenSize.height/3);
    } else if (centerIndex == NUM-1) {
        CCSprite *left1Sprite = [movableSprites objectAtIndex:centerIndex-1];
        CCSprite *left2Sprite = [movableSprites objectAtIndex:centerIndex-2];
        
        left1Sprite.scale = FACTOR_1;
        left2Sprite.scale = FACTOR_2;
//        
//        left1Sprite.position = ccp(centerSprite.position.x-centerSprite.contentSize.width, screenSize.height/3);
//        left2Sprite.position = ccp(left1Sprite.position.x-left1Sprite.contentSize.width, screenSize.height/3);
    } else if (centerIndex == 1) {
        CCSprite *right1Sprite = [movableSprites objectAtIndex:centerIndex+1];
        CCSprite *right2Sprite = [movableSprites objectAtIndex:centerIndex+2];
        CCSprite *left1Sprite = [movableSprites objectAtIndex:centerIndex-1];
        
        right1Sprite.scale = FACTOR_1;
        right2Sprite.scale = FACTOR_2;
        left1Sprite.scale = FACTOR_1;
        
//        right1Sprite.position = ccp(centerSprite.position.x+centerSprite.contentSize.width, screenSize.height/3);
//        right2Sprite.position = ccp(right1Sprite.position.x+right1Sprite.contentSize.width, screenSize.height/3);
//        left1Sprite.position = ccp(centerSprite.position.x-centerSprite.contentSize.width, screenSize.height/3);
    } else if (centerIndex == 0) {
        CCSprite *right1Sprite = [movableSprites objectAtIndex:centerIndex+1];
        CCSprite *right2Sprite = [movableSprites objectAtIndex:centerIndex+2];
        
        right1Sprite.scale = FACTOR_1;
        right2Sprite.scale = FACTOR_2;
        
//        right1Sprite.position = ccp(centerSprite.position.x+centerSprite.contentSize.width, screenSize.height/3);
//        right2Sprite.position = ccp(right1Sprite.position.x+right1Sprite.contentSize.width, screenSize.height/3);
    }
}

-(NSInteger) indexofCenter:(CGPoint)touchLocation{
    NSInteger i = 0;
    CCSprite *sprite = nil;
    for (; i < [movableSprites count]; i++) {
        sprite = [movableSprites objectAtIndex:i];
        if(CGRectContainsPoint(sprite.boundingBox, touchLocation)) {
            return i;
        }
    }
    return 0;
}

-(void)selectSpriteForTouch:(CGPoint)touchLocation{
    NSInteger indexOfCenter = [self indexofCenter:touchLocation];
    CCSprite *newSprite = [movableSprites objectAtIndex:indexOfCenter];
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    if(newSprite != selSprite) {
        if (newSprite.scale<1) {
            newSprite.scale =1;
            [self displayNameSprite:indexOfCenter];
            
            CGPoint translation = ccpSub( ccp(screenSize.width/2, newSprite.position.y), newSprite.position);
            [self panForTranslation:translation];
        }

        selSprite = newSprite;
    }else {
        
        CCDirector *director = [CCDirector sharedDirector];
        CCScene *scene = [CCScene node];
        CPDetailViewLayer *cpDetailLayer = [CPDetailViewLayer node];
        [cpDetailLayer initWithWheelId:[index2WheelId objectForKey:[NSNumber numberWithInt: indexOfCenter ]]];
        [cpDetailLayer retain];
        [scene addChild:cpDetailLayer];
        cpDetailLayer.cpLayer = self;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
        [director pushScene:scene];
    }

}

- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGSize winsize = [CCDirector sharedDirector].winSize;
    CGPoint retVal = newPos;
    retVal.x = MIN(retVal.x, 0);
    retVal.x = MAX(retVal.x, winsize.width-background.contentSize.width);
    retVal.y = self.position.y;
    return retVal;
}
-(void) panForTranslation:(CGPoint)translation {
//    if(selSprite) {
//        //CGPoint newPos = ccpAdd(selSprite.position, translation);
//        //selSprite.position = newPos;
//        
//        //[self draw];
//    } else {
//        CGPoint newPos = ccpAdd(self.position, translation);
//        self.position = [self boundLayerPos:newPos];
//    }
    NSInteger indexOfCenter = 0, i=0;
    for(CCSprite *sprite in movableSprites) {
//        sprite.scale = 0.75;
        CCAction *moveTo = [CCMoveTo actionWithDuration:0.2 position:ccp(sprite.position.x+translation.x, sprite.position.y)];
        //CCSequence *rotSeq = [CCSequence actions:moveTo,nil];
        [sprite runAction:moveTo];

        sprite.position = ccp(sprite.position.x+translation.x, sprite.position.y);
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        if(CGRectContainsPoint(sprite.boundingBox, ccp(screenSize.width/2, sprite.position.y))) {
            //sprite.scale = 1;
            indexOfCenter = i;
        }
        i++;
    }

    [self caculateScale:indexOfCenter];
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
//    if (abs(touchLocation.x - oldTouchLocation.x) < 10) {
//        return;
//    }
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    CCSprite *sprite = [movableSprites objectAtIndex:0];
    if(CGRectContainsPoint(sprite.boundingBox, ccp(screenSize.width/2+90, sprite.position.y)) && translation.x>0) {
        return;
    }
    sprite = [movableSprites objectAtIndex:[movableSprites count]-1];
    if(CGRectContainsPoint(sprite.boundingBox, ccp(screenSize.width/2-90, sprite.position.y)) && translation.x<0) {
        return;
    }
    NSInteger indexOfCenter = -1, i=0;
    for(CCSprite *sprite in movableSprites) {
        sprite.position = ccp(sprite.position.x+translation.x, sprite.position.y);
        if(CGRectContainsPoint(sprite.boundingBox, ccp(screenSize.width/2, sprite.position.y))) {
            indexOfCenter = i;
        }
        
        i++;
    }
    if(indexOfCenter != -1) {
        [self caculateScale:indexOfCenter];
    }
    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    beginPoint = touchLocation;
    //[self selectSpriteForTouch:touchLocation];
    
    return TRUE;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    if (abs(beginPoint.x - touchLocation.x) < 5) {
        [self selectSpriteForTouch:touchLocation];
    }
    
}

- (void) displayNameSprite:(NSInteger) centerIndex {
    if(selNameSprite != nil) {
        [background removeChild:selNameSprite cleanup:YES];
    }
    NSString * img = [NSString stringWithFormat:@"name%d.png", centerIndex+1];
    selNameSprite = [CCSprite spriteWithFile:img];
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    selNameSprite.position = ccp(screenSize.width/2, 150);
    [background addChild:selNameSprite];
    CCAction *moveTo1 = [CCMoveBy actionWithDuration:0.5  position:ccp(50, 0)];
    CCAction *moveTo2 = [CCMoveBy actionWithDuration:0.5 position:ccp(-50, 0)];
    [selNameSprite runAction:moveTo1];
    [selNameSprite runAction:moveTo2];
    
}

- (void) dealloc
{
	[index2WheelId release];
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
