//
//  SongDetailVC.h
//  GodBible
//
//  Created by Joseph Kang on 2017. 7. 24..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *songImageView;

@property (nonatomic) NSString *imgPath;

- (IBAction)backButton:(id)sender;

@end
