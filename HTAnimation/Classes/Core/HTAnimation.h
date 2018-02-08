//
//  HTAnimation.h
//  Expecta
//
//  Created by ocean on 2018/1/24.
//

#import <Foundation/Foundation.h>

typedef void(^HTAnimationCompleteHandler)(BOOL finished);
typedef double (^HTAnimationTimingFunction)(double timeFactor);

@interface HTAnimation : NSObject
@property (nonatomic, strong) CALayer *hostLayer;
@property (nonatomic, strong) NSValue *fromValue;
@property (nonatomic, strong) NSValue *toValue;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSInteger repeatCount;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, copy) HTAnimationTimingFunction timingFunction;
@property (nonatomic, copy) HTAnimationCompleteHandler completedHookHandler;

- (instancetype)initWithHostLayer:(CALayer *)layer keyPath:(NSString *)keyPath;
- (void)startWithComplete:(HTAnimationCompleteHandler)complete;
- (void)mergeFrom:(HTAnimation *)target;
- (CAAnimation *)prepareCAAnimation;
@end
