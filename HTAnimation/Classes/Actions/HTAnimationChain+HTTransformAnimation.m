//
// Created by ocean on 2018/1/24.
//

#import "HTAnimationChain+HTTransformAnimation.h"
#import "CALayer+HTPropertyAnimation.h"
#import "HTAnimation.h"

@implementation HTAnimationChain (HTTransformAnimation)
- (HTTransformAnimationTwoCGFloatExecuteBlock)moveTo {
    HTTransformAnimationTwoCGFloatExecuteBlock executeBlock = ^(CGFloat x, CGFloat y) {
        CGPoint toValue = CGPointMake(x, y);
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"position" animateFrom:nil animateTo:[NSValue valueWithCGPoint:toValue]];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)moveXTo {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"position.x" animateFrom:nil animateTo:@(value)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)moveYTo {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"position.y" animateFrom:nil animateTo:@(value)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationTwoCGFloatExecuteBlock)scaleTo {
    HTTransformAnimationTwoCGFloatExecuteBlock executeBlock = ^(CGFloat x, CGFloat y) {
        HTAnimation *animationX = [self.hostLayer ht_animationWithProperty:@"transform.scale.x" animateFrom:nil animateTo:@(x)];
        HTAnimation *animationY = [self.hostLayer ht_animationWithProperty:@"transform.scale.y" animateFrom:nil animateTo:@(y)];

        [self addAnimation:animationX];
        [self addAnimation:animationY];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)scaleXTo {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"transform.scale.x" animateFrom:nil animateTo:@(value)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)scaleYTo {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"transform.scale.y" animateFrom:nil animateTo:@(value)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

@end