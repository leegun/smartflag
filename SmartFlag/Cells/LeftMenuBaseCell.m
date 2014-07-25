//
//  LeftMenuBaseCell.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "LeftMenuBaseCell.h"

@implementation LeftMenuBaseCell

@synthesize name;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //国名
        name = [UILabel new];
        name.frame = CGRectMake(10, 0, 300, 40);
        name.font = [UIFont systemFontOfSize:18];
        name.textColor = [UIColor grayColor];
        [self addSubview:name];
    }
    return self;
}

@end
