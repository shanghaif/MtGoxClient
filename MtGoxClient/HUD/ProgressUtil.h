//
//  ProgressUtil.h
//  tfsp_rc
//
//  Created by Xukj on 3/7/13.
//
//

#import <Foundation/Foundation.h>

@interface ProgressUtil : NSObject

+(void)showProgress:(NSString *)text super:(UIView *)view;

+(void)showProgress:(UIView *)superView;

@end
