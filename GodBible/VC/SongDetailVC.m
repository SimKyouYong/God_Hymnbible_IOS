//
//  SongDetailVC.m
//  GodBible
//
//  Created by Joseph Kang on 2017. 7. 24..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "SongDetailVC.h"

@interface SongDetailVC ()

@end

@implementation SongDetailVC

@synthesize songWebView;

@synthesize imgPath;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", imgPath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
}

@end
