//
//  ViewController.m
//  AnimationFollower
//
//  Created by Gary Lee on 2017/10/31.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.navigationItem.title = @"番剧";
    UIBarButtonItem *tableBtn = [[UIBarButtonItem alloc] initWithTitle:@"追番" style:UIBarButtonItemStylePlain target:self action:@selector(doClickTableBtn)];
    self.navigationItem.rightBarButtonItem = tableBtn;
//    [self clearAllUserDefaultsData];
}
//- (void)clearAllUserDefaultsData//清空NSUserDefaults
//{
//
//    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
//
//
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _nameArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    _timeArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"time"];
    _numberArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"number"];
    _countryArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"country"];
    _introductionArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"introduction"];
    
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_nameArray count];
}

//构造cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [_nameArray objectAtIndex:(int)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"上映时间：%@ 集数：%@",[_timeArray objectAtIndex:(int)indexPath.row],[_numberArray objectAtIndex:(int)indexPath.row]];
    return cell;
}

//滑动删除
//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return true;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}
//
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSMutableArray *preNameArr = [NSMutableArray arrayWithArray:_nameArray];
//    NSMutableArray *preTimeArr = [NSMutableArray arrayWithArray:_timeArray];
//    NSMutableArray *preNumberArr = [NSMutableArray arrayWithArray:_numberArray];
//    NSMutableArray *preCountryArr = [NSMutableArray arrayWithArray:_countryArray];
//    NSMutableArray *preIntroductionArr = [NSMutableArray arrayWithArray:_introductionArray];
//    [preNameArr removeObjectAtIndex:indexPath.row];
//    [preTimeArr removeObjectAtIndex:indexPath.row];
//    [preNumberArr removeObjectAtIndex:indexPath.row];
//    [preCountryArr removeObjectAtIndex:indexPath.row];
//    [preIntroductionArr removeObjectAtIndex:indexPath.row];
//    NSArray *newNameArr = [NSArray arrayWithArray:preNameArr];
//    NSArray *newTimeArr = [NSArray arrayWithArray:preTimeArr];
//    NSArray *newNumberArr = [NSArray arrayWithArray:preNumberArr];
//    NSArray *newCountryArr = [NSArray arrayWithArray:preCountryArr];
//    NSArray *newIntroductionArr = [NSArray arrayWithArray:preIntroductionArr];
//    [[NSUserDefaults standardUserDefaults] setObject:newNameArr forKey:@"name"];
//    [[NSUserDefaults standardUserDefaults] setObject:newTimeArr forKey:@"time"];
//    [[NSUserDefaults standardUserDefaults] setObject:newNumberArr forKey:@"number"];
//    [[NSUserDefaults standardUserDefaults] setObject:newCountryArr forKey:@"country"];
//    [[NSUserDefaults standardUserDefaults] setObject:newIntroductionArr forKey:@"introduction"];
//cell未删除
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doClickTableBtn {
    TableViewController *tableViewCtrl = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableViewCtrl animated:YES];
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewCtrl = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewCtrl animated:YES];
    detailViewCtrl.index = indexPath.row;
}
@end
