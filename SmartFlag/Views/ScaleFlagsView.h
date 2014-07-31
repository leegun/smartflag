//
//  ScaleFlagsView.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/08/01.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaleFlagsView : UIView
{
    int vcHeight,vcWidth;
    NSArray * flagDataArray;
    
    UIImageView * imageView01;
    UIImageView * imageView02;
    UIImageView * imageView03;
    UIImageView * imageView04;
    UIImageView * imageView05;
}

@property (nonatomic) BOOL animFlag;

- (id)initWithFlagIndex:(int)flagIndex;

@end
