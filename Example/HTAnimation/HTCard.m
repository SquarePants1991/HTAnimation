//
//  HTCard.m
//  HTAnimation_Example
//
//  Created by ocean on 2018/1/10.
//  Copyright © 2018年 squarepants1991. All rights reserved.
//

#import "HTCard.h"

@implementation HTCardLayer

- (void)setRotateX:(CGFloat)rotateX {
    _rotateX = rotateX;
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -300.0;
    self.transform = CATransform3DRotate(transform, rotateX, 1, 0, 0);
}

- (void)display {
    CGFloat rotateX = [(HTCardLayer *)self.presentationLayer rotateX];
    CATransform3D customMatrix = [(HTCardLayer *)self.presentationLayer customMatrix];
//    NSLog(@"%lf", rotateX);
    NSLog(@"%lf, %lf, %lf, %lf", customMatrix.m11, customMatrix.m12, customMatrix.m13, customMatrix.m14);
    NSLog(@"%lf, %lf, %lf, %lf", customMatrix.m21, customMatrix.m22, customMatrix.m23, customMatrix.m24);
    NSLog(@"%lf, %lf, %lf, %lf", customMatrix.m31, customMatrix.m32, customMatrix.m33, customMatrix.m34);
    NSLog(@"%lf, %lf, %lf, %lf", customMatrix.m41, customMatrix.m42, customMatrix.m43, customMatrix.m44);
    NSLog(@"---------");
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -300.0;
    self.transform = CATransform3DRotate(transform, rotateX, 1, 0, 0);
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"rotateX"]) {
        return YES;
    }
    if ([key isEqualToString:@"customMatrix"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}
@end

@implementation HTCard
+ (Class)layerClass {
    return [HTCardLayer class];
}
@end

