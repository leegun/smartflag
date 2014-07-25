//
//  FlagViewController.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagViewController.h"

@interface FlagViewController ()

@end

@implementation FlagViewController

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_CLOSE_BUTTON object:nil];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    UICollectionViewTransitionLayout *transitionLayout = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:fromLayout
                                                                                                              nextLayout:toLayout];
    return transitionLayout;
}


@end
