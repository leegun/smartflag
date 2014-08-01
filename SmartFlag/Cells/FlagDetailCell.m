//
//  FlagDetailCell.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagDetailCell.h"
#import "BaseAnimationView.h"

@implementation FlagDetailCell

@synthesize bgImage,nameTitle,name,codeTitle,code,areaTitle,area,linkTitle,link;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景イメージ
        bgImage = [UIButton new];
        bgImage.frame = CGRectMake(0, 0, 320, 212);
        [bgImage addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgImage];
        
        //国名タイトル
        nameTitle = [UILabel new];
        nameTitle.frame = CGRectMake(10, 230, 300, 30);
        nameTitle.font = [UIFont boldSystemFontOfSize:18];
        nameTitle.textColor = [UIColor whiteColor];
        nameTitle.text = [Utils getLanguage:@"country_name"];
        [self addSubview:nameTitle];
        
        //国名
        name = [UILabel new];
        name.frame = CGRectMake(20, 260, 300, 30);
        name.font = [UIFont systemFontOfSize:18];
        name.textColor = [UIColor whiteColor];
        [self addSubview:name];
        
        //国コードタイトル
        codeTitle = [UILabel new];
        codeTitle.frame = CGRectMake(10, 290, 300, 30);
        codeTitle.font = [UIFont boldSystemFontOfSize:18];
        codeTitle.textColor = [UIColor whiteColor];
        codeTitle.text = [Utils getLanguage:@"country_code"];
        [self addSubview:codeTitle];
        
        //国コード
        code = [UILabel new];
        code.frame = CGRectMake(20, 320, 300, 30);
        code.font = [UIFont systemFontOfSize:18];
        code.textColor = [UIColor whiteColor];
        [self addSubview:code];
        
        //エリアタイトル
        areaTitle = [UILabel new];
        areaTitle.frame = CGRectMake(160, 290, 300, 30);
        areaTitle.font = [UIFont boldSystemFontOfSize:18];
        areaTitle.textColor = [UIColor whiteColor];
        areaTitle.text = [Utils getLanguage:@"country_area"];
        [self addSubview:areaTitle];
        
        //エリア
        area = [UILabel new];
        area.frame = CGRectMake(170, 320, 300, 30);
        area.font = [UIFont systemFontOfSize:18];
        area.textColor = [UIColor whiteColor];
        [self addSubview:area];
        
        //リンクタイトル
        linkTitle = [UILabel new];
        linkTitle.frame = CGRectMake(10, 350, 300, 30);
        linkTitle.font = [UIFont boldSystemFontOfSize:18];
        linkTitle.textColor = [UIColor whiteColor];
        linkTitle.text = [Utils getLanguage:@"country_detail"];
        [self addSubview:linkTitle];

        //Wikiリンク
        link = [UIButton buttonWithType:110];
        [link setTitle:[Utils getLanguage:@"wikipedia"] forState:UIControlStateNormal];
        link.frame = CGRectMake(20, 390, 120, 30);
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

//-(void) startAnimation
//{
//    BaseAnimationView * baseAnim = [[BaseAnimationView alloc] initWithImage:bgImage.currentBackgroundImage owner:self];
//    [self addSubview:baseAnim];
//}

@end
