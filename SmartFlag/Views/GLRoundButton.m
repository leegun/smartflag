//
//  GLRoundButton.m
//  GoukakuNote
//
//  Created by Lee Geunil on 12/12/08.
//  Copyright (c) 2012年 Lee Geunil. All rights reserved.
//

#import "GLRoundButton.h"

@implementation GLRoundButton


- (id)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        self.frame = CGRectMake(0, 0, 44, 44);
        self.alpha = 0.5;
        [[self layer] setCornerRadius:22.0];
        [self setClipsToBounds:YES];
        
    }
    return self;
}

@end
