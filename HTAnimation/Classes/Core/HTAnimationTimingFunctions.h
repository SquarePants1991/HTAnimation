#ifndef __HTAnimationTimingFunctions_H__
#define __HTAnimationTimingFunctions_H__

#import "HTAnimation.h"
const HTAnimationTimingFunction kHTAnimationTimingFunctionLinear = ^(double timeFactor) {
    return timeFactor;
};

#endif