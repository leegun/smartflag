//
//  FlagListViewController.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagListViewController.h"
#import "FlagListCell.h"
#import "FlagDetailCell.h"
#import "ScaleFlagsView.h"

@interface FlagListViewController ()

@end

@implementation FlagListViewController

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
        [PageManager defaultManager].viewControllerState = STATE_LIST;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [PageManager defaultManager].viewControllerState = STATE_LIST;
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_MENU_BUTTON object:nil];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [PageManager defaultManager].viewControllerState = STATE_DETAIL;
    [super viewWillDisappear:animated];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //スケールフラグビュー
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:[[ScaleFlagsView alloc] initWithFlagIndex:(int)indexPath.row]];
//    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_SCALE_FLAG_VIEW object:@(indexPath.row) userInfo:nil];

    UIViewController *vc = [self nextViewControllerAtPoint:CGPointZero];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    [PageManager defaultManager].viewControllerState = STATE_FIT;

    // We could have multiple section stacks and find the right one,
    UICollectionViewFlowLayout* grid = [[UICollectionViewFlowLayout alloc] init];
    grid.scrollDirection = UICollectionViewScrollDirectionVertical;
    grid.itemSize = CGSizeMake(320, 212);
    [grid setSectionInset:UIEdgeInsetsMake(0, 0, 120, 0)];
    FlagFitViewController * nextCollectionViewController = [[FlagFitViewController alloc] initWithCollectionViewLayout:grid];
    nextCollectionViewController.useLayoutToLayoutNavigationTransitions = YES;
    return nextCollectionViewController;
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    UICollectionViewTransitionLayout *transitionLayout = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:fromLayout
                                                                                                              nextLayout:toLayout];
    return transitionLayout;
}

@end
