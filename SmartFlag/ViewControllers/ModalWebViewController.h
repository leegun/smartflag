//
//  ModalWebViewController.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLRoundButton.h"
#import "NADView.h"

@interface ModalWebViewController : UIViewController <UIWebViewDelegate>
{
    NSString *linkUrl;
    UIWebView * webview;
    GLRoundButton * closeBtn;
}

- (id)initWithUrl:(NSString *)urlStr;

@end
