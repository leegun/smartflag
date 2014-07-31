//
//  ScaleFlagsView.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/08/01.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "ScaleFlagsView.h"

@implementation ScaleFlagsView

- (id)initWithFlagIndex:(int)flagIndex
{
    self = [super init];
    if (self) {
        
        vcHeight = [UIScreen mainScreen].bounds.size.height;
        vcWidth = [UIScreen mainScreen].bounds.size.width;
        
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.7;
        [self addSubview:bgView];
        
        imageView01 = [UIImageView new];
        [self addSubview:imageView01];
        
        imageView02 = [UIImageView new];
        [self addSubview:imageView02];
        
        imageView03 = [UIImageView new];
        [self addSubview:imageView03];
        
        imageView04 = [UIImageView new];
        [self addSubview:imageView04];
        
        imageView05 = [UIImageView new];
        [self addSubview:imageView05];
        
        [self setImage:flagIndex];
        
        [self startRandAnimation01];
        [self startRandAnimation02];
        [self startRandAnimation03];
        [self startRandAnimation04];
        [self startRandAnimation05];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        vcHeight = [UIScreen mainScreen].bounds.size.height;
        vcWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.alpha = 0;
        
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.7;
        [self addSubview:bgView];

        imageView01 = [UIImageView new];
        [self addSubview:imageView01];
        
        imageView02 = [UIImageView new];
        [self addSubview:imageView02];
        
        imageView03 = [UIImageView new];
        [self addSubview:imageView03];
        
        imageView04 = [UIImageView new];
        [self addSubview:imageView04];
        
        imageView05 = [UIImageView new];
        [self addSubview:imageView05];
        
        [self setupNotifications];
    }
    return self;
}

-(void)setImage:(int)flagIndex
{
    
    //フラグデータ取得
    flagDataArray = [Utils getAreaData];
    
    NSDictionary * flagData = [flagDataArray objectAtIndex:flagIndex];
    NSString * imageName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
    UIImage * image = [UIImage imageNamed:imageName];
    imageView01.image = image;
    imageView02.image = image;
    imageView03.image = image;
    imageView04.image = image;
    imageView05.image = image;
}

-(void)startRandAnimation01
{
    int randWidth = arc4random() % (vcWidth - FLAG_HEIGHT_T);
    int randHeight = arc4random() % (vcHeight - FLAG_WIDTH_T);
    //        NSLog(@"randWidth01 = %d",randWidth);
    //        NSLog(@"randHeight01 = %d",randHeight);
    imageView01.frame = CGRectMake(randWidth, randHeight, FLAG_WIDTH_T, FLAG_HEIGHT_T);
    imageView01.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    //        [UIView setAnimationDidStopSelector:@selector(endAnimation01)];
    CGAffineTransform scale = CGAffineTransformMakeScale(8.0, 8.0);
    [imageView01 setTransform:scale];
    imageView01.alpha = 0;
    [UIView commitAnimations];
}

-(void)startRandAnimation02
{
    int randWidth = arc4random() % (vcWidth - FLAG_HEIGHT_T);
    int randHeight = arc4random() % (vcHeight - FLAG_WIDTH_T);
    imageView02.frame = CGRectMake(randWidth, randHeight, FLAG_WIDTH_T, FLAG_HEIGHT_T);
    imageView02.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.01];
    [UIView setAnimationDelegate:self];
    CGAffineTransform scale = CGAffineTransformMakeScale(8.0, 8.0);
    [imageView02 setTransform:scale];
    imageView02.alpha = 0;
    [UIView commitAnimations];
}

-(void)startRandAnimation03
{
    int randWidth = arc4random() % (vcWidth - FLAG_HEIGHT_T);
    int randHeight = arc4random() % (vcHeight - FLAG_WIDTH_T);
    imageView03.frame = CGRectMake(randWidth, randHeight, FLAG_WIDTH_T, FLAG_HEIGHT_T);
    imageView03.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.03];
    [UIView setAnimationDelegate:self];
    CGAffineTransform scale = CGAffineTransformMakeScale(8.0, 8.0);
    [imageView03 setTransform:scale];
    imageView03.alpha = 0;
    [UIView commitAnimations];
}

-(void)startRandAnimation04
{
    int randWidth = arc4random() % (vcWidth - FLAG_HEIGHT_T);
    int randHeight = arc4random() % (vcHeight - FLAG_WIDTH_T);
    imageView04.frame = CGRectMake(randWidth, randHeight, FLAG_WIDTH_T, FLAG_HEIGHT_T);
    imageView04.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.05];
    [UIView setAnimationDelegate:self];
    CGAffineTransform scale = CGAffineTransformMakeScale(8.0, 8.0);
    [imageView04 setTransform:scale];
    imageView04.alpha = 0;
    [UIView commitAnimations];
}

-(void)startRandAnimation05
{
    int randWidth = arc4random() % (vcWidth - FLAG_HEIGHT_T);
    int randHeight = arc4random() % (vcHeight - FLAG_WIDTH_T);
    imageView05.frame = CGRectMake(randWidth, randHeight, FLAG_WIDTH_T, FLAG_HEIGHT_T);
    imageView05.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.08];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(invisibleAnim)];
    CGAffineTransform scale = CGAffineTransformMakeScale(8.0, 8.0);
    [imageView05 setTransform:scale];
    imageView05.alpha = 0;
    [UIView commitAnimations];
}

-(void)invisibleAnim
{
    self.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(closeView)];
    self.alpha = 0;
    [UIView commitAnimations];
}

- (void)closeView
{
    [self removeFromSuperview];
}

- (void) setupNotifications
{
    __weak ScaleFlagsView * weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_SHOW_SCALE_FLAG_VIEW
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      [weakSelf setImage:[[notification object] intValue]];
                                                      
                                                      weakSelf.alpha = 1;
                                                      [weakSelf startRandAnimation01];
                                                      [weakSelf startRandAnimation02];
                                                      [weakSelf startRandAnimation03];
                                                      [weakSelf startRandAnimation04];
                                                      [weakSelf startRandAnimation05];
                                                      
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_HIDE_SCALE_FLAG_VIEW
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                  }];
    
}

@end
