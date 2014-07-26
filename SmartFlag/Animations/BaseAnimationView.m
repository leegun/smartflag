//
//  BaseAnimationView.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/26.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "BaseAnimationView.h"

@implementation BaseAnimationView

- (id)initWithImage:(UIImage *)image owner:(UIView *)owner
{
    CGRect selfFrame = CGRectMake(0, 0, 640, 247);
    self = [super initWithFrame:selfFrame];
    if (self) {
        
        _owner = owner;
        
        flagImage = [UIImageView new];
        flagImage.frame = CGRectMake(0, 0, 640, 247);
        flagImage.image = image;
        [self addSubview:flagImage];

    }
    return self;
}

- (void)startAnimation
{
    _owner.alpha = 0;
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:0
                     animations:^{
                         flagImage.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         _owner.alpha = 1;
                     }];}

@end
