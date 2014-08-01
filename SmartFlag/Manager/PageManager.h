//
//  PageManager.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/15.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageManager : NSObject
{
    BOOL detailFlag;
    BOOL spMenuFlag;
}

+(PageManager *) defaultManager;

@property (nonatomic,readwrite) BOOL detailFlag;
@property (nonatomic,readwrite) BOOL spMenuFlag;

@end
