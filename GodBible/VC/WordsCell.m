//
//  WordsCell.m
//  GodBible
//
//  Created by Joseph Kang on 2017. 8. 8..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "WordsCell.h"
#import "GlobalHeader.h"

@implementation WordsCell

@synthesize indexNumber;
@synthesize contentText;
@synthesize line;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        indexNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        [indexNumber setBackgroundColor:[UIColor clearColor]];
        indexNumber.textColor = [UIColor blackColor];
        indexNumber.textAlignment = NSTextAlignmentCenter;
        indexNumber.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:12.0];
        [self addSubview:indexNumber];
        
        contentText = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, WIDTH_FRAME - 45, 50)];
        [contentText setBackgroundColor:[UIColor clearColor]];
        contentText.textColor = [UIColor blackColor];
        contentText.textAlignment = NSTextAlignmentLeft;
        contentText.numberOfLines = 0;
        contentText.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0];
        [self addSubview:contentText];
        
        line = [[UIView alloc] init];
        line.backgroundColor = [UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
        line.frame = CGRectMake(0, 79.5, WIDTH_FRAME, 0.5);
        [self addSubview:line];
    }
    return self;
}

@end
