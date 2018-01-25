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

#define RAD(degree) (degree * M_PI / 180.0)

@interface HTViewController () {
    UIView *animView;
}

@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    animView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
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


    animView.ht_anim.delay(0.0).duration(0.4).propertyTo(@"position", [NSValue valueWithCGPoint:CGPointMake(100, 100)]).run();
    animView.ht_anim
            .delay(1.0)
            .duration(2.4)
            .timingFunc(^(NSValue *begin, NSValue *end, CGFloat timeFactor) {
                CGRect beginPt = [begin CGRectValue];
                CGRect endPt = [end CGRectValue];
                CGPoint delta = CGPointMake(endPt.size.width - beginPt.size.width, endPt.size.height- beginPt.size.height);
                timeFactor = sin(timeFactor * M_PI * 10 + M_PI / 2) * 0.4;
                CGRect pt = CGRectMake(0, 0, delta.x * timeFactor + beginPt.size.width, delta.y * timeFactor + beginPt.size.height);
                return [NSValue valueWithCGRect:pt];
            })
            .propertyTo(@"bounds", [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)]).run();
    animView.ht_anim
            .duration(0.5).propertyTo(@"opacity", @0.5)
            .duration(1.5).propertyTo(@"opacity", @1.0)
            .run();
    animView.ht_anim
            .duration(1.5).propertyTo(@"transform.rotation", @(M_PI * 3))
            .run();
    
    NSValue *a = @(2);
    NSValue *b = @(2);
    a = [a valueByAdding:b];
}
@end
