//
//  RemindSettingQueue.h
//  MtGoxClient
//
//  Created by Xukj on 4/27/13.
//  Copyright (c) 2013 tosc-its. All rights reserved.
//

/**
 *	@brief	控制层，如果需要，可以在这里添加代码。处理从通信层传递过来的数据.
 *          如果这里自定义了，那么传递数据到上层UI界面显示的方法可能会重写
 *          重写方法，请参考HttpQueueModule
 */

@class Remind;

@interface RemindSettingQueue : ITSHttpQueueModule
{
    Remind *_remind;
}

@property (nonatomic, strong, readonly)Remind *remind;

-(void)sendRequest:(BaseRequest *)request target:(id)target selector:(SEL)selector remind:(Remind *)inRemind;

@end
