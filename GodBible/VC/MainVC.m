//
//  MainVC.m
//  GodBible
//
//  Created by Joseph Kang on 2017. 3. 22..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "MainVC.h"
#import "DrawerNavigation.h"

@interface MainVC ()
@property (strong, nonatomic) DrawerNavigation *rootNav;
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootNav = (DrawerNavigation *)self.navigationController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Button Action

- (IBAction)menuButton:(id)sender {
    [self.rootNav drawerToggle];
}

@end
