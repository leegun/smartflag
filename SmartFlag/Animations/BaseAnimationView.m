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
    CGRect selfFrame = owner.bounds;
    self = [super initWithFrame:selfFrame];
    if (self) {
        
        _owner = owner;
        
        flagImage = [UIImageView new];
        flagImage.frame = CGRectMake(0, 0, 320, 212);
        flagImage.image = image;
        [self addSubview:flagImage];
        
        [self startAnimation];

    }
    return self;
}
-(void) startAnimation
{
    _owner.alpha = 0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(returnAnimation)];
    
    flagImage.frame = CGRectMake(-(320 * 0.25), -(212 * 0.25), 320 * 1.5,  212 * 1.5);
    
    [UIView commitAnimations];
}

-(void)returnAnimation
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    
    flagImage.frame = CGRectMake(0, 0, 320, 212);
    
    [UIView commitAnimations];
}

-(void)endAnimation
{
    _owner.alpha = 1;
    [self removeFromSuperview];
}

//- (void)startAnimation
//{
//    _owner.alpha = 0;
//    [UIView animateWithDuration:1.0
//                          delay:0.0
//                        options:0
//                     animations:^{
////                         flagImage.transform = CGAffineTransformMakeRotation(M_PI);
//                         flagImage.transform = CGAffineTransformScale(flagImage.transform, 2, 2);
//                     }
//                     completion:^(BOOL finished){
//                         NSLog(@"Done!");
//                         _owner.alpha = 1;
//                         [self removeFromSuperview];
//                     }];}

@end
