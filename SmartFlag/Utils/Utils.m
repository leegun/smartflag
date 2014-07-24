//
//  Utils.m
//  StudyFlagApp
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(void)initUserDefalut
{
    if ([self getUserDefalut:USER_DEFAULT_LOCALE] == nil) {
        [self setUserDefalut:USER_DEFAULT_LOCALE value:ENGLISH];
    }

    if ([self getUserDefalut:USER_DEFAULT_AREA] == nil) {
        [self setUserDefalut:USER_DEFAULT_AREA value:AREA_WORLD];
    }
}

+(void)setUserDefalut:(NSString *)key value:(id)value
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(id)getUserDefalut:(NSString *)key
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+(BOOL)checkMark:(NSString *)key value:(NSString *)value
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:key] isEqualToString:value]) {
        return YES;
    } else {
        return NO;
    }
}

+(NSArray *)getAreaData
{
    NSString * dataPath = [[NSBundle mainBundle] pathForResource:@"flag_data_all" ofType:@"plist"];
    NSArray * dataArray = [NSArray arrayWithContentsOfFile:dataPath];
    NSMutableArray * areaArray = [NSMutableArray new];

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * areaStr = [defaults objectForKey:USER_DEFAULT_AREA];
    if ([areaStr isEqualToString:AREA_WORLD]) {
        return dataArray;
    } else {
        for (NSDictionary * data in dataArray) {
            
            if ([[data objectForKey:@"area"] isEqualToString:areaStr]) {
                [areaArray addObject:data];
            }
        }
        return areaArray;
    }
    
}

@end
