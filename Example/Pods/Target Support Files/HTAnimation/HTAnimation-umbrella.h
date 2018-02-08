#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HTAnimationChain+HTConfigAction.h"
#import "HTAnimationChain+HTPropertyChangeAction.h"
#import "HTAnimationChain+HTTransformAnimation.h"
#import "CALayer+HTAnimationChain.h"
#import "UIView+HTAnimationChain.h"
#import "CALayer+HTPropertyAnimation.h"
#import "HTAnimation.h"
#import "HTAnimationChain.h"
#import "HTAnimationGroup.h"
#import "HTAnimationTimingFunctions.h"
#import "HTMathOperations.h"
#import "NSNumber+HTMath.h"
#import "NSValue+HTMath.h"

FOUNDATION_EXPORT double HTAnimationVersionNumber;
FOUNDATION_EXPORT const unsigned char HTAnimationVersionString[];

