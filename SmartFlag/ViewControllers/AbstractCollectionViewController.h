//
//  AbstractCollectionViewController.h
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlagIconCell.h"
#import "FlagDetailCell.h"
#import "PageManager.h"

#define CELL_FLAG_BALL      @"FlagIconCell"
#define CELL_FLAG_DETAIL    @"FlagDetailCell"

@interface AbstractCollectionViewController : UICollectionViewController <UIScrollViewDelegate>
{
    CGRect vcFrame;
    NSArray * flagDataArray;
}

@property (nonatomic) NSArray * flagDataArray;

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p;

-(void)allCellReload;

@end