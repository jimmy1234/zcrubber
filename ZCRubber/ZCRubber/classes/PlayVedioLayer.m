//
//  PlayVedioLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-12-1.
//
//

#import "PlayVedioLayer.h"

@implementation PlayVedioLayer

- (id) init {
    self = [super init];
    if(self != nil) {
       [CCVideoPlayer setDelegate: self]; 
        
    }
    return self;
}

-(void) playFile:(NSString*) file {    
    [CCVideoPlayer playMovieWithFile:file];
    [CCVideoPlayer setNoSkip: YES];
}





-(void)moviePlaybackFinished{
    [[CCDirector sharedDirector] startAnimation];
}

-(void)movieStartsPlaying{
    [[CCDirector sharedDirector] stopAnimation];
    
}

@end
