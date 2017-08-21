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
    // 찬송가 DB
    [self songDBInit];
    
    // 한글 말씀 DB
    [self krBibleDBInit];
    
    // 영문 말씀 DB
    //[self enBibleDBInit];

    return YES;
}

- (void)songDBInit{
    // 번들에 있는 DB 파일 도큐먼트에 저장
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentArr objectAtIndex:0];
    NSString *documentDBPath = [documentsDirectory stringByAppendingPathComponent:@"song.db"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    BOOL dbexists = [filemanager fileExistsAtPath:documentDBPath];
    if (!dbexists) {
        NSString *bundleDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"song.db"];
        NSLog(@"bundle db %@",bundleDBPath);
        
        NSError *error;
        BOOL success = [filemanager copyItemAtPath:bundleDBPath toPath:documentDBPath error:&error];
        //파일을 복사하는 부분
        
        if (!success) {
            NSLog(@"error : %@",[error localizedDescription]);
        }
    }
}

- (void)krBibleDBInit{
    // 번들에 있는 DB 파일 도큐먼트에 저장
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentArr objectAtIndex:0];
    NSString *documentDBPath = [documentsDirectory stringByAppendingPathComponent:@"bible_kr.db"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    BOOL dbexists = [filemanager fileExistsAtPath:documentDBPath];
    if (!dbexists) {
        NSString *bundleDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bible_kr.db"];
        NSLog(@"bundle db %@",bundleDBPath);
        
        NSError *error;
        BOOL success = [filemanager copyItemAtPath:bundleDBPath toPath:documentDBPath error:&error];
        //파일을 복사하는 부분
        
        if (!success) {
            NSLog(@"error : %@",[error localizedDescription]);
        }
    }
}

- (void)enBibleDBInit{
    // 번들에 있는 DB 파일 도큐먼트에 저장
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentArr objectAtIndex:0];
    NSString *documentDBPath = [documentsDirectory stringByAppendingPathComponent:@"bible_eng.db"];
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    BOOL dbexists = [filemanager fileExistsAtPath:documentDBPath];
    if (!dbexists) {
        NSString *bundleDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bible_eng.db"];
        NSLog(@"bundle db %@",bundleDBPath);
        
        NSError *error;
        BOOL success = [filemanager copyItemAtPath:bundleDBPath toPath:documentDBPath error:&error];
        //파일을 복사하는 부분
        
        if (!success) {
            NSLog(@"error : %@",[error localizedDescription]);
        }
    }
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

// 성경 리스트
- (NSMutableArray *)selectBibleName:(NSString*)bibleName bibleNumer:(NSString*)bibleNumber{
    sqlite3 *database;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"bible_kr.db"];
    if (sqlite3_open([filePath UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"Error");
        return nil;
    }
    
    NSMutableArray *Result = [NSMutableArray array];
    sqlite3_stmt *statement;
    char *sql = "SELECT col_4, col_5 FROM nkrv WHERE col_2=? AND col_3=?";
    
    if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_text(statement, 1, [bibleName UTF8String],  -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 2, [bibleNumber UTF8String],  -1, SQLITE_TRANSIENT);
        
        while (sqlite3_step(statement)==SQLITE_ROW) {
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)],@"col_4",
                                 [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)],@"col_5",
                                 nil];
            [Result addObject:dic];
        }
    }
    return Result;
}

// 선택한 성경 장수
- (NSMutableArray *)selectBibleCount:(NSString*)bibleCount{
    sqlite3 *database;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"bible_kr.db"];
    if (sqlite3_open([filePath UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"Error");
        return nil;
    }
    
    NSMutableArray *Result = [NSMutableArray array];
    sqlite3_stmt *statement;
    char *sql = "SELECT DISTINCT col_3 FROM nkrv WHERE col_2=?";
    
    if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
        sqlite3_bind_text(statement, 1, [bibleCount UTF8String],  -1, SQLITE_TRANSIENT);
        
        while (sqlite3_step(statement)==SQLITE_ROW) {
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)],@"col_3",
                                 nil];
            [Result addObject:dic];
        }
    }
    return Result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
