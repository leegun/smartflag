//
//  FlagDetailCell.m
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagDetailCell.h"

@implementation FlagDetailCell

@synthesize bgImage,name,link;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景イメージ
        bgImage = [UIImageView new];
        bgImage.frame = CGRectMake(0, 0, 320, 212);
        [self addSubview:bgImage];
        
        //国名
        name = [UILabel new];
        name.frame = CGRectMake(10, 230, 300, 30);
        name.font = [UIFont systemFontOfSize:18];
        name.textColor = [UIColor whiteColor];
        [self addSubview:name];

        //Wikiリンク
        link = [UIButton buttonWithType:110];
        [link setTitle:@"Wiki Link" forState:UIControlStateNormal];
        link.frame = CGRectMake(10, 270, 120, 30);
        [self addSubview:link];
    }
    return self;
}

@end
