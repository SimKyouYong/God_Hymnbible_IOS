//
//  AppDelegate.h
//  GodBible
//
//  Created by Joseph Kang on 2017. 3. 22..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSMutableArray *)selectSongName:(NSInteger)firstNum finishNum:(NSInteger)finishNum;
- (NSMutableArray *)selectBibleName:(NSString*)bibleName bibleNumer:(NSString*)bibleNumber;
- (NSMutableArray *)selectBibleCount:(NSString*)bibleCount;

@end

