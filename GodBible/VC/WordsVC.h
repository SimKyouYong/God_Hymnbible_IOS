//
//  WordsVC.h
//  GodBible
//
//  Created by Joseph_iMac on 2017. 7. 30..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsVC : UIViewController{
    UIButton *chooseButton[66];
    UIButton *countButton[66];
    
    NSInteger wordTitleNum;
    NSInteger wordCountNum;
}

@property (weak, nonatomic) IBOutlet UIView *wordTitleChooseView;
@property (weak, nonatomic) IBOutlet UIScrollView *wordTitleScrollView;

@property (weak, nonatomic) IBOutlet UIView *wordCountView;
@property (weak, nonatomic) IBOutlet UIScrollView *wordCountScrollView;

- (IBAction)backAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *m_bannerView;

@end
