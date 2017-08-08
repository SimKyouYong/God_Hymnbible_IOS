//
//  WordsCell.h
//  GodBible
//
//  Created by Joseph Kang on 2017. 8. 8..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsCell : UITableViewCell{
    UILabel *indexNumber;
    UILabel *contentText;
    UIView *line;
}

@property (nonatomic) UILabel *indexNumber;
@property (nonatomic) UILabel *contentText;
@property (nonatomic) UIView *line;

@end
