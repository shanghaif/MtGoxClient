//
//  SettingAlertControllerViewController.h
//  MtGoxClient
//
//  Created by Xukj on 5/2/13.
//  Copyright (c) 2013 tosc-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingCellControllerViewController;
@class ProgressController;

/**
 *	@brief	设置界面
 */
@interface SettingAlertControllerViewController : UIViewController
{
    @private
    NSMutableArray *mtGoxReminds;
    NSMutableArray *btcChinaReminds;
    NSMutableArray *btcEReminds;

    SettingCellControllerViewController *mtGoxCellController;           //MtGox平台，提醒列表
    SettingCellControllerViewController *btcChinaCellController;        //btcChina平台，提醒列表
    SettingCellControllerViewController *btcECellController;            //btc-E平台，提醒列表
    
    ProgressController *_progressController;    //提示控制器
}

@property (nonatomic, strong, readonly)ProgressController *progressController;
@property (nonatomic, strong)IBOutlet UIScrollView *scrollView;

@end
