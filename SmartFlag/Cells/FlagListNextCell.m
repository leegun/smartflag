//
//  FlagListNextCell.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagListNextCell.h"

@implementation FlagListNextCell

@synthesize bgImage,name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景イメージ
        bgImage = [UIImageView new];
        bgImage.frame = CGRectMake(0, 0, 80, 53);
        [self addSubview:bgImage];
        
        //国名
        name = [UILabel new];
        name.frame = CGRectMake(100, 0, 220, 53);
        name.font = [UIFont systemFontOfSize:18];
        name.textColor = [UIColor whiteColor];
        [self addSubview:name];

    }
    return self;
}

@end
