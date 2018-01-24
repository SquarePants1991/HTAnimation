//
// Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>
#import "HTAnimationChain.h"
typedef HTAnimationChain *(^HTAnimationPropertyChangeActionExecuteBlock)(NSString *keyPath, NSValue * toValue);

@interface HTAnimationChain (HTPropertyChangeAction)
@property (nonatomic, copy) HTAnimationPropertyChangeActionExecuteBlock propertyTo;
@end