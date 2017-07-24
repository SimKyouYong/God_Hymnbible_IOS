//
//  AppDelegate.m
//  GodBible
//
//  Created by Joseph Kang on 2017. 3. 22..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 번들에 있는 DB 파일 도큐먼트에 저장
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentArr objectAtIndex:0];
    NSString *documentDBPath = [documentsDirectory stringByAppendingPathComponent:@"song.db"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    BOOL dbexists = [filemanager fileExistsAtPath:documentDBPath];
    if (!dbexists) {
        NSString *bundleDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"song.db"];
        NSLog(@"bundle db %@",bundleDBPath);
        //번들, 개발자가 직접 만든 sqlite 파일의 위치
        NSLog(@"docu db %@", documentDBPath);
        //sqlite 파일이 복사될 도쿠먼트의 위치
        
        NSError *error;
        BOOL success = [filemanager copyItemAtPath:bundleDBPath toPath:documentDBPath error:&error];
        //파일을 복사하는 부분
        
        if (!success) {
            NSLog(@"error : %@",[error localizedDescription]);
        }
    }

    return YES;
}

#pragma mark -
#pragma mark DB

// 찬송가 리스트
- (NSMutableArray *)selectSongName:(NSInteger)firstNum finishNum:(NSInteger)finishNum{
    sqlite3 *database;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"song.db"];
    if (sqlite3_open([filePath UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"Error");
        return nil;
    }
    
    NSMutableArray *Result = [NSMutableArray array];
    sqlite3_stmt *statement;
    char *sql = "SELECT * FROM hymn WHERE seq>=? AND seq<?";
    
    if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_int64(statement, 1, firstNum);
        sqlite3_bind_int64(statement, 2, finishNum);
        while (sqlite3_step(statement)==SQLITE_ROW) {
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithUnsignedInteger:sqlite3_column_int64(statement, 0)],@"seq",
                                 [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)],@"title",
                                 nil];
            [Result addObject:dic];
        }
    }
    return Result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
