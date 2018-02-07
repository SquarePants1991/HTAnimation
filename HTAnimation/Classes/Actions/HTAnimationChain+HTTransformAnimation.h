//
// Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>
#import "HTAnimationChain.h"

typedef HTAnimationChain *(^HTTransformAnimationTwoCGFloatExecuteBlock)(CGFloat x, CGFloat y);
typedef HTAnimationChain *(^HTTransformAnimationCGFloatSetExecuteBlock)(CGFloat value);

@interface HTAnimationChain (HTTransformAnimation)
@property (nonatomic, copy) HTTransformAnimationTwoCGFloatExecuteBlock moveTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock moveXTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock moveYTo;

@property (nonatomic, copy) HTTransformAnimationTwoCGFloatExecuteBlock scaleTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock scaleXTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock scaleYTo;
@end