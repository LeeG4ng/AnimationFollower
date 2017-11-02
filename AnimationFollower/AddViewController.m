//
//  AddViewController.m
//  AnimationFollower
//
//  Created by Gary Lee on 2017/11/2.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSave)];
    self.navigationItem.title = @"新增番剧";
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self.view addSubview:name];
    name.enabled = YES;
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.placeholder = @"番剧名";
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UITextField *time = [[UITextField alloc] initWithFrame:CGRectMake(0, 170, self.view.bounds.size.width, 50)];
    [self.view addSubview:time];
    time.enabled = YES;
    time.borderStyle = UITextBorderStyleRoundedRect;
    time.placeholder = @"上映时间";
    time.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UITextField *number = [[UITextField alloc] initWithFrame:CGRectMake(0, 240, self.view.bounds.size.width, 50)];
    [self.view addSubview:number];
    number.enabled = YES;
    number.borderStyle = UITextBorderStyleRoundedRect;
    number.placeholder = @"集数";
    number.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UITextField *country = [[UITextField alloc] initWithFrame:CGRectMake(0, 310, self.view.bounds.size.width, 50)];
    [self.view addSubview:country];
    country.enabled = YES;
    country.borderStyle = UITextBorderStyleRoundedRect;
    country.placeholder = @"国家";
    country.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UITextField *introduction = [[UITextField alloc] initWithFrame:CGRectMake(0, 380, self.view.bounds.size.width, 50)];
    [self.view addSubview:introduction];
    introduction.enabled = YES;
    introduction.borderStyle = UITextBorderStyleRoundedRect;
    introduction.placeholder = @"简介";
    introduction.clearButtonMode = UITextFieldViewModeWhileEditing;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickSave {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
