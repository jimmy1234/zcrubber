//
//  HelloWorldLayer.m
//  Helloworld
//
//  Created by quan jimmy on 12-10-27.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "RootLayer.h"
#import "BackgroundLayer.h"
#import "WheelRotateLayer.h"
#import "MenuLayer.h"
#import "CPScrollViewLayer.h"

// HelloWorldLayer implementation
@implementation RootLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	BackgroundLayer *backLayer = [BackgroundLayer node];
    //CPScrollViewLayer *cpLayer = [CPScrollViewLayer node];
    //MenuLayer *menuLayer = [MenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: backLayer z:0];
    //[scene addChild:cpLayer];
    //[scene addChild:menuLayer z:0];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
//
//		// ask director the the window size
//		CGSize size = [[CCDirector sharedDirector] winSize];
//	
//		// position the label on the center of the screen
//		label.position =  ccp( size.width /2 , size.height/2 );
//		
//		// add the label as a child to this Layer
//		[self addChild: label];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
