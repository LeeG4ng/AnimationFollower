//
//  AddViewController.m
//  AnimationFollower
//
//  Created by Gary Lee on 2017/11/2.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property UITextField *name;
@property UITextField *time;
@property UITextField *number;
@property UITextField *country;
@property UITextField *introduction;


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSave)];
    self.navigationItem.title = @"新增番剧";
    self.navigationItem.rightBarButtonItem = saveBtn;
    
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickSave {
    if([_name.text  isEqual: @""]||[_time.text  isEqual: @""]||[_number.text  isEqual: @""]||[_country.text  isEqual: @""]||[_introduction.text  isEqual: @""]) {
        UIAlertController *omitAlert = [UIAlertController alertControllerWithTitle:@"信息不完整" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [omitAlert addAction:okAction];
        [self presentViewController:omitAlert animated:YES completion:nil];
    }
    else {
        //name
        NSMutableArray *initNameArray = [[NSMutableArray alloc] init];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"name"] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:initNameArray forKey:@"name"];
        }
        NSArray *preNameArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
        NSMutableArray *nameArray = [[NSMutableArray alloc] initWithArray:preNameArray];
        [nameArray insertObject:_name.text atIndex:0];
        NSArray *newNameArray = [[NSArray alloc] initWithArray:nameArray];
        [[NSUserDefaults standardUserDefaults] setObject:newNameArray forKey:@"name"];
        
        //time
        NSMutableArray *initTimeArray = [[NSMutableArray alloc] init];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"time"] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:initTimeArray forKey:@"time"];
        }
        NSArray *preTimeArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"time"];
        NSMutableArray *timeArray = [[NSMutableArray alloc] initWithArray:preTimeArray];
        [timeArray insertObject:_time.text atIndex:0];
        NSArray *newTimeArray = [[NSArray alloc] initWithArray:timeArray];
        [[NSUserDefaults standardUserDefaults] setObject:newTimeArray forKey:@"time"];
        
        //number
        NSMutableArray *initNumberArray = [[NSMutableArray alloc] init];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"number"] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:initNumberArray forKey:@"number"];
        }
        NSArray *preNumberArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"number"];
        NSMutableArray *numberArray = [[NSMutableArray alloc] initWithArray:preNumberArray];
        [numberArray insertObject:_number.text atIndex:0];
        NSArray *newNumberArray = [[NSArray alloc] initWithArray:numberArray];
        [[NSUserDefaults standardUserDefaults] setObject:newNumberArray forKey:@"number"];
        
        //country
        NSMutableArray *initCountryArray = [[NSMutableArray alloc] init];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"country"] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:initCountryArray forKey:@"country"];
        }
        NSArray *preCountryArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"country"];
        NSMutableArray *countryArray = [[NSMutableArray alloc] initWithArray:preCountryArray];
        [countryArray insertObject:_country.text atIndex:0];
        NSArray *newCountryArray = [[NSArray alloc] initWithArray:countryArray];
        [[NSUserDefaults standardUserDefaults] setObject:newCountryArray forKey:@"country"];
        
        //introduction
        NSMutableArray *initIntroductionArray = [[NSMutableArray alloc] init];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"introduction"] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:initIntroductionArray forKey:@"introduction"];
        }
        NSArray *preIntroductionArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"introduction"];
        NSMutableArray *introductionArray = [[NSMutableArray alloc] initWithArray:preIntroductionArray];
        [introductionArray insertObject:_introduction.text atIndex:0];
        NSArray *newIntroductionArray = [[NSArray alloc] initWithArray:introductionArray];
        [[NSUserDefaults standardUserDefaults] setObject:newIntroductionArray forKey:@"introduction"];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
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
