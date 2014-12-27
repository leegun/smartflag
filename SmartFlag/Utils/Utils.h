//
//  Utils.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(void)initUserDefalut;
+(void)setUserDefalut:(NSString *)key value:(id)value;
+(id)getUserDefalut:(NSString *)key;
+(BOOL)checkMark:(NSString *)key value:(NSString *)value;
+(NSMutableArray *)setAdvertising:(NSMutableArray *)dataArray;
+(NSMutableArray *)getAreaData;
+(NSMutableArray *)getSortData;
+(NSString *)getLanguage:(NSString *)key;

@end
