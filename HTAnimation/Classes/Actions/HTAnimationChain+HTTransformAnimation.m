//
// Created by ocean on 2018/1/24.
//

#import "HTAnimationChain+HTTransformAnimation.h"
#import "CALayer+HTPropertyAnimation.h"
#import "HTAnimation.h"

@implementation HTAnimationChain (HTTransformAnimation)
- (HTTransformAnimationMoveExecuteBlock)moveTo {
    HTTransformAnimationMoveExecuteBlock executeBlock = ^(CGPoint toValue) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"position" animateFrom:nil animateTo:[NSValue valueWithCGPoint:toValue]];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

@end