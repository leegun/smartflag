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

@synthesize detailFlag,spMenuFlag;

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
        detailFlag = NO;
        spMenuFlag = NO;
    }
    return self;
}

@end
