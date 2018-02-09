//
// Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>
#import "HTAnimationChain.h"

typedef HTAnimationChain *(^HTTransformAnimationTwoCGFloatExecuteBlock)(CGFloat x, CGFloat y);
typedef HTAnimationChain *(^HTTransformAnimationCGFloatSetExecuteBlock)(CGFloat value);

@interface HTPerspectiveTransformLayer: CALayer
@property (nonatomic, assign) CGFloat rotation3dX;
@property (nonatomic, assign) CGFloat rotation3dY;
@property (nonatomic, assign) CGFloat perspectiveFactor;
@end

@interface HTAnimationChain (HTTransformAnimation)
@property (nonatomic, copy) HTTransformAnimationTwoCGFloatExecuteBlock moveTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock moveXTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock moveYTo;

@property (nonatomic, copy) HTTransformAnimationTwoCGFloatExecuteBlock scaleTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock scaleXTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock scaleYTo;

/// rotation为绕z轴旋转，参数为度数0～360～...度
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock rotateTo;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock rotateToAroundX;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock rotateToAroundY;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock rotateToAroundX3D;
@property (nonatomic, copy) HTTransformAnimationCGFloatSetExecuteBlock rotateToAroundY3D;
@end