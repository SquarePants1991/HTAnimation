//
// Created by ocean on 2018/1/24.
//

#import "HTAnimationChain+HTConfigAction.h"
#import "HTAnimation.h"

@implementation HTAnimationChain (HTConfigAction)
- (HTAnimationTimeSetActionExecuteBlock)delay {
    return ^(NSTimeInterval delay) {
        self.currentConfigAnimation.delay = delay;
        return self;
    };
}

- (HTAnimationTimeSetActionExecuteBlock)duration {
    return ^(NSTimeInterval duration) {
        self.currentConfigAnimation.duration = duration;
        return self;
    };
}

- (HTAnimationIntegerSetActionExecuteBlock)repeat {
    return ^(NSInteger repeatCount) {
        self.currentConfigAnimation.repeatCount = repeatCount;
        return self;
    };
}

- (HTAnimationTimingFuncSetExecuteBlock)timingFunc {
    return ^(HTAnimationTimingFunction timingFunc) {
        self.currentConfigAnimation.timingFunction = timingFunc;
        return self;
    };
}

- (HTAnimationCompleteCallbackSetActionExecuteBlock)then {
    return ^(void(^completed)(BOOL)) {
        self.currentAnimation.completedHookHandler = completed;
        return self;
    };
}
@end