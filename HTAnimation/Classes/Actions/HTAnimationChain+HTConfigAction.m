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

- (HTAnimationTimingFuncSetExecuteBlock)timingFunc {
    return ^(HTAnimationTimingFunction timingFunc) {
        self.currentConfigAnimation.timingFunction = timingFunc;
        return self;
    };
}
@end