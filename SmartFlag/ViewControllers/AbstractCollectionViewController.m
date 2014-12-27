//
//  AbstractCollectionViewController.m
//  SmartFlag
//
//  Created by Lee Geunil on 2014/07/13.
//  Copyright (c) 2014年 Lee Geunil. All rights reserved.
//

#import "AbstractCollectionViewController.h"

@interface AbstractCollectionViewController ()

@property (nonatomic) int animCount;

@end

@implementation AbstractCollectionViewController

@synthesize flagDataArray,adFlagDataArray;

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
        //画面サイズ
        vcFrame = [[UIScreen mainScreen] bounds];
        
        [self.collectionView registerClass:[FlagListCell class] forCellWithReuseIdentifier:CELL_FLAG_LIST];
        [self.collectionView registerClass:[FlagListNextCell class] forCellWithReuseIdentifier:CELL_FLAG_LIST_NEXT];
        [self.collectionView registerClass:[FlagFitCell class] forCellWithReuseIdentifier:CELL_FLAG_FIT];
        [self.collectionView registerClass:[FlagDetailCell class] forCellWithReuseIdentifier:CELL_FLAG_DETAIL];
        [self.collectionView registerClass:[AdCell class] forCellWithReuseIdentifier:CELL_AD];
        
        _animCount = 0;
        
        [self setupNotifications];
    }
    return self;
}

- (void)viewDidLoad{
    
    //フラグデータ取得
    flagDataArray = [Utils getAreaData];

    //広告セル追加
    adFlagDataArray = [[Utils setAdvertising:[flagDataArray mutableCopy]] mutableCopy];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self allCellReload];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return adFlagDataArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * flagData = [adFlagDataArray objectAtIndex:indexPath.row];
    
    //advertising
    if ([[flagData objectForKey:@"advertising"] boolValue]) {
        
        AdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_AD forIndexPath:indexPath];
        if (![[PageManager defaultManager] animFlag]) {
            [cell startAlphaAnimation:((float)_animCount * 0.05f)];
            _animCount++;
        }
        return cell;
    }
    
    NSString * imageName = [NSString stringWithFormat:IMAGE_NAME,[flagData objectForKey:@"code"]];
    NSString * thumbName = [NSString stringWithFormat:IMAGE_THUMBNAIL,[flagData objectForKey:@"code"]];
    if ([PageManager defaultManager].viewControllerState == STATE_LIST) {
        
        FlagListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_FLAG_LIST forIndexPath:indexPath];
        
        //image
        cell.bgImage.image = [UIImage imageNamed:thumbName];
        if (![[PageManager defaultManager] animFlag]) {
            [cell startAlphaAnimation:((float)_animCount * 0.05f)];
            _animCount++;
        }
        
        return cell;

    } else if ([PageManager defaultManager].viewControllerState == STATE_LIST_NEXT) {
        
        FlagListNextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_FLAG_LIST_NEXT forIndexPath:indexPath];
        
        //image
        cell.bgImage.image = [UIImage imageNamed:thumbName];
        
        //name
        NSString * language = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULT_LANGUAGE];
        cell.name.text = [flagData objectForKey:language];
        
        return cell;

    } else if ([PageManager defaultManager].viewControllerState == STATE_FIT) {
        
        FlagFitCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_FLAG_FIT forIndexPath:indexPath];
        
        //image
        UIImage * image = [UIImage imageNamed:imageName];
        if (image == nil) {
            cell.bgImage.image = [UIImage imageNamed:thumbName];
        } else {
            cell.bgImage.image = [UIImage imageNamed:imageName];
        }
        
        return cell;
    } else if ([PageManager defaultManager].viewControllerState == STATE_DETAIL) {
        
        FlagDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_FLAG_DETAIL forIndexPath:indexPath];
        
        //image
        UIImage * image = [UIImage imageNamed:imageName];
        if (image == nil) {
            [cell.bgImage setBackgroundImage:[UIImage imageNamed:thumbName] forState:UIControlStateNormal];
        } else {
            [cell.bgImage setBackgroundImage:image forState:UIControlStateNormal];
        }
        
        //name
        NSString * language = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULT_LANGUAGE];
        cell.name.text = [flagData objectForKey:language];
        
        //code
        cell.code.text = [flagData objectForKey:@"code"];
        
        //area
        NSString * areaStr = @"area";
        if (![language isEqualToString:@"en"]) {areaStr = [NSString stringWithFormat:@"area_%@",language];}
        cell.area.text = [flagData objectForKey:areaStr];
        
        //link
        [cell.link addTarget:self action:@selector(onLink:) forControlEvents:UIControlEventTouchUpInside];
        cell.link.tag = indexPath.row;
        
        return cell;
    } else {
        
        FlagListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_FLAG_LIST forIndexPath:indexPath];
        
        //image
        cell.bgImage.image = [UIImage imageNamed:thumbName];
        
        return cell;
    }
}

- (void)onLink:(UIButton *)button
{
    NSDictionary * data = [flagDataArray objectAtIndex:button.tag];
    NSString * locale = [Utils getUserDefalut:USER_DEFAULT_LANGUAGE];
    NSString * wikiUrl = [NSString stringWithFormat:WIKI_URL,locale,[data objectForKey:locale]];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SHOW_WEB_VIEW object:wikiUrl];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_ALPHA_OPTION_BUTTON object:nil];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_VISIBLE_OPTION_BUTTON object:nil];
    
    _animCount = 0;
}

-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)p
{
    return nil;
}

-(void)allCellReload
{
    NSMutableArray * indexPaths = [NSMutableArray new];
    for (UICollectionViewCell * cell in [self.collectionView visibleCells]) {
        [indexPaths addObject:[self.collectionView indexPathForCell:cell]];
    }
    [self.collectionView reloadItemsAtIndexPaths:indexPaths];
}

- (void) setupNotifications
{
    __weak AbstractCollectionViewController * weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_FLAG_VIEW_REFLESH
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      //フラグデータ取得
                                                      weakSelf.flagDataArray = [Utils getAreaData];
                                                      //広告セル追加
                                                      weakSelf.adFlagDataArray = [[Utils setAdvertising:[flagDataArray mutableCopy]] mutableCopy];
                                                      
                                                      [weakSelf.collectionView reloadData];
                                                      
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFY_FLAG_VIEW_SORT
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      
                                                      //フラグデータ取得
                                                      weakSelf.flagDataArray = [Utils getSortData];
                                                      //広告セル追加
                                                      weakSelf.adFlagDataArray = [[Utils setAdvertising:[flagDataArray mutableCopy]] mutableCopy];
                                                      
                                                      [weakSelf.collectionView reloadData];
                                                      
                                                  }];
    
}

@end
