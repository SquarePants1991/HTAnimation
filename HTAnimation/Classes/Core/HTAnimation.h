//
//  HTAnimation.h
//  Expecta
//
//  Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>

typedef void(^HTAnimationCompleteHandler)(BOOL finished);
typedef NSValue *(^HTAnimationTimingFunction)(NSValue *begin, NSValue *end, CGFloat timeFactor);

@interface HTAnimation : NSObject
@property (nonatomic, strong) NSValue *fromValue;
@property (nonatomic, strong) NSValue *toValue;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, copy) HTAnimationTimingFunction timingFunction;
@property (nonatomic, copy) HTAnimationCompleteHandler completedHookHandler;

- (instancetype)initWithHostLayer:(CALayer *)layer keyPath:(NSString *)keyPath;
- (void)startWithComplete:(HTAnimationCompleteHandler)complete;
- (void)mergeTo:(HTAnimation *)target;
@end
