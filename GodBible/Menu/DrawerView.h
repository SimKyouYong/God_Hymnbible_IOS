//
//  Drawer.h
//  CCKFNavDrawer
//
//  Created by calvin on 2/2/14.
//  Copyright (c) 2014年 com.calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrawerDelegate <NSObject>
@required
- (void)DrawerSelection:(NSInteger)selectionIndex;
@end

@interface DrawerView : UIView<UIActionSheetDelegate, UIScrollViewDelegate>{
    NSUserDefaults *defaults;

    UIActivityIndicatorView *activityView;
    UIView *loadingView;
}

@property (weak, nonatomic)id<DrawerDelegate> delegate;

- (IBAction)homeButton:(id)sender;
- (IBAction)bibleButton:(id)sender;
- (IBAction)songButton:(id)sender;

@end
