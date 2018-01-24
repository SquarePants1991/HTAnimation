//
// Created by ocean on 2018/1/24.
//

#import "HTAnimationChain+HTPropertyChangeAction.h"
#import "CALayer+HTPropertyAnimation.h"

@implementation HTAnimationChain (HTPropertyChangeAction)
- (HTAnimationPropertyChangeActionExecuteBlock)propertyTo {
    HTAnimationPropertyChangeActionExecuteBlock executeBlock = ^(NSString *keyPath, NSValue *toValue) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:keyPath animateFrom:nil animateTo:toValue];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}
@end