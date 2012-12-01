//
//  PlayVedioLayer.h
//  ZCRubber
//
//  Created by 蔡 毅 on 12-12-1.
//
//

#import "cocos2d.h"
#import "CCVideoPlayer.h"

@interface PlayVedioLayer : CCLayer <CCVideoPlayerDelegate>

-(void) splayFile:(NSString*) file;

@end
