//
// Created by ocean on 2018/1/24.
//

#import <UIKit/UIKit.h>

typedef void(^HTAnimationRunBlock)();

@class HTAnimation;
@interface HTAnimationChain : NSObject
@property (nonatomic, strong) CALayer *hostLayer;
@property (nonatomic, copy) HTAnimationRunBlock run;
@property (nonatomic, strong) HTAnimation *currentConfigAnimation;
@property (nonatomic, strong) HTAnimation *currentAnimation;

- (instancetype)initWithHostLayer:(CALayer *)hostLayer;
- (void)addAnimation:(HTAnimation *)animation;
@end