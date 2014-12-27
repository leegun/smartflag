//
//  AdCell.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/12.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "AdCell.h"

@implementation AdCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        //広告ビュー01
        NADView * nadView01 = [[NADView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        [nadView01 setIsOutputLog:NO];
        [nadView01 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
//        [nadView setDelegate:self];
        [nadView01 load];
        [self addSubview:nadView01];
        
        //広告ビュー02
        NADView * nadView02 = [[NADView alloc] initWithFrame:CGRectMake(0, 60, 320, 50)];
        [nadView02 setIsOutputLog:NO];
        [nadView02 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView02 load];
        [self addSubview:nadView02];
        
        //広告ビュー03
        NADView * nadView03 = [[NADView alloc] initWithFrame:CGRectMake(0, 120, 320, 50)];
        [nadView03 setIsOutputLog:NO];
        [nadView03 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView03 load];
        [self addSubview:nadView03];
        
        //広告ビュー04
        NADView * nadView04 = [[NADView alloc] initWithFrame:CGRectMake(0, 180, 320, 50)];
        [nadView04 setIsOutputLog:NO];
        [nadView04 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView04 load];
        [self addSubview:nadView04];
        
        //広告ビュー05
        NADView * nadView05 = [[NADView alloc] initWithFrame:CGRectMake(0, 240, 320, 50)];
        [nadView05 setIsOutputLog:NO];
        [nadView05 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView05 load];
        [self addSubview:nadView05];
        
        //広告ビュー06
        NADView * nadView06 = [[NADView alloc] initWithFrame:CGRectMake(0, 300, 320, 50)];
        [nadView06 setIsOutputLog:NO];
        [nadView06 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView06 load];
        [self addSubview:nadView06];
        
        //広告ビュー07
        NADView * nadView07 = [[NADView alloc] initWithFrame:CGRectMake(0, 360, 320, 50)];
        [nadView07 setIsOutputLog:NO];
        [nadView07 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView07 load];
        [self addSubview:nadView07];
        
        //広告ビュー08
        NADView * nadView08 = [[NADView alloc] initWithFrame:CGRectMake(0, 420, 320, 50)];
        [nadView08 setIsOutputLog:NO];
        [nadView08 setNendID:@"353a2edee9c7d9323b95f07ad55b25b9f32fa080" spotID:@"208676"];
        [nadView08 load];
        [self addSubview:nadView08];

    }
    return self;
}

- (void)startAlphaAnimation:(float)delay
{
    __weak AdCell * bSelf = self;
    bSelf.alpha = 0;
    [UIView animateWithDuration:0.5
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         bSelf.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                         }
                     }
     ];
}

@end
