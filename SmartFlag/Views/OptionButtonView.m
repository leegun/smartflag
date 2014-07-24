//
//  OptionButtonView.m
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "OptionButtonView.h"

@implementation OptionButtonView

- (id)initWithOwner:(id)owner
{
    //画面サイズ
    vcFrame = [[UIScreen mainScreen] bounds];

    self = [super initWithFrame:CGRectMake(10, vcFrame.size.height - 80, 50, 50)];
    if (self) {
        
        //オプションボタン
        menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuBtn.frame = CGRectMake(0, 0, 50, 50);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"setting.png"] forState:UIControlStateNormal];
        [menuBtn addTarget:owner action:@selector(onMenu:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuBtn];
        
        //閉じるボタン
        closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(0, 0, 50, 50);
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        [closeBtn addTarget:owner action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeBtn];
        
        [self showMenuBtn];

        [self setupNotifications];
    }
    return self;
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
