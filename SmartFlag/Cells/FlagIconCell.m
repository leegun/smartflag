//
//  FlagIconCell.m
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagIconCell.h"

@implementation FlagIconCell

@synthesize bgImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景イメージ
        bgImage = [UIImageView new];
        bgImage.frame = CGRectMake(0, 0, 80, 53);
        [self addSubview:bgImage];
    }
    return self;
}

@end
