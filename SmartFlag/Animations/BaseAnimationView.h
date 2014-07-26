//
//  BaseAnimationView.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/26.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAnimationView : UIView
{
    UIView * _owner;
    UIImageView * flagImage;
}

- (id)initWithImage:(UIImage *)image owner:(UIView *)owner;

@end
