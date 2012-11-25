//
//  ImageUIViewScrollViewLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-11-20.
//
//

#import "ImageUIViewScrollViewLayer.h"
#import "CCUIViewWrapper.h"

@implementation ImageUIViewScrollViewLayer

- (id) init {
    self = [super init];
    if(self != nil) {
        
        
    }
    return self;
}

-(void) initWithFilenames:(NSArray*)filenames {
     
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        float width = screenSize.width;width = 1024.0f;
    
    float height = screenSize.height;height = 768.0f;
        NSLog(@"initWithFilenames: x:%f, y:%f", width, height);
    
        UIScrollView *sv = [[[UIScrollView alloc] initWithFrame:CGRectMake(-150.0f, -900.0f, width, height)] autorelease];

        sv.contentSize = CGSizeMake(filenames.count* width, height/2);
        sv.pagingEnabled = YES;
    //sv.
  
   
        //sv.delegate = self;
        int i = 0;
        for (NSString*  filename in filenames) {
            UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:filename]];
            iv.frame = CGRectMake(i * screenSize.width, 0.0f, sv.frame.size.width, sv.frame.size.height);
            //iv.cont
            //iv.
            [sv addSubview:iv];
            [iv release];
            i++;
        }
        
        CCUIViewWrapper *wrapper2 = [CCUIViewWrapper wrapperForUIView:sv];
    //wrapper2.anchorPoint = ccp(0.5, 0.5);
    [wrapper2 setRotation:90];
        
        [self addChild:wrapper2 z:9999];

}

@end
