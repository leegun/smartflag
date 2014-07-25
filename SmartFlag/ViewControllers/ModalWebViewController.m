//
//  ModalWebViewController.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "ModalWebViewController.h"

@interface ModalWebViewController ()

@end

@implementation ModalWebViewController

- (id)initWithUrl:(NSString *)urlStr
{
    self = [super init];
    if (self) {
        
        if (urlStr != nil) {
            linkUrl = urlStr;
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //WebView
    int vcHeight = [[UIScreen mainScreen] bounds].size.height;
    webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, vcHeight)];
    webview.delegate = self;
    [self.view addSubview:webview];
    
    if (linkUrl != nil) {
        
        //URL遷移
        NSURL *url = [NSURL URLWithString:[linkUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//        NSURL *url = [NSURL URLWithString:linkUrl];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webview loadRequest:req];
    }
    
    //閉じるボタン
    closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(10, vcHeight - 80, 50, 50);
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];

    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_INVISIBLE_OPTION_BUTTON object:nil];
}

- (void)onClose:(UIButton*)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_VISIBLE_OPTION_BUTTON object:nil];
}

- (void)onBack
{
    if ([webview canGoBack]) {
        [webview goBack];
    }
}

- (void)onReload
{
    [webview reload];
}

- (void)onNext
{
    if ([webview canGoForward]) {
        [webview goForward];
    }
}

// ページ読込開始時にインジケータをくるくるさせる
-(void)webViewDidStartLoad:(UIWebView*)webView{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_LOADING_VIEW object:nil];
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_HIDE_LOADING_VIEW object:nil];
}

@end
