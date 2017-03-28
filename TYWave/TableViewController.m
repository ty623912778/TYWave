//
//  TableViewController.m
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TableViewController.h"
#import "WaveCell.h"
@interface TableViewController ()
@property(nonatomic,strong)WaveCell *waveCell;
@property(nonatomic,strong)WaveCell *waveCell2;
@property(nonatomic,strong)WaveCell *waveCell3;
@property(nonatomic,strong)WaveCell *waveCell4;
@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   self.title=@"WaveCellShow";//设置标题
    NSLog(@"%d",self.precent);//输出百分号
    // self.clearsSelectionOnViewWillAppear = NO;
    
   
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // ------在需要加入动画的地方
    [self.waveCell addAnimateWithType:0];
    [self.waveCell2 addAnimateWithType:0];
    [self.waveCell3 addAnimateWithType:2];
    [self.waveCell4 addAnimateWithType:1];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        // ------在需要的地方加入动画Cell需要如下几行代码。
        WaveCell *cell = [WaveCell cell];
        self.waveCell = cell;
        [cell setPrecent:self.precent textColor:[UIColor orangeColor] type:0 alpha:1];
        cell.endless = YES;
        return cell;
        
    }else if (indexPath.row == 1){
        
        WaveCell *cell = [WaveCell cell];
        self.waveCell2 = cell;
        [cell setPrecent:self.precent textColor:[UIColor colorWithRed:28/255.0 green:125/255.0 blue:115/255.0 alpha:1] type:0 alpha:0.6];
        return cell;
        
    }else if (indexPath.row == 2){
        
        WaveCell *cell = [WaveCell cell];
        self.waveCell3 = cell;
        [cell setPrecent:self.precent textColor:[UIColor whiteColor] type:2 alpha:0.3];
        cell.endless = YES;
        return cell;
    }else if (indexPath.row == 3){
        WaveCell *cell = [WaveCell cell];
        self.waveCell4 = cell;
        [cell setPrecent:self.precent textColor:[UIColor whiteColor] type:1 alpha:0.3];
        return cell;
    }
    else {
        return nil;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 145;
}

- (void)dealloc
{
    NSLog(@"TableViewController - delloc");
}

@end
