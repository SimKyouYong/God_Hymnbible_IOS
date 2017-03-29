//
//  GlobalHeader.h
//  GodBible
//
//  Created by Joseph Kang on 2017. 3. 22..
//  Copyright © 2017년 Joseph Kang. All rights reserved.
//

#define DOCUMENT_DIRECTORY [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define WIDTH_FRAME             [[UIScreen mainScreen] bounds].size.width
#define HEIGHT_FRAME            [[UIScreen mainScreen] bounds].size.height

// 메모리 보관
#define EDIT_KEYINDEX           [GlobalObject sharedInstance].editKeyIndex

