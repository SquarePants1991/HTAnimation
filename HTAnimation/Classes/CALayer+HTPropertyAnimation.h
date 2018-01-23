//
//  CALayer+HTPropertyAnimation.h
//  Expecta
//
//  Created by ocean on 2018/1/23.
//

#import <QuartzCore/QuartzCore.h>

typedef void(^HTAnimationCompleteHandler)(BOOL finished);

@interface CABasicAnimation (HTAnimationInfo)
@property (nonatomic, copy) HTAnimationCompleteHandler completeHandler;
@end


@interface CALayer (HTPropertyAnimation)
- (void)ht_property:(NSString *)keyPath animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete;
- (void)ht_property:(NSString *)keyPath animateBy:(NSValue *)byValue complete:(HTAnimationCompleteHandler)complete;
- (void)ht_property:(NSString *)keyPath animateFrom:(NSValue *)fromValue animateTo:(NSValue *)toValue complete:(HTAnimationCompleteHandler)complete;
@end
