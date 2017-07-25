//
//  SongVC.m
//  GodBible
//
//  Created by Joseph_iMac on 2017. 7. 20..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "SongVC.h"
#import "AppDelegate.h"
#import "SongDetailVC.h"

@interface SongVC ()

@end

@implementation SongVC

@synthesize songTableView;
@synthesize indexBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id AppID = [[UIApplication sharedApplication] delegate];
    
    NSInteger firstValue = 1;
    NSInteger finishValue = 50;
    
    dbArr = [[NSMutableArray alloc] init];
    
    for(int i=0; i<13; i++){
        [dbArr addObject:[AppID selectSongName:firstValue finishNum:finishValue]];
        
        firstValue = firstValue + 50;
        finishValue = finishValue + 50;
    }
    
    sections = @[@"1~50", @"51~100", @"101~150", @"151~200",
                 @"201~250", @"251~300", @"301~350", @"351~400",
                 @"401~450", @"451~500", @"501~550", @"551~600",
                 @"601~645"];
    
    indexBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Next VC

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"songDetail"])
    {
        SongDetailVC *vc = [segue destinationViewController];
        vc.imgPath = songImgPath;;
    }
}

#pragma mark -
#pragma mark UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    [indexBar setIndexes:sections];
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dbArr[section] count];
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
    
    NSDictionary *dic = [[dbArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *songNameDB = [NSString stringWithFormat:@"%@장 %@", [dic objectForKey:@"seq"], [dic objectForKey:@"title"]];
    [cell.textLabel setText:songNameDB];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger resultSongName;
    NSInteger sectionValue = indexPath.section * 50;
    
    resultSongName = sectionValue + indexPath.row + 1;
    
    songImgPath = [NSString stringWithFormat:@"%03ld.JPG", resultSongName];
    
    [self performSegueWithIdentifier:@"songDetail" sender:nil];
}

#pragma mark - AIMTableViewIndexBarDelegate

- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index{
    if ([songTableView numberOfSections] > index && index > -1){   
        [songTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

@end
