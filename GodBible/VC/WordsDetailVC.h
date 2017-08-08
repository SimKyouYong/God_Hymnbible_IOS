//
//  WordsDetailVC.h
//  GodBible
//
//  Created by Joseph Kang on 2017. 8. 8..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsDetailVC : UIViewController{
    NSMutableArray *wordArr;
}

@property (weak, nonatomic) IBOutlet UITableView *wordsDetailTableView;

- (IBAction)backButton:(id)sender;

@property (nonatomic) NSInteger wordName;
@property (nonatomic) NSInteger wordNumber;

@end
