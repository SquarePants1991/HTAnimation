//
// Created by ocean on 2018/2/7.
//

#import "HTAnimation.h"


@interface HTAnimationGroup : HTAnimation
@property (nonatomic, strong) NSArray<HTAnimation *> *animations;
@property (nonatomic, assign) BOOL animationsSyncWithGroup;

+ (HTAnimationGroup *)animationGroupWithAnimations:(NSArray<HTAnimation *> *)animations;
- (void)mergeFrom:(HTAnimation *)from;
@end