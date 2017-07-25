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

@synthesize songImageView;
@synthesize imgPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    songImageView.image = [UIImage imageNamed:imgPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
