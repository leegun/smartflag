//
//  LoadingView.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/21.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

@synthesize animFlag;

- (id)init
{
    self = [super init];
    if (self) {
        
        vcHeight = [UIScreen mainScreen].bounds.size.height;
        vcWidth = [UIScreen mainScreen].bounds.size.width;
        
        animFlag = NO;
        self.alpha = 0;
        
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.7;
        [self addSubview:bgView];
        
        //フラグデータ取得
        flagDataArray = [Utils getAreaData];

        imageView01 = [UIImageView new];
        int randIndex = arc4random() % flagDataArray.count;
        NSDictionary * flagData = [flagDataArray objectAtIndex:randIndex];
        NSString * imageName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
        imageView01.image = [UIImage imageNamed:imageName];
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

-(void)startRandAnimation01
{
    if (animFlag) {
        
        int randHeight = arc4random() % (vcHeight - 60);
        NSLog(@"randHeight01 = %d",randHeight);
        imageView01.frame = CGRectMake(-80, randHeight, 80, 53);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:3];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(endAnimation01)];
        imageView01.frame = CGRectMake(vcWidth, randHeight, 80, 53);
        [UIView commitAnimations];
    }
}

-(void)endAnimation01
{
    if (animFlag) {
        [self startRandAnimation01];
    }
}

-(void)startRandAnimation02
{
    if (animFlag) {
        int randIndex = arc4random() % flagDataArray.count;
        NSDictionary * flagData = [flagDataArray objectAtIndex:randIndex];
        NSString * imageName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
        imageView02.image = [UIImage imageNamed:imageName];
        
        int randHeight = arc4random() % (vcHeight - 60);
        NSLog(@"randHeight02 = %d",randHeight);
        imageView02.frame = CGRectMake(-80, randHeight, 80, 53);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:2.8];
        [UIView setAnimationDelay:0.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(endAnimation02)];
        imageView02.frame = CGRectMake(vcWidth, randHeight, 80, 53);
        [UIView commitAnimations];
    }
}

-(void)endAnimation02
{
    if (animFlag) {
        [self startRandAnimation02];
    }
}

-(void)startRandAnimation03
{
    if (animFlag) {
        int randIndex = arc4random() % flagDataArray.count;
        NSDictionary * flagData = [flagDataArray objectAtIndex:randIndex];
        NSString * imageName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
        imageView03.image = [UIImage imageNamed:imageName];
        
        int randHeight = arc4random() % (vcHeight - 60);
        NSLog(@"randHeight03 = %d",randHeight);
        imageView03.frame = CGRectMake(-80, randHeight, 80, 53);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:2.3];
        [UIView setAnimationDelay:0.7];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(endAnimation03)];
        imageView03.frame = CGRectMake(vcWidth, randHeight, 80, 53);
        [UIView commitAnimations];
    }
}

-(void)endAnimation03
{
    if (animFlag) {
        [self startRandAnimation03];
    }
}

-(void)startRandAnimation04
{
    if (animFlag) {
        int randIndex = arc4random() % flagDataArray.count;
        NSDictionary * flagData = [flagDataArray objectAtIndex:randIndex];
        NSString * imageName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
        imageView04.image = [UIImage imageNamed:imageName];
        
        int randHeight = arc4random() % (vcHeight - 60);
        NSLog(@"randHeight04 = %d",randHeight);
        imageView04.frame = CGRectMake(-80, randHeight, 80, 53);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:2.5];
        [UIView setAnimationDelay:0.9];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(endAnimation04)];
        imageView04.frame = CGRectMake(vcWidth, randHeight, 80, 53);
        [UIView commitAnimations];
    }
}

-(void)endAnimation04
{
    if (animFlag) {
        [self startRandAnimation04];
    }
}

-(void)startRandAnimation05
{
    if (animFlag) {
        int randIndex = arc4random() % flagDataArray.count;
        NSDictionary * flagData = [flagDataArray objectAtIndex:randIndex];
        NSString * imageName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
        imageView05.image = [UIImage imageNamed:imageName];
        
        int randHeight = arc4random() % (vcHeight - 60);
        NSLog(@"randHeight05 = %d",randHeight);
        imageView05.frame = CGRectMake(-80, randHeight, 80, 53);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:2.8];
        [UIView setAnimationDelay:0.1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(endAnimation05)];
        imageView05.frame = CGRectMake(vcWidth, randHeight, 80, 53);
        [UIView commitAnimations];
    }
}

-(void)endAnimation05
{
    if (animFlag) {
        [self startRandAnimation05];
    }
}

-(void)invisibleAnim
{
    self.alpha = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelegate:self];
    self.alpha = 0;
    [UIView commitAnimations];
}

- (void) setupNotifications
{
    __weak LoadingView * weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_SHOW_LOADING_VIEW
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      if (!weakSelf.animFlag) {
                                                          weakSelf.animFlag = YES;
                                                          weakSelf.alpha = 1;
                                                          [weakSelf startRandAnimation01];
                                                          [weakSelf startRandAnimation02];
                                                          [weakSelf startRandAnimation03];
                                                          [weakSelf startRandAnimation04];
                                                          [weakSelf startRandAnimation05];
                                                      }
                                                      
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_HIDE_LOADING_VIEW
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      if (weakSelf.animFlag) {
                                                          weakSelf.animFlag = NO;
                                                          [weakSelf invisibleAnim];
                                                      }
                                                      
                                                  }];
    
}

@end
