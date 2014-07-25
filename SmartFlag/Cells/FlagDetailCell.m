//
//  FlagDetailCell.m
//  SmartFlag
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
        bgImage = [UIButton new];
        bgImage.frame = CGRectMake(0, 0, 320, 212);
        [bgImage addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
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

-(void) startAnimation
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    
    bgImage.frame = CGRectMake(-(320 * 0.25), -(212 * 0.25), 320 * 1.5,  212 * 1.5);
    
    [UIView commitAnimations];
}

-(void)endAnimation
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];

    bgImage.frame = CGRectMake(0, 0, 320, 212);
    
    [UIView commitAnimations];
}

@end
