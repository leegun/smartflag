//
//  FlagDetailCell.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlagDetailCell : UICollectionViewCell
{
    UIButton * bgImage;
    UILabel * nameTitle;
    UILabel * name;
    UILabel * codeTitle;
    UILabel * code;
    UILabel * areaTitle;
    UILabel * area;
    UILabel * linkTitle;
    UIButton * link;
}

@property (nonatomic) UIButton * bgImage;
@property (nonatomic) UILabel * nameTitle;
@property (nonatomic) UILabel * name;
@property (nonatomic) UILabel * codeTitle;
@property (nonatomic) UILabel * code;
@property (nonatomic) UILabel * areaTitle;
@property (nonatomic) UILabel * area;
@property (nonatomic) UILabel * linkTitle;
@property (nonatomic) UIButton * link;

@end
