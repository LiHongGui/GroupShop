//
//  ViewController.m
//  GroupShow
//
//  Created by MichaelLi on 2016/10/31.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"
#import "GroupShowModel.h"
#import "GroupShowCellTableViewCell.h"
#import "BannerView.h"
#import "FooterView.h"
@interface ViewController ()<UITableViewDataSource,FooterViewDelegate>
@property(nonatomic,strong) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    //设置cell高度
    self.tableView.rowHeight = 80;

    //设置headView
    BannerView *bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, 0, 375, 200)];
    self.tableView.tableHeaderView = bannerView;
    //传递image数据
    NSArray *array = @[@"ad_00",@"ad_01",@"ad_02",@"ad_03",@"ad_04"];
    bannerView.imageArray = array;

//    //设置footerView---也可以通过xib来设置
//    FooterView *footerView = [[FooterView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
////    footerView.backgroundColor = [UIColor grayColor];
//    self.tableView.tableFooterView = footerView;
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 5, 335, 30)];
//    button.backgroundColor = [UIColor orangeColor];
//    [footerView addSubview:button];
//    //设置文本
//    [button setTitle:@"点击加载更多···" forState:UIControlStateNormal];
//    button.titleLabel.textColor = [UIColor whiteColor];
//    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    FooterView *footerView = [[FooterView alloc]init];
    footerView = [[[NSBundle mainBundle]loadNibNamed:@"FooterView" owner:nil options:nil]lastObject];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
}
#pragma mark
#pragma mark -  懒加载
-(NSMutableArray *)dataArray
{
    if (nil == _dataArray) {
        //实例化
        _dataArray = [NSMutableArray array];
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];

        for (NSDictionary *dict in temp) {
            GroupShowModel *model = [GroupShowModel groupShowWithDict:dict];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

-(void)footerView:(FooterView *)footerView
{
    NSLog(@"我知道了");
    [footerView downLoadShow:YES];
    //知道后,延时
    [self performSelector:@selector(things:) withObject:footerView afterDelay:2];


}
-(void)things:(FooterView *)footerView
{
    NSLog(@"延时了");
    /*
     1.正在加载的视隐藏
     2.载入新的数据源
     3.刷新
     */
    [footerView downLoadShow:NO];
    GroupShowModel *model = [[GroupShowModel alloc]init];
    model.title  = @"一枝花";
    NSString *imageNamed = @"d40878ee9d97a53bd4b8778daa11d38d";
    model.icon = [NSString stringWithFormat:@"%@", imageNamed];
    model.price = @"88";
    model.buyCount = @"11";
    //前面的dataArray需要改成可变数组---还要实例化NSMutableArray
    [self.dataArray addObject:model];
    [self.tableView reloadData];

    //显示到最后一行
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}

#pragma mark
#pragma mark -  组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark
#pragma mark -  行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
#pragma mark
#pragma mark -  cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *identifier = @"lihonggui";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (nil == cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//    }
//
//    GroupShowModel *model = self.dataArray[indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:model.icon];
//    cell.textLabel.text = model.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@",model.price];

    /*
     重新定义一个重用标识符
     */
    static NSString *identifier = @"groups";
    GroupShowCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        //如果找不到,就在xib中找
        cell  = [[[NSBundle mainBundle]loadNibNamed:@"GroupShowCellTableViewCell" owner:nil options:nil]lastObject];
    }

    GroupShowModel *model = self.dataArray[indexPath.row];
    cell.groupShowModel = model;
    return cell;
}
@end
