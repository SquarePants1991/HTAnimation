//
// Created by ocean on 2018/1/24.
//

#import "UIView+HTAnimationChain.h"


@implementation UIView (HTAnimationChain)
- (HTAnimationChain *)ht_anim {
    return [[HTAnimationChain alloc] initWithHostLayer:self.layer];
}
@end