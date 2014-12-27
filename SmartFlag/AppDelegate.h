//
//  AppDelegate.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APLTransitionController.h"
#import "AbstractCollectionViewController.h"
#import "LeftMenuViewController.h"
#import "NADView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate, APLTransitionControllerDelegate, NADViewDelegate>
{
    BOOL leftMenuShowing;
    LeftMenuViewController *leftMenuViewController;
    UIView * disableTouchView;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (nonatomic) APLTransitionController *transitionController;
@property (nonatomic) BOOL leftMenuShowing;
@property (strong, nonatomic) LeftMenuViewController *leftMenuViewController;
//@property (nonatomic, retain) NADView * nadView;

@end
