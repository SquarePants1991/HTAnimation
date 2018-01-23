//
//  CALayer+HTPropertyAnimation.m
//  Expecta
//
//  Created by ocean on 2018/1/23.
//

#import "CALayer+HTPropertyAnimation.h"
#import <objc/runtime.h>


const NSString *kCompleteHandlerKey;
@implementation CABasicAnimation (HTAnimationInfo)
- (void)setCompleteHandler:(HTAnimationCompleteHandler)completeHandler {
    objc_setAssociatedObject(self, &kCompleteHandlerKey, completeHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (HTAnimationCompleteHandler)completeHandler {
    return objc_getAssociatedObject(self, &kCompleteHandlerKey);
}

- (id)copyWithZone:(NSZone *)zone {
    CABasicAnimation *anim = [super copyWithZone:zone];
    anim.completeHandler = self.completeHandler;
    return anim;
}
@end

const NSString *kCurrentAnimationsKey;

@interface CALayer() <CAAnimationDelegate>
@property (strong, nonatomic) NSMutableDictionary *currentAnimations;
@end

@implementation CALayer (HTPropertyAnimation)
- (void)ht_property:(NSString *)keyPath animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete {
    [self ht_property:keyPath animateFrom:nil animateTo:toValue complete:complete];
}

- (void) ht_property:(NSString *)keyPath animateBy:(NSValue *)byValue complete:(HTAnimationCompleteHandler)complete {
    [self ht_property:keyPath animateFrom:nil animateBy:byValue complete:complete];
}

- (void)ht_property:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.delegate = self;
    animation.completeHandler = complete;
    if (fromValue == nil) {
        fromValue = [[self presentationLayer] valueForKeyPath:keyPath];
    }
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 2;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    [self addAnimation:animation forKey:keyPath];
}

- (void)ht_property:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateBy:(NSValue *)byValue complete:(HTAnimationCompleteHandler)complete {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.delegate = self;
    animation.completeHandler = complete;
    if (fromValue == nil) {
        fromValue = [[self presentationLayer] valueForKeyPath:keyPath];
    }
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 2;
    animation.fromValue = fromValue;
    animation.byValue = byValue;
    [self addAnimation:animation forKey:keyPath];
}

#pragma mark - Animation Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CABasicAnimation *basicAnim = (CABasicAnimation *)anim;
    if (basicAnim.completeHandler) {
        basicAnim.completeHandler(flag);
    }
}

#pragma mark - Animations Cache
- (NSMutableDictionary *)currentAnimations {
    NSMutableDictionary *dic = objc_getAssociatedObject(self, &kCurrentAnimationsKey);
    if (dic == nil) {
        dic = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &kCurrentAnimationsKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

@end
