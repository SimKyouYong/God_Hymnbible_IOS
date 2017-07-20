//
//  SongVC.h
//  GodBible
//
//  Created by Joseph_iMac on 2017. 7. 20..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AIMTableViewIndexBar.h"

@interface SongVC : UIViewController<AIMTableViewIndexBarDelegate>{
    NSArray *sections;
    NSArray *rows;
}

@property (weak, nonatomic) IBOutlet UITableView *songTableView;
@property (weak, nonatomic) IBOutlet AIMTableViewIndexBar *indexBar;

- (IBAction)backButton:(id)sender;

@end
