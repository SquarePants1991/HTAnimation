//
// Created by ocean on 2018/1/24.
//

#import "HTAnimationChain+HTTransformAnimation.h"
#import "CALayer+HTPropertyAnimation.h"
#import "HTAnimation.h"
#import "HTAnimationGroup.h"

@implementation HTPerspectiveTransformLayer

- (instancetype)init {
    if (self = [super init]) {
        self.perspectiveFactor = 1.0 / -400.0;
    }
    return self;
}

- (void)display {
    CGFloat rotation3dX = [[self presentationLayer] rotation3dX];
    CGFloat rotation3dY = [[self presentationLayer] rotation3dY];
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.perspectiveFactor;
    CATransform3D rotation3dXTransform = CATransform3DRotate(transform, rotation3dX, 1, 0, 0);
    CATransform3D rotation3dYTransform = CATransform3DRotate(transform, rotation3dY, 0, 1, 0);
    transform = CATransform3DConcat(rotation3dXTransform, rotation3dYTransform);
    self.transform = transform;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"rotation3dX"]
            || [key isEqualToString:@"rotation3dY"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}
@end

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
        HTAnimationGroup *animationGroup = [HTAnimationGroup animationGroupWithAnimations:@[animationX, animationY]];
        animationGroup.animationsSyncWithGroup = YES;
        [self addAnimation:animationGroup];
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

- (HTTransformAnimationCGFloatSetExecuteBlock)rotateTo {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"transform.rotation" animateFrom:nil animateTo:@(value / 180.0 * M_PI)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)rotateToAroundX {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"transform.rotation.x" animateFrom:nil animateTo:@(value / 180.0 * M_PI)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)rotateToAroundY {
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"transform.rotation.y" animateFrom:nil animateTo:@(value / 180.0 * M_PI)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)rotateToAroundX3D {
    NSAssert([self.hostLayer isKindOfClass:[HTPerspectiveTransformLayer class]], @"只能在HTPerspectiveTransfromLayer上使用3D透视旋转动画");
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"rotation3dX" animateFrom:nil animateTo:@(value / 180.0 * M_PI)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}

- (HTTransformAnimationCGFloatSetExecuteBlock)rotateToAroundY3D {
    NSAssert([self.hostLayer isKindOfClass:[HTPerspectiveTransformLayer class]], @"只能在HTPerspectiveTransfromLayer上使用3D透视旋转动画");
    HTTransformAnimationCGFloatSetExecuteBlock executeBlock = ^(CGFloat value) {
        HTAnimation *animation = [self.hostLayer ht_animationWithProperty:@"rotation3dY" animateFrom:nil animateTo:@(value / 180.0 * M_PI)];
        [self addAnimation:animation];
        return self;
    };
    return executeBlock;
}




@end