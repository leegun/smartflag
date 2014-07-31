//
//  LeftMenuViewController.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LeftMenuBaseCell.h"

#define CELL_LEFT_MENU_BASE @"LeftMenuBaseCell"

#define TAG_SECTION_LOCAL   0
#define TAG_SECTION_AREA    1
#define TAG_SECTION_SUPPORT 2
#define TAG_SECTION_ATHER   3
#define SECTION_LENGHT      4

#define TAG_ROW_LOCAL_01    0
#define TAG_ROW_LOCAL_02    1
#define ROW_LOCAL_LENGHT    2

#define TAG_ROW_AREA_00     0
#define TAG_ROW_AREA_01     1
#define TAG_ROW_AREA_02     2
#define TAG_ROW_AREA_03     3
#define TAG_ROW_AREA_04     4
#define TAG_ROW_AREA_05     5
#define ROW_AREA_LENGHT     6

#define TAG_ROW_SUPPORT_01  0
#define ROW_SUPPORT_LENGHT  1

#define TAG_ROW_ATHER_01    0
#define ROW_ATHER_LENGHT    1

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //画面サイズ
    CGRect vcFrame = [[UIScreen mainScreen] bounds];
    

    self.view.frame = CGRectMake(-267, 0, 267, vcFrame.size.height);

    leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 267, vcFrame.size.height)];
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    leftTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [leftTableView setContentInset:UIEdgeInsetsMake(0, 0, 60, 0)];
    [self.view addSubview:leftTableView];
    
    [leftTableView registerClass:[LeftMenuBaseCell class] forCellReuseIdentifier:CELL_LEFT_MENU_BASE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SECTION_LENGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section) {
        case TAG_SECTION_LOCAL:
            return ROW_LOCAL_LENGHT;
            break;
        case TAG_SECTION_AREA:
            return ROW_AREA_LENGHT;
            break;
        case TAG_SECTION_SUPPORT:
            return ROW_SUPPORT_LENGHT;
            break;
        case TAG_SECTION_ATHER:
            return ROW_ATHER_LENGHT;
            break;
        default:
            return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftMenuBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_LEFT_MENU_BASE forIndexPath:indexPath];
    switch (indexPath.section) {
        case TAG_SECTION_LOCAL:
        {
            switch (indexPath.row) {
                case TAG_ROW_LOCAL_01:
                {
                    cell.name.text = [Utils getLanguage:@"language_english"];
                    if ([Utils checkMark:USER_DEFAULT_LANGUAGE value:ENGLISH]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                case TAG_ROW_LOCAL_02:
                {
                    cell.name.text = [Utils getLanguage:@"language_japanese"];
                    if ([Utils checkMark:USER_DEFAULT_LANGUAGE value:JAPANESE]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case TAG_SECTION_AREA:
        {
            switch (indexPath.row) {
                case TAG_ROW_AREA_00:
                {
                    cell.name.text = [Utils getLanguage:@"area_world"];
                    if ([Utils checkMark:USER_DEFAULT_AREA value:AREA_WORLD]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                case TAG_ROW_AREA_01:
                {
                    cell.name.text = [Utils getLanguage:@"area_africa"];
                    if ([Utils checkMark:USER_DEFAULT_AREA value:AREA_AFRICA]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                case TAG_ROW_AREA_02:
                {
                    cell.name.text = [Utils getLanguage:@"area_america"];
                    if ([Utils checkMark:USER_DEFAULT_AREA value:AREA_AMERICA]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                case TAG_ROW_AREA_03:
                {
                    cell.name.text = [Utils getLanguage:@"area_asia"];
                    if ([Utils checkMark:USER_DEFAULT_AREA value:AREA_ASIA]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                case TAG_ROW_AREA_04:
                {
                    cell.name.text = [Utils getLanguage:@"area_europe"];
                    if ([Utils checkMark:USER_DEFAULT_AREA value:AREA_EUROPE]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                case TAG_ROW_AREA_05:
                {
                    cell.name.text = [Utils getLanguage:@"area_oceania"];
                    if ([Utils checkMark:USER_DEFAULT_AREA value:AREA_OCEANIA]) {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    } else {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case TAG_SECTION_SUPPORT:
        {
            switch (indexPath.row) {
                case TAG_ROW_SUPPORT_01:
                {
                    cell.name.text = [Utils getLanguage:@"section_support"];
                }
                    break;

                default:
                    break;
            }
        }
            break;
        case TAG_SECTION_ATHER:
        {
            switch (indexPath.row) {
                case TAG_ROW_ATHER_01:
                {
                    cell.name.text = [Utils getLanguage:@"review"];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section) {
        case TAG_SECTION_LOCAL:
            return [Utils getLanguage:@"section_language"];
            break;
        case TAG_SECTION_AREA:
            return [Utils getLanguage:@"section_area"];
            break;
        case TAG_SECTION_SUPPORT:
            return [Utils getLanguage:@"section_support"];
            break;
        case TAG_SECTION_ATHER:
            return [Utils getLanguage:@"section_other"];
            break;
        default:
            return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case TAG_SECTION_LOCAL:
        {
            switch (indexPath.row) {
                case TAG_ROW_LOCAL_01:
                {
                    [Utils setUserDefalut:USER_DEFAULT_LANGUAGE value:ENGLISH];
                    [leftTableView reloadData];
                }
                    break;
                case TAG_ROW_LOCAL_02:
                {
                    [Utils setUserDefalut:USER_DEFAULT_LANGUAGE value:JAPANESE];
                    [leftTableView reloadData];
                }
                    break;
                    
                default:
                    break;
            }
            
            [self closeLeftMenu];
        }
            break;
        case TAG_SECTION_AREA:
        {
            switch (indexPath.row) {
                case TAG_ROW_AREA_00:
                {
                    [Utils setUserDefalut:USER_DEFAULT_AREA value:AREA_WORLD];
                    [leftTableView reloadData];
                }
                    break;
                case TAG_ROW_AREA_01:
                {
                    [Utils setUserDefalut:USER_DEFAULT_AREA value:AREA_AFRICA];
                    [leftTableView reloadData];
                }
                    break;
                case TAG_ROW_AREA_02:
                {
                    [Utils setUserDefalut:USER_DEFAULT_AREA value:AREA_AMERICA];
                    [leftTableView reloadData];
                }
                    break;
                case TAG_ROW_AREA_03:
                {
                    [Utils setUserDefalut:USER_DEFAULT_AREA value:AREA_ASIA];
                    [leftTableView reloadData];
                }
                    break;
                case TAG_ROW_AREA_04:
                {
                    [Utils setUserDefalut:USER_DEFAULT_AREA value:AREA_EUROPE];
                    [leftTableView reloadData];
                }
                    break;
                case TAG_ROW_AREA_05:
                {
                    [Utils setUserDefalut:USER_DEFAULT_AREA value:AREA_OCEANIA];
                    [leftTableView reloadData];
                }
                    break;
                    
                default:
                    break;
            }
            
            [self closeLeftMenu];
        }
            break;
        case TAG_SECTION_SUPPORT:
        {
            switch (indexPath.row) {
                case TAG_ROW_SUPPORT_01:
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_HIDE_LEFTMENU object:nil];
                    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_WEB_VIEW object:SUPPORT_URL];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case TAG_SECTION_ATHER:
        {
            switch (indexPath.row) {
                case TAG_ROW_ATHER_01:
                {
                    NSURL *url = [NSURL URLWithString:APPSTORE_URL];
                    [[UIApplication sharedApplication] openURL:url];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}

-(void)closeLeftMenu
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_FLAG_VIEW_REFLESH object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_HIDE_LEFTMENU object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_VISIBLE_OPTION_BUTTON object:nil];
}
@end
