//
//  OptionButtonView.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "OptionButtonView.h"

#define TAG_SORT_LINE_VERTICAL      0
#define TAG_SORT_LINE_HORIZONTAL    1
#define TAG_SORT_STAR               2

@implementation OptionButtonView

- (id)initWithOwner:(id)owner
{
    //画面サイズ
    vcFrame = [[UIScreen mainScreen] bounds];

    self = [super initWithFrame:CGRectMake(10, vcFrame.size.height - 120, 310, 50)];
    if (self) {
        
        //長押しフラグ初期化
        longTapFlag = NO;
        
        //オプションボタン
        menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuBtn.frame = CGRectMake(0, 0, 50, 50);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"setting.png"] forState:UIControlStateNormal];
        [menuBtn addTarget:owner action:@selector(onMenu:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuBtn];
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTapMenuBtn:)];
        [menuBtn addGestureRecognizer:longPressGesture];
        
        //閉じるボタン
        closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(0, 0, 50, 50);
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        [closeBtn addTarget:owner action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeBtn];
        
        //クイズボタン
//        quizBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        quizBtn.frame = CGRectMake(260, 0, 50, 50);
//        [quizBtn setBackgroundImage:[UIImage imageNamed:@"quiz.png"] forState:UIControlStateNormal];
//        [quizBtn addTarget:owner action:@selector(onQuiz:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:quizBtn];
        
        [self showMenuBtn];

        [self setupNotifications];
    }
    return self;
}

- (void)longTapMenuBtn:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"long tap");
    if (!longTapFlag) {
        longTapFlag = YES;
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:[Utils setLanguage:@"sort_title"]
                                                           delegate:self
                                                  cancelButtonTitle:[Utils setLanguage:@"sort_cancel"]
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:[Utils setLanguage:@"sort_line_vertical"],
                                                                    [Utils setLanguage:@"sort_line_horizontal"],
                                                                    [Utils setLanguage:@"sort_star"],nil];
        [sheet showInView:self.window];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    longTapFlag = NO;
    if(buttonIndex==actionSheet.cancelButtonIndex){
        return;
    }
    
    switch (buttonIndex) {
        case TAG_SORT_LINE_VERTICAL:
        {
            [Utils setUserDefalut:USER_DEFAULT_SORT value:SORT_LINE_VERTICAL];
        }
            break;
        case TAG_SORT_LINE_HORIZONTAL:
        {
            [Utils setUserDefalut:USER_DEFAULT_SORT value:SORT_LINE_HORIZONTAL];
        }
            break;
        case TAG_SORT_STAR:
        {
            [Utils setUserDefalut:USER_DEFAULT_SORT value:SORT_STAR];
        }
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_FLAG_VIEW_SORT object:nil];
}

- (void)showMenuBtn
{
    menuBtn.alpha = 1;
    menuBtn.hidden = 0;
    closeBtn.alpha = 0;
    closeBtn.hidden = 1;
}

- (void)showCloseBtn
{
    menuBtn.alpha = 0;
    menuBtn.hidden = 1;
    closeBtn.alpha = 1;
    closeBtn.hidden = 0;
}

- (void)onMenu:(UIButton*)button
{
}

- (void)onClose:(UIButton*)button
{
}

- (void)onQuiz:(UIButton*)button
{
}

- (void) setupNotifications
{
    __weak OptionButtonView * weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_SHOW_MENU_BUTTON
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      [weakSelf showMenuBtn];
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_SHOW_CLOSE_BUTTON
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      [weakSelf showCloseBtn];
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_ALPHA_OPTION_BUTTON
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      weakSelf.alpha = 0.3;
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_VISIBLE_OPTION_BUTTON
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      weakSelf.alpha = 1;
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_INVISIBLE_OPTION_BUTTON
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      weakSelf.alpha = 0;
                                                  }];
    
}

@end
