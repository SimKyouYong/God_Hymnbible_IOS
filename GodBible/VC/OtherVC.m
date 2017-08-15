//
//  OtherVC.m
//  GodBible
//
//  Created by Joseph_iMac on 2017. 8. 12..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "OtherVC.h"
#import "GlobalHeader.h"

@interface OtherVC ()

@end

@implementation OtherVC

@synthesize otherScrollView;
@synthesize bottomBtn1;
@synthesize bottomBtn2;
@synthesize bottomBtn3;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    prayValue1 = @"하늘에 계신 우리 아버지여\n이름이 거룩히 여김을 받으시오며\n나라에 임하옵시며\n뜻이 하늘에서 임한것 같이\n땅에서도 이루어지이다.\n오늘날 우리에게 일용할 양식을 주시고\n우리가 우리에게 죄 지은 자를 용서한 것 같이\n우리의 죄를 사하여 주옵시고\n우리를 시험에 들게 하지 마옵시고\n다만 악에서 구하옵소서\n대개 나라와 권세와 영광이 영원히 있사옵나이다.\n아멘 \n\n\n하늘에 계신 우리 아버지\n아버지의 이름을 거룩하게 하시며\n아버지의 나라가 오게 하시며\n아버지의 뜻이 하늘에서와 같이 땅에서도 이루어지게 하소서\n오늘 우리에게 일용할 양식을 주시고\n우리가 우리에게 잘못한 사람을 용서하여 준 것같이\n우리 죄를 용서하여 주시고\n우리를 시험에 빠지지 않게 하시고 악에서 구하소서\n나라와 권능과 영광이 영원히 아버지의 것입니다.\n아멘";
    
    prayValue2 = @"전능하사 천지를 만드신 하나님 아버지를\n내가 믿사오며, 그 외아들\n우리 주 예수 그리스도를 믿사오니\n이는 성령으로 잉태하사\n동정녀 마리아에게 나시고\n본디오 빌라도에게 고난을 받으사\n십자가에 못박혀 죽으시고\n장사한지 사흘만에 죽은자 가운데서 다시 살아나시며\n하늘에 오르사\n전능하신 하나님 우편에 앉아 계시다가\n저리로서 산 자와 죽은 자를 심판하러 오시리라\n성령을 믿사오며, 거룩한 공회와\n성도가 서로 교통하는 것과\n죄를 사하여 주시는 것과\n몸이 다시 사는 것과\n영원히 사는 것을 믿사옵나이다\n아멘\n\n\n나는 전능하신 아버지 하나님\n천지의 창조주를 믿습니다\n나는 그의 유일하신 아들\n우리 주 예수 그리스도를 믿습니다\n그는 성령으로 잉태되어\n동정녀 마리아에게서 나시고\n본디오 빌라도에게 고난을 받아\n십자가에 못 박혀 죽으시고\n장사된 지 사흘만에 죽은 자 가운데서 다시 살아나셨으며\n하늘에 오르시어\n전능하신 아버지 하나님 우편에 앉아 계시다가\n거기로부터 살아있는 자와 죽은 자를 심판하러 오십니다\n나는 성령을 믿으며\n거룩한 공교회와 성도의 교제와\n죄를 용서 받는 것과\n몸의 부활과 영생을 믿습니다\n아멘";
    
    prayValue3 = @"제일은 너는 나 외에는 다른 신들을 네게 두지 말라\n제이는 너를 위하여 새긴 우상을 만들지 말고, 또 위로 하늘에 있는 것이나, 아래로 땅에 있는 것이나, 땅 아래 물 속에 있는 것의 어떤 형상도 만들지 말며, 그것들에게 절하지 말며, 그것들을 섬기지 말라\n제삼은 너는 네 하나님 여호와의 이름을 망령되게 부르지 말라\n제사는 안식일을 기억하여 거룩하게 지키라\n제오는 네 부모를 공경하라\n제육은 살인하지 말라\n제칠은 간음하지 말라\n제팔은 도둑질하지 말라\n제구는 네 이웃에 대하여 거짓 증거하지 말라\n제십은 네 이웃의 집을 탐내지 말라";
    
    NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:prayValue1 attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]}];
    CGRect titleRect = [titleAttributedText boundingRectWithSize:(CGSize){WIDTH_FRAME - 20, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    contentText = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, WIDTH_FRAME - 20, titleRect.size.height)];
    contentText.backgroundColor = [UIColor whiteColor];
    [contentText setTextColor:[UIColor colorWithRed:69.0/255.0 green:69.0/255.0 blue:69.0/255.0 alpha:1.0]];
    [contentText setTextAlignment:NSTextAlignmentLeft];
    [contentText setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]];
    contentText.numberOfLines = 0;
    contentText.text = prayValue1;
    [otherScrollView addSubview:contentText];
    
    otherScrollView.contentSize = CGSizeMake(WIDTH_FRAME, titleRect.size.height);
    bottomBtn1.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Button Action

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)bottomBtn1:(id)sender {
    bottomBtn1.enabled = NO;
    bottomBtn2.enabled = YES;
    bottomBtn3.enabled = YES;
    
    NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:prayValue1 attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]}];
    CGRect titleRect = [titleAttributedText boundingRectWithSize:(CGSize){WIDTH_FRAME - 20, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    contentText.text = prayValue1;
    contentText.frame = CGRectMake(10, 0, WIDTH_FRAME - 20, titleRect.size.height);
    otherScrollView.contentSize = CGSizeMake(WIDTH_FRAME, titleRect.size.height);
}

- (IBAction)bottomBtn2:(id)sender {
    bottomBtn1.enabled = YES;
    bottomBtn2.enabled = NO;
    bottomBtn3.enabled = YES;
    
    NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:prayValue2 attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]}];
    CGRect titleRect = [titleAttributedText boundingRectWithSize:(CGSize){WIDTH_FRAME - 20, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    contentText.text = prayValue2;
    contentText.frame = CGRectMake(10, 0, WIDTH_FRAME - 20, titleRect.size.height);
    otherScrollView.contentSize = CGSizeMake(WIDTH_FRAME, titleRect.size.height);
}

- (IBAction)bottomBtn3:(id)sender {
    bottomBtn1.enabled = YES;
    bottomBtn2.enabled = YES;
    bottomBtn3.enabled = NO;
    
    NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:prayValue3 attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]}];
    CGRect titleRect = [titleAttributedText boundingRectWithSize:(CGSize){WIDTH_FRAME - 20, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    contentText.text = prayValue3;
    contentText.frame = CGRectMake(10, 0, WIDTH_FRAME - 20, titleRect.size.height);
    otherScrollView.contentSize = CGSizeMake(WIDTH_FRAME, titleRect.size.height);
}

@end
