//
//  SongVC.m
//  GodBible
//
//  Created by Joseph_iMac on 2017. 7. 20..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "SongVC.h"

@interface SongVC ()

@end

@implementation SongVC

@synthesize songTableView;
@synthesize indexBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sections = @[@"1~50", @"51~100", @"101~150", @"151~200",
                 @"201~250", @"251~300", @"301~350", @"351~400",
                 @"401~450", @"451~500", @"501~550", @"551~600",
                 @"601~645"];
    
    rows = @[@[@"1장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"51장", @"52장", @"53장", @"54장", @"55장", @"56장"],
             @[@"101장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"151장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"201장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"251장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"301장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"351장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"401장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"451장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"501장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"551장", @"2장", @"3장", @"4장", @"5장", @"6장"],
             @[@"601장", @"602장", @"603장", @"604장", @"605장", @"606장"]];
    
    indexBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    [indexBar setIndexes:sections]; // to always have exact number of sections in table and indexBar
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [rows[section] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return sections[section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"TableViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell.textLabel setText:rows[indexPath.section][indexPath.row]];
    return cell;
}

#pragma mark - AIMTableViewIndexBarDelegate

- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index{
    if ([songTableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [songTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

@end
