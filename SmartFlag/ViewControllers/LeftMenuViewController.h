//
//  LeftMenuViewController.h
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/20.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * leftTableView;
}
@end
