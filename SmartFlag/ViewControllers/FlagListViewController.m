//
//  FlagListViewController.m
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagListViewController.h"
#import "FlagIconCell.h"
#import "FlagDetailCell.h"

@interface FlagListViewController ()

@end

@implementation FlagListViewController

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
        [PageManager defaultManager].detailFlag = NO;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [PageManager defaultManager].detailFlag = NO;
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_MENU_BUTTON object:nil];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [PageManager defaultManager].detailFlag = YES;
    [super viewWillDisappear:animated];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [self nextViewControllerAtPoint:CGPointZero];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    [PageManager defaultManager].detailFlag = YES;

    // We could have multiple section stacks and find the right one,
    UICollectionViewFlowLayout* grid = [[UICollectionViewFlowLayout alloc] init];
    grid.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    grid.itemSize = CGSizeMake(320, vcFrame.size.height);
    FlagViewController * nextCollectionViewController = [[FlagViewController alloc] initWithCollectionViewLayout:grid];
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
