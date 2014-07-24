//
//  PageManager.h
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/15.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageManager : NSObject
{
    BOOL detailFlag;
}

+(PageManager *) defaultManager;

@property (nonatomic,readwrite) BOOL detailFlag;

@end
