//
//  SettingAlertControllerViewController.m
//  MtGoxClient
//
//  Created by Xukj on 5/2/13.
//  Copyright (c) 2013 tosc-its. All rights reserved.
//

#import "SettingAlertControllerViewController.h"

#import "UserDefault.h"
#import "SettingCellControllerViewController.h"
#import "DeviceUtil.h"
#import "ProgressController.h"

#import "RemindSettingQueue.h"

@interface SettingAlertControllerViewController ()

//初始化数据，从plist读取用户配置
-(void)initData;
//完成界面显示的调整
-(void)setupUI;

@end

@implementation SettingAlertControllerViewController

@synthesize scrollView;
@synthesize progressController = _progressController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initData];
        [self setupHttpQueue];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
}

-(void)dealloc
{
    [_progressController destroyProgress];
    [self destoryHttpQueue];
}

-(void)initData
{
    UserDefault *userDefault = [UserDefault defaultUser];
    [userDefault getUserDefault];
    
    mtGoxCellController = [[SettingCellControllerViewController alloc] init];
    mtGoxCellController.dataArray = userDefault.mtGoxRemind;
    mtGoxCellController.alterDelegate = self;
    
    // 版本v1.0仅支持mtGox，故以下代码预留
//    btcChinaCellController = [[SettingCellControllerViewController alloc] init];
//    btcChinaReminds = userDefault.btcChinaRemind;
//    btcChinaCellController.alterDelegate = self;
//    
//    btcECellController = [[SettingCellControllerViewController alloc] init];
//    btcEReminds = userDefault.btcERemind;
//    btcECellController.alterDelegate = self;
}

-(void)setupUI
{
    // 针对iphone4、4s
    CGRect mtGoxFrame = CGRectMake(8, 12, 303, 169);
    mtGoxCellController.view.frame = mtGoxFrame;
    [self.scrollView addSubview:mtGoxCellController.view];
    mtGoxCellController.headerTitleLabel.text = @"MtGox";
    
//    预留控件
//    CGRect btcChinaFrame = CGRectMake(8, 147, 303, 169);
//    btcChinaCellController.view.frame = btcChinaFrame;
//    [self.scrollView addSubview:btcChinaCellController.view];
//    btcChinaCellController.headerTitleLabel.text = @"BTCChina";
//    
//    CGRect btcEFrame = CGRectMake(8, 282, 303, 169);
//    btcECellController.view.frame = btcEFrame;
//    [self.scrollView addSubview:btcECellController.view];
//    btcECellController.headerTitleLabel.text = @"BTC-E";
//
//    UIImage *bgImage = [UIImage imageNamed:@"bg.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    [DeviceUtil view:self.view image35inch:@"bg.png" image4inch:@"bg_iphone5.png"];

    // 设置返回按钮样式
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popToPreviousViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setFrame:CGRectMake(0.0, 0.0, 26, 26)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    _progressController = [[ProgressController alloc] initWithView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)popToPreviousViewControllerAnimated:(BOOL)animated
{
    mtGoxCellController.alterDelegate = nil;
    btcChinaCellController.alterDelegate = nil;
    btcECellController.alterDelegate = nil;
    
    [self.navigationController popViewControllerAnimated:animated];
}

//////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Request & Receive message from server

//////////////////////////////////////////////////////////////////////////////////////////

-(void)setupHttpQueue
{
    remindQueue = [[RemindSettingQueue alloc] init];
    [[TransManager defaultManager] add:remindQueue];
}

-(void)destoryHttpQueue
{
    [[TransManager defaultManager] remove:remindQueue];
    remindQueue = nil;
}

-(void)updateUIDisplay:(id)responseFromQueue
{
//    NSDictionary *userinfo = [alterDelegate.progressController destroyProgress];
//    if (responseFromQueue == nil || [responseFromQueue isEqual:[NSNull null]]) {
//        [alterDelegate.progressController showToast:@"删除失败"];
//    }
//    else if ([responseFromQueue isKindOfClass:[RemindDelResponse class]]) {
//        RemindDelResponse *response = (RemindDelResponse *)responseFromQueue;
//        if (response.result == NO) {
//            [alterDelegate.progressController showToast:@"删除失败"];
//        }
//        else {
//            NSIndexPath *indexPath = [userinfo objectForKey:@"index"];
//            [self removeDataAtIndex:indexPath.row];
//            [self.alertTableView reloadData];
//        }
//    }
//    else {
//        [alterDelegate.progressController showToast:@"删除失败"];
//    }
}

@end
