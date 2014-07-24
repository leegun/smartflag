//
//  FlagDetailCell.h
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlagDetailCell : UICollectionViewCell
{
    UIImageView * bgImage;
    UILabel * name;
    UIButton * link;
}

@property (nonatomic) UIImageView * bgImage;
@property (nonatomic) UILabel * name;
@property (nonatomic) UIButton * link;

@end
