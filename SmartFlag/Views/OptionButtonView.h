//
//  OptionButtonView.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageManager.h"
#import "GLRoundButton.h"

@interface OptionButtonView : UIView <UIActionSheetDelegate>
{
    CGRect vcFrame;
    BOOL longTapFlag;
    
    GLRoundButton * menuBtn;
    GLRoundButton * closeBtn;
//    GLRoundButton * quizBtn;
}

- (id)initWithOwner:(id)owner;

@end
