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
    UILabel * name;
    UIButton * link;
}

@property (nonatomic) UIButton * bgImage;
@property (nonatomic) UILabel * name;
@property (nonatomic) UIButton * link;

@end
