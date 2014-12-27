//
//  PageManager.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/15.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "PageManager.h"

PageManager *_PageManager;

@implementation PageManager

@synthesize viewControllerState,spMenuFlag;

+(PageManager *)defaultManager {
    
	@synchronized([PageManager class]) {
        
		if (!_PageManager)
			_PageManager = [[self alloc] init];
		return _PageManager;
	}
	
	return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //初期化
        viewControllerState = STATE_LIST;
        spMenuFlag = NO;
        _animFlag = NO;
    }
    return self;
}

@end
