//
//  AppDelegate.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "AppDelegate.h"
#import "FlagListViewController.h"
#import "OptionButtonView.h"
#import "ModalWebViewController.h"
#import "LoadingView.h"

#define TAG_DISABLE_TOUCH_VIEW  1

@implementation AppDelegate

@synthesize leftMenuShowing,leftMenuViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //設定値を初期化
    [Utils initUserDefalut];
    
    //フラグリストコレクションビューレイアウト
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(80, 53);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    
    //フラグリストコレクションビュー
    FlagListViewController * flagListViewController= [[FlagListViewController alloc] initWithCollectionViewLayout:layout];
    
    //ナビゲーションコントローラ
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:flagListViewController];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.delegate = self;
    
    //アニメーション
    _transitionController = [[APLTransitionController alloc] initWithCollectionView:flagListViewController.collectionView];
    _transitionController.delegate = self;

    //Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.navigationController];
    [self.window makeKeyAndVisible];

    //左メニュー
    leftMenuViewController = [[LeftMenuViewController alloc] init];
    [self.window addSubview:leftMenuViewController.view];
    leftMenuShowing = NO;
    
    disableTouchView = [[UIView alloc] initWithFrame:self.navigationController.view.bounds];
    disableTouchView.backgroundColor = [UIColor blackColor];
    disableTouchView.alpha = 0.7;
    disableTouchView.tag = TAG_DISABLE_TOUCH_VIEW;

    //オプションボタン
    [self.window addSubview:[[OptionButtonView alloc] initWithOwner:self]];
    
    //ローディングビュー
    [self.window addSubview:[LoadingView new]];
    
    [self setupNotifications];
    
    return YES;
}

- (void)onMenu:(UIButton*)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_LEFTMENU object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_INVISIBLE_OPTION_BUTTON object:nil];
}

- (void)onClose:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)interactionBeganAtPoint:(CGPoint)p
{
    // Very basic communication between the transition controller and the top view controller
    // It would be easy to add more control, support pop, push or no-op
    AbstractCollectionViewController *presentingVC = (AbstractCollectionViewController *)[self.navigationController topViewController];
    AbstractCollectionViewController *presentedVC = (AbstractCollectionViewController *)[presentingVC nextViewControllerAtPoint:p];
    if (presentedVC!=nil)
    {
        [self.navigationController pushViewController:presentedVC animated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    if (animationController==self.transitionController)
    {
        return self.transitionController;
    }
    return nil;
}


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (![fromVC isKindOfClass:[UICollectionViewController class]] || ![toVC isKindOfClass:[UICollectionViewController class]])
    {
        return nil;
    }
    if (!self.transitionController.hasActiveInteraction)
    {
        return nil;
    }
    
    self.transitionController.navigationOperation = operation;
    return self.transitionController;
}

- (void) setupNotifications
{
    __weak AppDelegate * weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_SHOW_LEFTMENU
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {

                                                      weakSelf.leftMenuShowing = YES;
                                                      [weakSelf disableTouchInMainView];
                                                      
                                                      [UIView animateWithDuration:0.2
                                                                       animations:^{

                                                                           CGRect leftframe = weakSelf.leftMenuViewController.view.frame;
                                                                           weakSelf.leftMenuViewController.view.frame = CGRectMake(0, leftframe.origin.y, leftframe.size.width, leftframe.size.height);

                                                                           CGRect naviframe = weakSelf.navigationController.view.frame;
                                                                           weakSelf.navigationController.view.frame = CGRectMake(leftframe.size.width, naviframe.origin.y, naviframe.size.width, naviframe.size.height);
                                                                       }
                                                                       completion:^(BOOL finished){
                                                                           
                                                                       }
                                                       ];
                                                  }];

    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_HIDE_LEFTMENU
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      weakSelf.leftMenuShowing = NO;
                                                      [weakSelf enableTouchInMainView];
                                                      
                                                      [UIView animateWithDuration:0.2
                                                                       animations:^{
                                                                           CGRect leftframe = weakSelf.leftMenuViewController.view.frame;
                                                                           weakSelf.leftMenuViewController.view.frame = CGRectMake(-leftframe.size.width, leftframe.origin.y, leftframe.size.width, leftframe.size.height);

                                                                           CGRect naviframe = weakSelf.navigationController.view.frame;
                                                                           weakSelf.navigationController.view.frame = CGRectMake(0, naviframe.origin.y, naviframe.size.width, naviframe.size.height);
                                                                       }
                                                                       completion:^(BOOL finished){
                                                                       }

                                                       ];
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_SHOW_WEB_VIEW
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      NSString * urlStr = [notification object];
                                                      ModalWebViewController * web = [[ModalWebViewController alloc] initWithUrl:urlStr];
                                                      [weakSelf.navigationController presentViewController:web animated:YES completion:nil];
                                                  }];

}

-(void) disableTouchInMainView{
    [_navigationController.view addSubview:disableTouchView];
}

-(void) enableTouchInMainView{
    [disableTouchView removeFromSuperview];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case TAG_DISABLE_TOUCH_VIEW:
            if(leftMenuShowing)
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_HIDE_LEFTMENU object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_VISIBLE_OPTION_BUTTON object:nil];
            break;
            
        default:
            break;
    }
}

@end
