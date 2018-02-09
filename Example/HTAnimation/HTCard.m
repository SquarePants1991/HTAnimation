//
//  HTCard.m
//  HTAnimation_Example
//
//  Created by ocean on 2018/1/10.
//  Copyright © 2018年 squarepants1991. All rights reserved.
//

#import "HTCard.h"
#import <HTAnimation/HTAnimationChain+HTTransformAnimation.h>

@implementation HTCard
+ (Class)layerClass {
    return [HTPerspectiveTransformLayer class];
}
@end

