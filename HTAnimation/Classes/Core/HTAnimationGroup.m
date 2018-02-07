//
// Created by ocean on 2018/2/7.
//

#import "HTAnimationGroup.h"


@implementation HTAnimationGroup
- (void)mergeFrom:(HTAnimation *)from {
    for (HTAnimation *animation in self.animations) {
        [from mergeTo:animation];
    }
}
@end