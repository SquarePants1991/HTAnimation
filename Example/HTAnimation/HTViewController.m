//
//  HTViewController.m
//  HTAnimation
//
//  Created by squarepants1991 on 01/10/2018.
//  Copyright (c) 2018 squarepants1991. All rights reserved.
//

#import "HTViewController.h"
#import "HTCard.h"
@import HTAnimation;
#import <HTAnimation/HTAnimationChain+HTTransformAnimation.h>

#define RAD(degree) (degree * M_PI / 180.0)

@interface HTViewController () {
    HTCard *animView;
}

@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    animView = [[HTCard alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    animView.backgroundColor = UIColor.redColor;
    [self.view addSubview:animView];
//    animView.ht_anim
//            .delay(0.3)
//            .duration(1.0)
//            .timingFunc(^(NSValue *begin, NSValue *end, CGFloat timeFactor) {
//                CGPoint beginPt = [begin CGPointValue];
//                CGPoint endPt = [end CGPointValue];
//                CGPoint delta = CGPointMake(endPt.x - beginPt.x, endPt.y - beginPt.y);
//                timeFactor = sin(timeFactor * M_PI * 2 + M_PI / 2);
//                CGPoint pt = CGPointMake(delta.x * timeFactor + beginPt.x, delta.y * timeFactor + beginPt.y);
//                return [NSValue valueWithCGPoint:pt];
//            })
//            .moveTo(CGPointMake(100, 100))
//            .moveTo(CGPointMake(100, 200))
//            .moveTo(CGPointMake(200, 200))
//            .moveTo(CGPointMake(200, 100))
//            .run();
//
//    animView.ht_anim.delay(1.0).duration(1.0).propertyTo(@"opacity", @0.5).run();
//    animView.ht_anim.delay(1.2).duration(1.0).propertyTo(@"transform.scale", @0.5).run();
//    animView.ht_anim.delay(1.2).duration(10.0).propertyTo(@"transform.rotation", @(8 * M_PI)).run();


//    animView.ht_anim.delay(0.0).duration(0.4).propertyTo(@"position", [NSValue valueWithCGPoint:CGPointMake(100, 100)]).run();
//    animView.ht_anim
//            .delay(1.0)
//            .duration(2.4)
//            .timingFunc(kHTAnimationTimingFunctionLinear)
//            .propertyTo(@"bounds", [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)]).run();
//    animView.ht_anim
//            .duration(0.5).propertyTo(@"opacity", @0.5)
//            .duration(1.5).propertyTo(@"opacity", @1.0)
//            .run();
//    animView.ht_anim
//            .moveTo(200, 200)
//            .duration(0.4)
//            .delay(1)
//            .timingFunc(^(double timeFactor) {
//                return pow(timeFactor, 2.0);
//            })
//            .scaleTo(2,2)
//            .duration(1)
//            .rotateTo(360)
//            .duration(1)
//            .rotateToAroundX(360)
//            .duration(1)
//            .rotateToAroundY(360)
//            .scaleXTo(0.4)
//            .scaleYTo(0.2)
//            .run();
    animView.ht_anim
            .moveTo(100, 100)
            .delay(1)
            .duration(1)
            .timingFunc(^(double timeFactor) {
                return pow(timeFactor, 0.8);
            })
            .repeat(10)
            .rotateToAroundX3D(360)
            .then(^(BOOL flag) {
                [(HTPerspectiveTransformLayer *)animView.layer setPerspectiveFactor:1.0 / -200.0];
            })
            .duration(1.2)
            .rotateToAroundY3D(230)
            .scaleTo(1.5,1.2)
            .run();
#define AnimationScope(Name)
//    animView.ht_anim
//                    AnimationScope(CrossFade)
//            .duration(0.5)
//            .timingFunc(^(double timeFactor) {
//                return sin(timeFactor * M_PI);
//            })
//            .repeat(1)
//            .propertyTo(@"opacity", @(0.0))
//            .then(^(BOOL flag) {
//                NSLog(@"transform.rotation finish");
//            })
//                    AnimationScope(Move)
//            .duration(0.25)
//            .moveXTo(100)
//            .duration(0.25)
//            .moveYTo(100)
//            .moveXTo(0)
//            .moveXTo(200)
//            .moveYTo(300)
//            .scaleTo(2,2)
//            .scaleXTo(1)
//            .scaleYTo(1)
//            .run();
}
@end
