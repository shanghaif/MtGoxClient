//
//  RemindDelResponse.h
//  MtGoxClient
//
//  Created by Xukj on 5/6/13.
//  Copyright (c) 2013 tosc-its. All rights reserved.
//

#import "BaseResponse.h"

@interface RemindDelResponse : BaseResponse<ITSResponseDelegate>

@property (nonatomic, assign)BOOL result;

@end
