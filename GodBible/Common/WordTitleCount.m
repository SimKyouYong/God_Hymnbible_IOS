//
//  WordTitleCount.m
//  GodBible
//
//  Created by Joseph_iMac on 2017. 7. 30..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#import "WordTitleCount.h"

@implementation WordTitleCount

+ (NSString *)wordTitle:(NSInteger)indexNum{
    NSString *returnName = @"";
    
    switch (indexNum) {
        case 0:
            returnName = @"창";
            break;
            
        case 1:
            returnName = @"출";
            break;
            
        case 2:
            returnName = @"레";
            break;
            
        case 3:
            returnName = @"민";
            break;
            
        case 4:
            returnName = @"신";
            break;
            
        case 5:
            returnName = @"수";
            break;
            
        case 6:
            returnName = @"삿";
            break;
            
        case 7:
            returnName = @"룻";
            break;
            
        case 8:
            returnName = @"삼상";
            break;
            
        case 9:
            returnName = @"삼하";
            break;
            
        case 10:
            returnName = @"왕상";
            break;
            
        case 11:
            returnName = @"왕하";
            break;
            
        case 12:
            returnName = @"대상";
            break;
            
        case 13:
            returnName = @"대하";
            break;
            
        case 14:
            returnName = @"스";
            break;
            
        case 15:
            returnName = @"느";
            break;
            
        case 16:
            returnName = @"에";
            break;
            
        case 17:
            returnName = @"욥";
            break;
            
        case 18:
            returnName = @"시";
            break;
            
        case 19:
            returnName = @"잠";
            break;
            
        case 20:
            returnName = @"전";
            break;
            
        case 21:
            returnName = @"아";
            break;
            
        case 22:
            returnName = @"사";
            break;
            
        case 23:
            returnName = @"렘";
            break;
            
        case 24:
            returnName = @"애";
            break;
            
        case 25:
            returnName = @"겔";
            break;
            
        case 26:
            returnName = @"단";
            break;
            
        case 27:
            returnName = @"호";
            break;
            
        case 28:
            returnName = @"욜";
            break;
            
        case 29:
            returnName = @"암";
            break;
            
        case 30:
            returnName = @"옵";
            break;
            
        case 31:
            returnName = @"욘";
            break;
            
        case 32:
            returnName = @"미";
            break;
            
        case 33:
            returnName = @"나";
            break;
            
        case 34:
            returnName = @"합";
            break;
            
        case 35:
            returnName = @"습";
            break;
            
        case 36:
            returnName = @"학";
            break;
            
        case 37:
            returnName = @"슥";
            break;
            
        case 38:
            returnName = @"말";
            break;
            
        case 39:
            returnName = @"마";
            break;
            
        case 40:
            returnName = @"막";
            break;
            
        case 41:
            returnName = @"눅";
            break;
            
        case 42:
            returnName = @"요";
            break;
            
        case 43:
            returnName = @"행";
            break;
            
        case 44:
            returnName = @"롬";
            break;
            
        case 45:
            returnName = @"고전";
            break;
            
        case 46:
            returnName = @"고후";
            break;
            
        case 47:
            returnName = @"갈";
            break;
            
        case 48:
            returnName = @"엡";
            break;
            
        case 49:
            returnName = @"빌";
            break;
            
        case 50:
            returnName = @"골";
            break;
            
        case 51:
            returnName = @"살전";
            break;
            
        case 52:
            returnName = @"살후";
            break;
            
        case 53:
            returnName = @"딤전";
            break;
            
        case 54:
            returnName = @"딤후";
            break;
            
        case 55:
            returnName = @"딛";
            break;
            
        case 56:
            returnName = @"몬";
            break;
            
        case 57:
            returnName = @"히";
            break;
            
        case 58:
            returnName = @"약";
            break;
            
        case 59:
            returnName = @"벧전";
            break;
            
        case 60:
            returnName = @"벧후";
            break;
            
        case 61:
            returnName = @"요일";
            break;
            
        case 62:
            returnName = @"요이";
            break;
            
        case 63:
            returnName = @"요삼";
            break;
            
        case 64:
            returnName = @"유";
            break;
            
        case 65:
            returnName = @"계";
            break;
            
        default:
            break;
    }
    
    return returnName;
}

+ (NSInteger)wordCounNum:(NSInteger)indexNum{
    NSInteger returnNum = 0;
    
    switch (indexNum) {
        case 0:
            returnNum = 50;
            break;
            
        case 1:
            returnNum = 40;
            break;
            
        case 2:
            returnNum = 27;
            break;
            
        case 3:
            returnNum = 36;
            break;
            
        case 4:
            returnNum = 34;
            break;
            
        case 5:
            returnNum = 24;
            break;
            
        case 6:
            returnNum = 21;
            break;
            
        case 7:
            returnNum = 4;
            break;
            
        case 8:
            returnNum = 31;
            break;
            
        case 9:
            returnNum = 24;
            break;
            
        case 10:
            returnNum = 22;
            break;
            
        case 11:
            returnNum = 25;
            break;
            
        case 12:
            returnNum = 29;
            break;
            
        case 13:
            returnNum = 36;
            break;
            
        case 14:
            returnNum = 10;
            break;
            
        case 15:
            returnNum = 13;
            break;
            
        case 16:
            returnNum = 10;
            break;
            
        case 17:
            returnNum = 42;
            break;
            
        case 18:
            returnNum = 150;
            break;
            
        case 19:
            returnNum = 31;
            break;
            
        case 20:
            returnNum = 12;
            break;
            
        case 21:
            returnNum = 8;
            break;
            
        case 22:
            returnNum = 66;
            break;
            
        case 23:
            returnNum = 52;
            break;
            
        case 24:
            returnNum = 5;
            break;
            
        case 25:
            returnNum = 48;
            break;
            
        case 26:
            returnNum = 12;
            break;
            
        case 27:
            returnNum = 14;
            break;
            
        case 28:
            returnNum = 3;
            break;
            
        case 29:
            returnNum = 9;
            break;
            
        case 30:
            returnNum = 1;
            break;
            
        case 31:
            returnNum = 4;
            break;
            
        case 32:
            returnNum = 7;
            break;
            
        case 33:
            returnNum = 3;
            break;
            
        case 34:
            returnNum = 3;
            break;
            
        case 35:
            returnNum = 3;
            break;
            
        case 36:
            returnNum = 24;
            break;
            
        case 37:
            returnNum = 21;
            break;
            
        case 38:
            returnNum = 4;
            break;
            
        case 39:
            returnNum = 28;
            break;
            
        case 40:
            returnNum = 16;
            break;
            
        case 41:
            returnNum = 24;
            break;
            
        case 42:
            returnNum = 21;
            break;
            
        case 43:
            returnNum = 28;
            break;
            
        case 44:
            returnNum = 16;
            break;
            
        case 45:
            returnNum = 16;
            break;
            
        case 46:
            returnNum = 13;
            break;
            
        case 47:
            returnNum = 6;
            break;
            
        case 48:
            returnNum = 6;
            break;
            
        case 49:
            returnNum = 4;
            break;
            
        case 50:
            returnNum = 4;
            break;
            
        case 51:
            returnNum = 5;
            break;
            
        case 52:
            returnNum = 3;
            break;
            
        case 53:
            returnNum = 6;
            break;
            
        case 54:
            returnNum = 4;
            break;
            
        case 55:
            returnNum = 3;
            break;
            
        case 56:
            returnNum = 1;
            break;
            
        case 57:
            returnNum = 13;
            break;
            
        case 58:
            returnNum = 5;
            break;
            
        case 59:
            returnNum = 5;
            break;
            
        case 60:
            returnNum = 3;
            break;
            
        case 61:
            returnNum = 5;
            break;
            
        case 62:
            returnNum = 1;
            break;
            
        case 63:
            returnNum = 1;
            break;
            
        case 64:
            returnNum = 1;
            break;
            
        case 65:
            returnNum = 22;
            break;
            
        default:
            break;
    }
    
    return returnNum;
}

@end
