//
// Created by ocean on 2018/2/7.
//

#import "HTAnimationGroup.h"


@implementation HTAnimationGroup

+ (HTAnimationGroup *)animationGroupWithAnimations:(NSArray<HTAnimation *> *)animations {
    HTAnimationGroup *animationGroup = [HTAnimationGroup new];
    animationGroup.animationsSyncWithGroup = NO;
    animationGroup.animations = animations;
    animationGroup.hostLayer = [animations.firstObject hostLayer];
    animationGroup.completedHookHandler = ^(BOOL flag) {
        for (HTAnimation *animation in animations) {
            if (animation.completedHookHandler) {
                animation.completedHookHandler(flag);
            }
        }
    };
    return animationGroup;
}

- (void)mergeFrom:(HTAnimation *)from {
    if (self.animationsSyncWithGroup) {
        for (HTAnimation *animation in self.animations) {
            [animation mergeFrom:from];
        }
    }
    [super mergeFrom:from];
}

- (CAAnimation *)prepareCAAnimation {
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    NSMutableArray *caAnimations = [NSMutableArray new];
    for (HTAnimation *animation in self.animations) {
        CAAnimation *caAnimation = [animation prepareCAAnimation];
        [caAnimations addObject:caAnimation];
        if (self.animationsSyncWithGroup) {
            caAnimation.beginTime = 0;
        } else {
            caAnimation.beginTime = animation.delay;
        }
    }
    animationGroup.animations = caAnimations;
    animationGroup.repeatCount = self.repeatCount;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    animationGroup.duration = self.duration;
    animationGroup.beginTime = CACurrentMediaTime() + self.delay;
    animationGroup.delegate = self;
    return animationGroup;
}
@end