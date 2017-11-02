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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    [self.view addSubview:tableView];
    
    self.navigationItem.title = @"番剧";
    UIBarButtonItem *tableBtn = [[UIBarButtonItem alloc] initWithTitle:@"追番" style:UIBarButtonItemStylePlain target:self action:@selector(doClickTableBtn)];
    self.navigationItem.rightBarButtonItem = tableBtn;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个cell", (long)indexPath.row];
    cell.detailTextLabel.text = @"副标题";
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
