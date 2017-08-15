//
//  OtherVC.h
//  GodBible
//
//  Created by Joseph_iMac on 2017. 8. 12..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherVC : UIViewController{
    UILabel *contentText;
    
    NSString *prayValue1;
    NSString *prayValue2;
    NSString *prayValue3;
}

- (IBAction)backButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *otherScrollView;

@property (weak, nonatomic) IBOutlet UIView *m_bannerView;

@property (weak, nonatomic) IBOutlet UIButton *bottomBtn1;
- (IBAction)bottomBtn1:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn2;
- (IBAction)bottomBtn2:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn3;
- (IBAction)bottomBtn3:(id)sender;

@end
