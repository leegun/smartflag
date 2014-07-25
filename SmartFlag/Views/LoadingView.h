//
//  LoadingView.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/21.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
{
    int vcHeight,vcWidth;
    NSArray * flagDataArray;
    BOOL animFlag;
    
    UIImageView * imageView01;
    UIImageView * imageView02;
    UIImageView * imageView03;
    UIImageView * imageView04;
    UIImageView * imageView05;
}

@property (nonatomic) BOOL animFlag;

@end
