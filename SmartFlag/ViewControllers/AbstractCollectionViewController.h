//
//  AbstractCollectionViewController.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlagListCell.h"
#import "FlagListNextCell.h"
#import "FlagFitCell.h"
#import "FlagDetailCell.h"
#import "AdCell.h"
#import "PageManager.h"

#define CELL_FLAG_LIST      @"FlagListCell"
#define CELL_FLAG_LIST_NEXT @"FlagListNextCell"
#define CELL_FLAG_FIT       @"FlagFitCell"
#define CELL_FLAG_DETAIL    @"FlagDetailCell"
#define CELL_AD             @"AdCell"

@interface AbstractCollectionViewController : UICollectionViewController <UIScrollViewDelegate>
{
    CGRect vcFrame;
    NSMutableArray * flagDataArray;
    NSMutableArray * adFlagDataArray;
}

@property (nonatomic) NSMutableArray * flagDataArray;
@property (nonatomic) NSMutableArray * adFlagDataArray;

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p;

-(void)allCellReload;

@end
