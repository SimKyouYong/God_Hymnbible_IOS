//
//  WordsDetailVC.m
//  GodBible
//
//  Created by Joseph Kang on 2017. 8. 8..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "WordsDetailVC.h"
#import "WordsCell.h"
#import "AppDelegate.h"
#import "GlobalHeader.h"

@interface WordsDetailVC ()

@end

@implementation WordsDetailVC

@synthesize wordsDetailTableView;
@synthesize m_bannerView;
@synthesize bibleTextName;
@synthesize wordName;
@synthesize wordNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self wordsListInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)wordsListInit{
    wordArr = [[NSMutableArray alloc] init];
    id AppID = [[UIApplication sharedApplication] delegate];
    
    NSString *nameValue = [NSString stringWithFormat:@"%ld", wordName];
    NSString *numberValue = [NSString stringWithFormat:@"%ld", wordNumber];
    wordArr = [AppID selectBibleName:nameValue bibleNumer:numberValue];
    
    NSMutableArray *countNumArr = [[NSMutableArray alloc] init];
    countNumArr = [AppID selectBibleCount:nameValue];
    bibleWordCountNum = [countNumArr count];
    
    [wordsDetailTableView reloadData];
}

#pragma mark -
#pragma mark Button Action

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)prevButton:(id)sender {
    if(wordName == 1){
        if(wordNumber == 1){
            return;
        }else{
            wordNumber--;
            [self wordsListInit];
        }
    }else{
        if(wordNumber == 1){
            wordName--;
            
            id AppID = [[UIApplication sharedApplication] delegate];
            NSMutableArray *countNumArr = [[NSMutableArray alloc] init];
            NSString *nameValue = [NSString stringWithFormat:@"%ld", wordName];
            countNumArr = [AppID selectBibleCount:nameValue];
            wordNumber = [countNumArr count];
        }else{
            wordNumber--;
        }
        
        [self wordsListInit];
    }
}

- (IBAction)nextButton:(id)sender {
    if(bibleWordCountNum == wordNumber){
        wordName++;
        wordNumber = 1;
    }else{
        wordNumber++;
    }
    
    [self wordsListInit];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wordArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [wordArr objectAtIndex:indexPath.row];
    
    NSString *titleLength = [dic objectForKey:@"col_5"];
    NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:titleLength attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]}];
    CGRect titleRect = [titleAttributedText boundingRectWithSize:(CGSize){WIDTH_FRAME - 45, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize titleSize = titleRect.size;
    
    return titleSize.height + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WordsCell *cell = (WordsCell *)[tableView dequeueReusableCellWithIdentifier:@"WordsCell"];
    
    if (cell == nil){
        cell = [[WordsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"WordsCell"];
    }
    
    [cell setBackgroundView:nil];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    // 셀 터치 시 파란색 배경 변경 효과 방지
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSDictionary *dic = [wordArr objectAtIndex:indexPath.row];
    
    NSString *titleLength = [dic objectForKey:@"col_5"];
    NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:titleLength attributes:@{NSFontAttributeName:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0]}];
    CGRect titleRect = [titleAttributedText boundingRectWithSize:(CGSize){WIDTH_FRAME - 45, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize titleSize = titleRect.size;
    
    cell.indexNumber.text = [dic objectForKey:@"col_4"];
    cell.contentText.text = titleLength;
    cell.contentText.frame = CGRectMake(40, 0, WIDTH_FRAME - 45, titleSize.height);
    cell.line.frame = CGRectMake(0, titleSize.height + 9.5, WIDTH_FRAME, 0.5);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 테이블 항목 터치에 대한 이벤트는 방지. 테이블 셀 위의 버튼 이벤트도 대치하기 위함.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    return;
}

@end
