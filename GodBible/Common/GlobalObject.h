//
//  GlobalObject.h
//  GodBible
//
//  Created by Joseph Kang on 2017. 3. 22..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalObject : NSObject

+ (GlobalObject *)sharedInstance;

@property (nonatomic, assign) NSString *editKeyIndex;

@end

