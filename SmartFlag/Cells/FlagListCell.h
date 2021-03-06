//
//  FlagListCell.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageManager.h"

@interface FlagListCell : UICollectionViewCell
{
    UIImageView * bgImage;
}

@property (nonatomic) UIImageView * bgImage;

- (void)startAlphaAnimation:(float)delay;
- (void)startAnimation:(float)delay;

@end
