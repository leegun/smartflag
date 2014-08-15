//
//  FlagFitViewController.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagFitViewController.h"
#import "FlagListCell.h"
#import "FlagDetailCell.h"
#import "ScaleFlagsView.h"

@interface FlagFitViewController ()

@end

@implementation FlagFitViewController

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
        [PageManager defaultManager].viewControllerState = STATE_FIT;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [PageManager defaultManager].viewControllerState = STATE_FIT;
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_ALL_BUTTON object:nil];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [PageManager defaultManager].viewControllerState = STATE_DETAIL;
    [super viewWillDisappear:animated];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    //スケールフラグビュー
//    UIWindow * window = [[UIApplication sharedApplication].delegate window];
//    [window addSubview:[[ScaleFlagsView alloc] initWithFlagIndex:(int)indexPath.row]];

    UIViewController *vc = [self nextViewControllerAtPoint:CGPointZero];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    [PageManager defaultManager].viewControllerState = STATE_DETAIL;

    // We could have multiple section stacks and find the right one,
    UICollectionViewFlowLayout* grid = [[UICollectionViewFlowLayout alloc] init];
    grid.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    grid.scrollDirection = UICollectionViewScrollDirectionVertical;
    grid.itemSize = CGSizeMake(320, vcFrame.size.height);
    FlagDetailViewController * nextCollectionViewController = [[FlagDetailViewController alloc] initWithCollectionViewLayout:grid];
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
