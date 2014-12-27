//
//  FlagListCell.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "FlagListCell.h"

#define DURATION_TIME   0.2

#define DEFAULT_RECT    CGRectMake(0, 0, 80, 54)
#define SMALL_RECT      CGRectMake(20, 14, 40, 27)
#define BIG_RECT        CGRectMake(-20, -14, 120, 81)

@implementation FlagListCell

@synthesize bgImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //背景イメージ
        bgImage = [UIImageView new];
        bgImage.frame = DEFAULT_RECT;
        [self addSubview:bgImage];

    }
    return self;
}

- (void)startAlphaAnimation:(float)delay
{
    bgImage.alpha = 0;
    __weak FlagListCell * bSelf = self;
    [UIView animateWithDuration:0.5
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         bSelf.bgImage.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                         }
                     }
     ];
}

- (void)startAnimation:(float)delay
{
    NSLog(@"delay = %f",delay);
    __weak FlagListCell * bSelf = self;
    [UIView animateWithDuration:DURATION_TIME
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         bSelf.bgImage.frame = BIG_RECT;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [UIView animateWithDuration:DURATION_TIME
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  bSelf.bgImage.frame = SMALL_RECT;
                                              }
                                              completion:^(BOOL finished) {
                                                  if (finished) {
                                                      [UIView animateWithDuration:DURATION_TIME
                                                                            delay:0
                                                                          options:UIViewAnimationOptionCurveEaseInOut
                                                                       animations:^{
                                                                           bSelf.bgImage.frame = DEFAULT_RECT;
                                                                       }
                                                                       completion:^(BOOL finished) {
                                                                       }];
                                                  }
                                              }];
                         }
                     }];
}

@end
