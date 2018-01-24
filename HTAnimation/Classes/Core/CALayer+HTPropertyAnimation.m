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

- (void)ht_property:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete {
    [[self ht_animationWithProperty:keyPath animateFrom:fromValue animateTo:toValue] startWithComplete:complete];
}

- (HTAnimation *)ht_animationWithProperty:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateTo:(NSValue *)toValue {
    HTAnimation *htAnimation = [[HTAnimation alloc] initWithHostLayer:self keyPath:keyPath];
    htAnimation.fromValue = fromValue;
    htAnimation.toValue = toValue;
    return htAnimation;
}
@end
