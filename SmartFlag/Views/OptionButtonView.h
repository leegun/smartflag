//
//  OptionButtonView.h
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionButtonView : UIView
{
    CGRect vcFrame;
    UIButton * menuBtn;
    UIButton * closeBtn;
}

- (id)initWithOwner:(id)owner;

@end
