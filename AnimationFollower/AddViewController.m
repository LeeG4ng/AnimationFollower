//
//  AddViewController.m
//  AnimationFollower
//
//  Created by Gary Lee on 2017/11/2.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property UITextField *name;
@property UITextField *time;
@property UITextField *number;
@property UITextField *country;
@property UITextField *introduction;
@property UIImageView *imageView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSave)];
    self.navigationItem.title = @"新增番剧";
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    CGRect imageViewRect = CGRectMake(0, 20+self.navigationController.navigationBar.frame.size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-20+self.navigationController.navigationBar.frame.size.height);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:imageViewRect];
    [self.view addSubview:scrollView];

    scrollView.contentSize = CGRectMake(imageViewRect.origin.x, imageViewRect.origin.y, imageViewRect.size.width, imageViewRect.size.height+1).size;
    scrollView.scrollEnabled = YES;
    scrollView.scrollsToTop = YES;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, self.navigationController.navigationBar.frame.size.height+50, self.view.bounds.size.width-80, 210)];
    [scrollView addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.userInteractionEnabled = YES;
    self.imageView.image = [UIImage imageNamed:@"origin"];
    UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClickImage)];
    [self.imageView addGestureRecognizer:click];
    
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+280, self.view.bounds.size.width, 45)];
    [scrollView addSubview:_name];
    _name.enabled = YES;
    _name.borderStyle = UITextBorderStyleRoundedRect;
    _name.placeholder = @"番剧名";
    _name.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.time = [[UITextField alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+350, self.view.bounds.size.width, 45)];
    [scrollView addSubview:_time];
    _time.enabled = YES;
    _time.borderStyle = UITextBorderStyleRoundedRect;
    _time.placeholder = @"上映时间";
    _time.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.number = [[UITextField alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+420, self.view.bounds.size.width, 45)];
    [scrollView addSubview:_number];
    _number.enabled = YES;
    _number.borderStyle = UITextBorderStyleRoundedRect;
    _number.placeholder = @"集数";
    _number.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.country = [[UITextField alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+490, self.view.bounds.size.width, 45)];
    [scrollView addSubview:_country];
    _country.enabled = YES;
    _country.borderStyle = UITextBorderStyleRoundedRect;
    _country.placeholder = @"国家";
    _country.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.introduction = [[UITextField alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+560, self.view.bounds.size.width, 45)];
    [scrollView addSubview:_introduction];
    _introduction.enabled = YES;
    _introduction.borderStyle = UITextBorderStyleRoundedRect;
    _introduction.placeholder = @"简介";
    _introduction.clearButtonMode = UITextFieldViewModeWhileEditing;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:)name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickSave {
    if([_name.text  isEqual: @""]||[_time.text  isEqual: @""]||[_number.text  isEqual: @""]||[_country.text  isEqual: @""]||[_introduction.text  isEqual: @""]||_imageView.image == [UIImage imageNamed:@"origin"]) {
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
        
        //imageView
        NSData *imageData = UIImagePNGRepresentation(_imageView.image);
        NSMutableArray *initImageArray = [[NSMutableArray alloc] init];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"image"] == nil) {
            [[NSUserDefaults standardUserDefaults] setObject:initImageArray forKey:@"image"];
        }
        NSArray *preImageArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
        NSMutableArray *imageArray = [NSMutableArray arrayWithArray:preImageArray];
        [imageArray insertObject:imageData atIndex:0];
        NSArray *newImageArray = [NSArray arrayWithArray:imageArray];
        [[NSUserDefaults standardUserDefaults] setObject:newImageArray forKey:@"image"];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//选择图片
- (void)doClickImage {
//    NSLog(@"click");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *photo = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.imageView.image = photo;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)keyboardWillChangeFrame:(NSNotification *)note {
    // 取出系统传过的键盘信息，是一个字典
    NSDictionary *keyboardDict = note.userInfo;
    // 字典里有keyboard的取出键盘变化之后的frame
    CGRect keyboardFrame = [keyboardDict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //键盘怎么移动，文本框就怎么移动，键盘移动多少，文本框就移动多少，文本框时时刻刻跟着键盘走
    // 用键盘的y - 控制器view的高 就得到控制器view要移动的位置
    // 弹出后键盘的Y = 451 - 667 = -216
    // 隐藏后键盘的y = 667 - 667 = 0;
    CGFloat translationY = keyboardFrame.origin.y -self.view.bounds.size.height;
    // 移动控制器view
    //有了键盘的纵坐标 就可以动态控制
    self.view.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];// 退出键盘
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
