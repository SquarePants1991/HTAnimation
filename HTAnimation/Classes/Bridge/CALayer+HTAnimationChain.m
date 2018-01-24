//
// Created by ocean on 2018/1/24.
//

#import "CALayer+HTAnimationChain.h"
#import <objc/runtime.h>

const NSString *kHTCurrentAnimationChainKey;

@implementation CALayer (HTAnimationChain)
- (HTAnimationChain *)ht_anim {
    return [[HTAnimationChain alloc] initWithHostLayer:self];
}
@end