//
// Created by ocean on 2018/1/24.
//

#import "HTAnimationChain.h"
#import "HTAnimation.h"

@interface HTAnimationChain () {
@private
    NSMutableArray *_animations;
}

@end

@implementation HTAnimationChain
- (instancetype)initWithHostLayer:(CALayer *)hostLayer {
    if (self = [super init]) {
        _hostLayer = hostLayer;
        _animations = [NSMutableArray new];
    }
    return self;
}

- (void)addAnimation:(HTAnimation *)animation {
    if (_currentConfigAnimation != nil) {
        [_currentConfigAnimation mergeTo:animation];
        _currentConfigAnimation = nil;
    }
    [_animations addObject:animation];
}

- (HTAnimation *)currentConfigAnimation {
    if (_currentConfigAnimation == nil) {
        _currentConfigAnimation = [HTAnimation new];
    }
    return _currentConfigAnimation;
}

- (HTAnimation *)currentAnimation {
    return _animations.lastObject;
}

- (HTAnimationRunBlock)run {
    return ^(){
        [self peekAndRunAnimation];
    };
}

#pragma mark - Run Animation
- (void)peekAndRunAnimation {
    if (_animations.count > 0) {
        HTAnimation *anim = _animations[0];
        [_animations removeObjectAtIndex:0];
        [anim startWithComplete:^(BOOL finished) {
            [self peekAndRunAnimation];
        }];
    }
    // TODO: 如何做到移除animation而让calayer保持当前状态
}
@end