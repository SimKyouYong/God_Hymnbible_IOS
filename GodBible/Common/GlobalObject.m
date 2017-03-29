//
//  GlobalObject.m
//  GodBible
//
//  Created by Joseph Kang on 2017. 3. 22..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "GlobalObject.h"

@implementation GlobalObject

+ (GlobalObject *)sharedInstance
{
    static GlobalObject *sharedInstance;
    
    @synchronized(self) {
        if(!sharedInstance) {
            sharedInstance = [[GlobalObject alloc] init];
        }
    }
    
    return sharedInstance;
}

- (id)init
{
    NSLog(@"%s", __FUNCTION__);
    
    self = [super init];
    if (self) {
        _editKeyIndex = @"";
    }
    
    return self;
}

@end
