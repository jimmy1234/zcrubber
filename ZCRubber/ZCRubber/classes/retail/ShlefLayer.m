//
//  ShlefLayer.m
//  ZCRubber
//
//  Created by quan jimmy on 12-11-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShlefLayer.h"
#import "ImageViewLayer.h"
#define COL 4
#define ROW 2

@implementation ShlefLayer
@synthesize movableSprites,beginPoint,dic4IndexAndImageName,preLayer,isScrollable;
-(id) init {
    if((self = [super init])) {
        CCMenuItem *chaMenuItem = [CCMenuItemImage itemFromNormalImage:@"cha.png" selectedImage:@"cha.png" target:self selector:@selector(chaButtonTapped:)];
        chaMenuItem.anchorPoint = ccp(0, 0);
        chaMenuItem.position = CGPointMake(938, 700);
        
        CCMenu *menu = [CCMenu menuWithItems:chaMenuItem, nil];
        menu.position = CGPointMake(0, 0);
        menu.anchorPoint = ccp(0, 0);
        [self addChild:menu z:6 tag:20];
        isScrollable = YES;
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    }

    
    return self;

}

-(void) buildWtihImagePrefix:(NSString *)prefix dic:(NSMutableDictionary *) indexAndImage {
    NSInteger num = indexAndImage.count;
    self.dic4IndexAndImageName = indexAndImage;
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    CCSprite *sprite = [[CCSprite spriteWithFile:[prefix stringByAppendingFormat: @"1.png"]]retain];
    
    movableSprites = [[NSMutableArray alloc] init];
    float  indent = 60.0f;
    float x = indent + sprite.contentSize.width/2, y = 0, offset = 0;
    for (int i = 1; i< num+1; i++) {
        NSString * img = [prefix stringByAppendingFormat: @"%d.png", i];
        CCSprite *sprite = [CCSprite spriteWithFile:img];
        if((i-1) % COL == 0) {
            x = indent + sprite.contentSize.width/2 + offset;
            
            y = screenSize.height + sprite.contentSize.height/2 - ((i-1)/COL+1)*(indent + sprite.contentSize.height);
            
            
        } else {
            x = x + offset + indent + sprite.contentSize.width;
        }
        sprite.position = ccp(x, y);
        [self addChild:sprite];
        
        [movableSprites addObject:sprite];
        if (i % (ROW*COL) == 0) {
            offset = COL * (indent + sprite.contentSize.width);
            y = screenSize.height - indent - sprite.contentSize.height/2;
        }
    }
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    beginPoint = touchLocation;

    return TRUE;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    if (isScrollable == NO) {
        return;
    }
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
    if(CGRectContainsPoint(sprite.boundingBox, ccp(screenSize.width/2, sprite.position.y)) && translation.x>0) {
        return;
    }
    if (movableSprites.count >= COL) {
        NSInteger factor = movableSprites.count/COL;
        sprite =  [movableSprites objectAtIndex:factor*COL-1];
    } else {
        sprite = [movableSprites objectAtIndex:[movableSprites count]-1];
    }
    
    if(CGRectContainsPoint(sprite.boundingBox, ccp(screenSize.width/2, sprite.position.y)) && translation.x<0) {
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

    
}


-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];

    if (abs(beginPoint.x - touchLocation.x) < 5) {
        [self selectSpriteForTouch:touchLocation];
        
    }
    
}

-(NSInteger) spriteOfTouch:(CGPoint)touchLocation{
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
    NSInteger indexOfTouchedSprite = [self spriteOfTouch:touchLocation];
    NSLog(@"index:%d",indexOfTouchedSprite);
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
            
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *scene = [CCScene node];
    ImageViewLayer *imageLayer = [ImageViewLayer node];
    NSString *bigImgName = [dic4IndexAndImageName objectForKey:[NSNumber numberWithInt: indexOfTouchedSprite ]];
    [imageLayer initWithFile:bigImgName :screenSize.height];
    [imageLayer setImagePostion:ccp(screenSize.width/2, screenSize.height/2) ];
//    [cpDetailLayer retain];
    [scene addChild:imageLayer];
    imageLayer.parentLayer = self;
    
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [director pushScene:scene];
}

-(void) chaButtonTapped:(id) sender {
    CCDirector *director = [CCDirector sharedDirector];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:preLayer priority:0 swallowsTouches:YES];
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [director popScene];
}

@end
