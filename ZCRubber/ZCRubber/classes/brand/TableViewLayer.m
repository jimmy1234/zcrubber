//
//  TableViewLayer.m
//  ZCRubber
//
//  Created by 蔡 毅 on 12-11-24.
//
//

#import "TableViewLayer.h"
#import "CCUIViewWrapper.h"

@implementation TableViewLayer

- (id) init {
    self = [super init];
    if(self != nil) {
        
        
    }
    return self;
}

-(void) initWithFilenames:(NSArray*)filenames {
    
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    float width = screenSize.width-100;
    float height = screenSize.height - 100;
    NSLog(@"initWithFilenames: x:%f, y:%f", width, height);
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 960, 600) style:UITableViewStylePlain];
    //table.
    
    table.contentSize = CGSizeMake(filenames.count* width, height);
    table.pagingEnabled = YES;
    
    
    //sv.delegate = self;
    int i = 0;
    for (NSString*  filename in filenames) {
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:filename]];
        iv.frame = CGRectMake(i * screenSize.width, 0.0f, width, height);
        [table addSubview:iv];
        [iv release];
        i++;
    }
    [[[CCDirector sharedDirector] openGLView] addSubview:table];
    
    [table release];
    self.isTouchEnabled=YES;
    
   // CCUIViewWrapper *wrapper2 = [CCUIViewWrapper wrapperForUIView:sv];
    //wrapper2.anchorPoint = ccp(0.5, 0.5);
    
    //[self addChild:wrapper2 z:9999];
    
}

@end
