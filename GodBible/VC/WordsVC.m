//
//  WordsVC.m
//  GodBible
//
//  Created by Joseph_iMac on 2017. 7. 30..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "WordsVC.h"
#import "GlobalHeader.h"
#import "WordTitleCount.h"

@interface WordsVC ()

@end

@implementation WordsVC

@synthesize wordTitleChooseView;
@synthesize wordTitleScrollView;
@synthesize wordCountView;
@synthesize wordCountScrollView;
@synthesize m_bannerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 성경 선택
    [self wordTitleChooseInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Button Action

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark wordTitleChoose Method

- (void)wordTitleChooseInit{
    // 성경 제목
    for(int i = 0; i < 66; i++){
        chooseButton[i] = [[UIButton alloc] initWithFrame:CGRectMake((i%5)*WIDTH_FRAME/5, (i/5)*40, WIDTH_FRAME/5, 40)];
        chooseButton[i].hidden = NO;
        chooseButton[i].tag = i;
        [chooseButton[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [chooseButton[i].titleLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:20.0]];
        [chooseButton[i] setTitle:[WordTitleCount wordTitle:i] forState:UIControlStateNormal];
        
        if(i % 2 == 0){
            chooseButton[i].backgroundColor = [UIColor grayColor];
        }
        
        [chooseButton[i] addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [wordTitleScrollView addSubview:chooseButton[i]];
    }
    
    [wordTitleScrollView setContentSize:CGSizeMake(WIDTH_FRAME, 40 * 14)];
}

- (void)selectButton:(UIButton*)sender{
    wordTitleNum = sender.tag;
    
    wordTitleChooseView.hidden = YES;
    wordCountView.hidden = NO;
    
    [self wordCountInit:sender.tag];
}

#pragma mark -
#pragma mark wordCount Method

- (void)wordCountInit:(NSInteger)countNum{
    NSInteger indexNum = [WordTitleCount wordCounNum:countNum];
    
    // 선택한 성경 장수
    for(int i = 0; i < indexNum; i++){
        countButton[i] = [[UIButton alloc] initWithFrame:CGRectMake((i%5)*WIDTH_FRAME/5, (i/5)*40, WIDTH_FRAME/5, 40)];
        countButton[i].hidden = NO;
        countButton[i].tag = i + 1;
        [countButton[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [countButton[i].titleLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:18.0]];
        NSString *countValue = [NSString stringWithFormat:@"%d장", i + 1];
        [countButton[i] setTitle:countValue forState:UIControlStateNormal];
        
        if(i % 2 == 0){
            countButton[i].backgroundColor = [UIColor grayColor];
        }
        
        [countButton[i] addTarget:self action:@selector(selectCountButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [wordCountScrollView addSubview:countButton[i]];
    }
    
    [wordCountScrollView setContentSize:CGSizeMake(WIDTH_FRAME, 40 * (indexNum/5) + 40)];
}

- (void)selectCountButton:(UIButton*)sender{
    wordCountNum = sender.tag;
    
    NSLog(@"%ld", wordTitleNum);
    NSLog(@"%ld", wordCountNum);
}

@end
