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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [_nameArray objectAtIndex:(int)indexPath.row];
//    NSString *time = [[NSString alloc] init];
//    time = [_timeArray objectAtIndex:(int)indexPath.row];
//    NSString *number = [_numberArray objectAtIndex:(int)indexPath.row];
//    NSString *subtitle = [NSString stringWithFormat:@"%@ %@",time,number];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"上映时间：%@ 集数：%@",[_timeArray objectAtIndex:(int)indexPath.row],[_numberArray objectAtIndex:(int)indexPath.row]];
//    NSLog(@"%@", time);
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doClickTableBtn {
    TableViewController *tableViewCtrl = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableViewCtrl animated:YES];
}

@end
