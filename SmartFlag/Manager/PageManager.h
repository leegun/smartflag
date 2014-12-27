//
//  PageManager.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/15.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <Foundation/Foundation.h>

#define STATE_LIST      0
#define STATE_LIST_NEXT 1
#define STATE_FIT       2
#define STATE_DETAIL    3

@interface PageManager : NSObject
{
    int viewControllerState;
    BOOL spMenuFlag;
}

+(PageManager *) defaultManager;

@property (nonatomic,readwrite) int viewControllerState;
@property (nonatomic,readwrite) BOOL spMenuFlag;
@property (nonatomic,readwrite) BOOL animFlag;

@end
