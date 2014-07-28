//
//  OptionButtonView.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionButtonView : UIView <UIActionSheetDelegate>
{
    CGRect vcFrame;
    BOOL longTapFlag;
    
    UIButton * menuBtn;
    UIButton * closeBtn;
    UIButton * quizBtn;
}

- (id)initWithOwner:(id)owner;

@end
