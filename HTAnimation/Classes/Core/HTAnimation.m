//
//  HTAnimation.m
//  Expecta
//
//  Created by ocean on 2018/1/24.
//

#import "HTAnimation.h"
#import "NSValue+HTMath.h"

@interface HTAnimation () <CAAnimationDelegate> {
    @private
    CAAnimation *_caAnimation;
    CALayer *_hostLayer;
    HTAnimationCompleteHandler _completeHandler;
}
@end

@implementation HTAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupDefaultParams];
    }
    return self;
}

- (instancetype)initWithHostLayer:(CALayer *)layer keyPath:(NSString *)keyPath {
    self = [super init];
    if (self) {
        _hostLayer = layer;
        _keyPath = keyPath;
        [self setupDefaultParams];
    }
    return self;
}

- (void)setupDefaultParams {
    _duration = 0.25;
    _delay = 0.0;
    _repeatCount = 0;
}

- (void)startWithComplete:(HTAnimationCompleteHandler)complete {
    _caAnimation = [self prepareCAAnimation];
    if (complete) {
        _completeHandler = complete;
    }
    if (_hostLayer) {
        NSTimeInterval keyTime = [[NSDate date] timeIntervalSince1970];
        [_hostLayer addAnimation:_caAnimation forKey:[NSString stringWithFormat:@"%lf", keyTime]];
    }
}

- (void)mergeFrom:(HTAnimation *)from {
    self.duration = from.duration;
    self.delay = from.delay;
    self.timingFunction = from.timingFunction;
    self.repeatCount = from.repeatCount;
}

#pragma mark - Animation Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (_completeHandler) {
        _completeHandler(flag);
    }
    if (self.completedHookHandler) {
        self.completedHookHandler(flag);
    }
}

#pragma mark - Prepare CAAnimation
- (CAAnimation *)prepareCAAnimation {
    CAAnimation *animation = nil;

    id beginValue = self.fromValue;
    if (!beginValue) {
        beginValue = [[_hostLayer presentationLayer] valueForKeyPath:self.keyPath];
        if (!beginValue) {
            beginValue = [_hostLayer valueForKeyPath:self.keyPath];
        }
    }
    id endValue = self.toValue;

    if (self.timingFunction) {
        CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:self.keyPath];
        NSTimeInterval frameDuration = 1 / 40.0;
        NSTimeInterval currentFrameTime = 0.0;
        NSMutableArray *times = [NSMutableArray new];
        NSMutableArray *values = [NSMutableArray new];
        while (currentFrameTime < self.duration) {
            double timeFactor = currentFrameTime / self.duration;
            double newTimeFactor = self.timingFunction(timeFactor);
            NSValue *delta = [endValue valueBySub:beginValue];
            NSValue *value = [[delta valueByMulScalar:newTimeFactor] valueByAdd:beginValue];
            [values addObject:value];
            [times addObject:@(timeFactor)];
            currentFrameTime += frameDuration;
        }
        double timeFactor = self.timingFunction(1.0);
        NSValue *delta = [endValue valueBySub:beginValue];
        NSValue *value = [[delta valueByMulScalar:timeFactor] valueByAdd:beginValue];
        [values addObject:value];
        [times addObject:@(1)];

        keyframeAnimation.keyTimes = times;
        keyframeAnimation.values = values;
        animation = keyframeAnimation;
    } else {
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:self.keyPath];
        basicAnimation.fromValue = beginValue;
        basicAnimation.toValue = endValue;
        animation = basicAnimation;
    }
    animation.repeatCount = self.repeatCount;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = self.duration;
    animation.beginTime = CACurrentMediaTime() + self.delay;
    animation.delegate = self;
    return animation;
}
@end
