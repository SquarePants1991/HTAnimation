//
// Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>
#import "HTAnimationChain.h"

typedef HTAnimationChain *(^HTTransformAnimationMoveExecuteBlock)(CGPoint point);

@interface HTAnimationChain (HTTransformAnimation)
@property (nonatomic, copy) HTTransformAnimationMoveExecuteBlock moveTo;
@end