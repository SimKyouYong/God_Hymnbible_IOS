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

@property (weak, nonatomic) IBOutlet UIView *m_bannerView;

@property (weak, nonatomic) IBOutlet UILabel *bibleTextName;

- (IBAction)backButton:(id)sender;
- (IBAction)prevButton:(id)sender;
- (IBAction)nextButton:(id)sender;

@property (nonatomic) NSInteger wordName;
@property (nonatomic) NSInteger wordNumber;

@end
