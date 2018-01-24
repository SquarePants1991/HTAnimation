//
//  CALayer+HTPropertyAnimation.h
//  Expecta
//
//  Created by ocean on 2018/1/23.
//

#import <QuartzCore/QuartzCore.h>
#import "HTAnimation.h"


@interface CABasicAnimation (HTAnimationInfo)
@property (nonatomic, copy) HTAnimationCompleteHandler completeHandler;
@end


@interface CALayer (HTPropertyAnimation)
- (void)ht_property:(NSString *)keyPath animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete;
- (void)ht_property:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete;
- (HTAnimation *)ht_animationWithProperty:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateTo:(NSValue *)toValue;
@end
