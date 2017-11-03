//
//  DetailViewController.m
//  AnimationFollower
//
//  Created by Gary Lee on 2017/11/2.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property UITextField *name;
@property UITextField *time;
@property UITextField *number;
@property UITextField *country;
@property UITextField *introduction;
@property NSArray *nameArray;
@property NSArray *timeArray;
@property NSArray *numberArray;
@property NSArray *countryArray;
@property NSArray *introductionArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    _timeArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"time"];
    _numberArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"number"];
    _countryArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"country"];
    _introductionArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"introduction"];
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(0, 95, self.view.bounds.size.width, 45)];
    [self.view addSubview:_name];
    _name.enabled = YES;
    _name.borderStyle = UITextBorderStyleRoundedRect;
    _name.placeholder = @"番剧名";
    _name.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.time = [[UITextField alloc] initWithFrame:CGRectMake(0, 165, self.view.bounds.size.width, 45)];
    [self.view addSubview:_time];
    _time.enabled = YES;
    _time.borderStyle = UITextBorderStyleRoundedRect;
    _time.placeholder = @"上映时间";
    _time.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.number = [[UITextField alloc] initWithFrame:CGRectMake(0, 235, self.view.bounds.size.width, 45)];
    [self.view addSubview:_number];
    _number.enabled = YES;
    _number.borderStyle = UITextBorderStyleRoundedRect;
    _number.placeholder = @"集数";
    _number.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.country = [[UITextField alloc] initWithFrame:CGRectMake(0, 305, self.view.bounds.size.width, 45)];
    [self.view addSubview:_country];
    _country.enabled = YES;
    _country.borderStyle = UITextBorderStyleRoundedRect;
    _country.placeholder = @"国家";
    _country.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.introduction = [[UITextField alloc] initWithFrame:CGRectMake(0, 375, self.view.bounds.size.width, 45)];
    [self.view addSubview:_introduction];
    _introduction.enabled = YES;
    _introduction.borderStyle = UITextBorderStyleRoundedRect;
    _introduction.placeholder = @"简介";
    _introduction.clearButtonMode = UITextFieldViewModeWhileEditing;

    _name.text = [_nameArray objectAtIndex:self.index];
    _time.text = [_timeArray objectAtIndex:self.index];
    _number.text = [_numberArray objectAtIndex:self.index];
    _country.text = [_countryArray objectAtIndex:self.index];
    _introduction.text = [_introductionArray objectAtIndex:self.index];
    
    self.navigationItem.title = [_nameArray objectAtIndex:self.index];
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSave)];
    UIBarButtonItem *deleteBtn = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(didClickDelete)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:saveBtn, deleteBtn,nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickSave {
    NSMutableArray *preNameArr = [NSMutableArray arrayWithArray:_nameArray];
    NSMutableArray *preTimeArr = [NSMutableArray arrayWithArray:_timeArray];
    NSMutableArray *preNumberArr = [NSMutableArray arrayWithArray:_numberArray];
    NSMutableArray *preCountryArr = [NSMutableArray arrayWithArray:_countryArray];
    NSMutableArray *preIntroductionArr = [NSMutableArray arrayWithArray:_introductionArray];
    [preNameArr replaceObjectAtIndex:self.index withObject:_name.text];
    [preTimeArr replaceObjectAtIndex:self.index withObject:_time.text];
    [preNumberArr replaceObjectAtIndex:self.index withObject:_number.text];
    [preCountryArr replaceObjectAtIndex:self.index withObject:_country.text];
    [preIntroductionArr replaceObjectAtIndex:self.index withObject:_introduction.text];
    NSArray *newNameArr = [NSArray arrayWithArray:preNameArr];
    NSArray *newTimeArr = [NSArray arrayWithArray:preTimeArr];
    NSArray *newNumberArr = [NSArray arrayWithArray:preNumberArr];
    NSArray *newCountryArr = [NSArray arrayWithArray:preCountryArr];
    NSArray *newIntroductionArr = [NSArray arrayWithArray:preIntroductionArr];
    [[NSUserDefaults standardUserDefaults] setObject:newNameArr forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:newTimeArr forKey:@"time"];
    [[NSUserDefaults standardUserDefaults] setObject:newNumberArr forKey:@"number"];
    [[NSUserDefaults standardUserDefaults] setObject:newCountryArr forKey:@"country"];
    [[NSUserDefaults standardUserDefaults] setObject:newIntroductionArr forKey:@"introduction"];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didClickDelete {
    UIAlertController *deleteAlert = [UIAlertController alertControllerWithTitle:@"是否删除" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){
        
        NSMutableArray *preNameArr = [NSMutableArray arrayWithArray:_nameArray];
        NSMutableArray *preTimeArr = [NSMutableArray arrayWithArray:_timeArray];
        NSMutableArray *preNumberArr = [NSMutableArray arrayWithArray:_numberArray];
        NSMutableArray *preCountryArr = [NSMutableArray arrayWithArray:_countryArray];
        NSMutableArray *preIntroductionArr = [NSMutableArray arrayWithArray:_introductionArray];
        [preNameArr removeObjectAtIndex:self.index];
        [preTimeArr removeObjectAtIndex:self.index];
        [preNumberArr removeObjectAtIndex:self.index];
        [preCountryArr removeObjectAtIndex:self.index];
        [preIntroductionArr removeObjectAtIndex:self.index];
        NSArray *newNameArr = [NSArray arrayWithArray:preNameArr];
        NSArray *newTimeArr = [NSArray arrayWithArray:preTimeArr];
        NSArray *newNumberArr = [NSArray arrayWithArray:preNumberArr];
        NSArray *newCountryArr = [NSArray arrayWithArray:preCountryArr];
        NSArray *newIntroductionArr = [NSArray arrayWithArray:preIntroductionArr];
        [[NSUserDefaults standardUserDefaults] setObject:newNameArr forKey:@"name"];
        [[NSUserDefaults standardUserDefaults] setObject:newTimeArr forKey:@"time"];
        [[NSUserDefaults standardUserDefaults] setObject:newNumberArr forKey:@"number"];
        [[NSUserDefaults standardUserDefaults] setObject:newCountryArr forKey:@"country"];
        [[NSUserDefaults standardUserDefaults] setObject:newIntroductionArr forKey:@"introduction"];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [deleteAlert addAction:delete];
    [deleteAlert addAction:cancle];
    [self presentViewController:deleteAlert animated:YES completion:nil];
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
