//
// Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>
#import "HTAnimationChain.h"
#import "HTAnimation.h"

typedef HTAnimationChain *(^HTAnimationTimeSetActionExecuteBlock)(NSTimeInterval delay);
typedef HTAnimationChain *(^HTAnimationTimingFuncSetExecuteBlock)(HTAnimationTimingFunction timingFunc);
typedef HTAnimationChain *(^HTAnimationCompleteCallbackSetActionExecuteBlock)(void(^completed)(BOOL));

@interface HTAnimationChain (HTConfigAction)
@property (nonatomic, copy) HTAnimationTimeSetActionExecuteBlock delay;
@property (nonatomic, copy) HTAnimationTimeSetActionExecuteBlock duration;
@property (nonatomic, copy) HTAnimationTimingFuncSetExecuteBlock timingFunc;
@property (nonatomic, copy) HTAnimationCompleteCallbackSetActionExecuteBlock then;

@end