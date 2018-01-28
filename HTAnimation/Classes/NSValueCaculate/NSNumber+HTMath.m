//
//  NSNumber+HTMath.m
//  Expecta
//
//  Created by yang wang on 2018/1/28.
//

#import "NSNumber+HTMath.h"

@implementation NSNumber (HTMath)
- (NSNumber *)numberByAdd:(NSNumber *)other {
    return @([self doubleValue] + [other doubleValue]);
}

- (NSNumber *)numberBySub:(NSNumber *)other {
    return @([self doubleValue] - [other doubleValue]);
}

- (NSNumber *)numberByMul:(NSNumber *)other {
    return @([self doubleValue] * [other doubleValue]);
}

- (NSNumber *)numberByDiv:(NSNumber *)other {
    double otherNumberValue = [other doubleValue];
    if (otherNumberValue == 0) {
        return @(NAN);
    }
    return @([self doubleValue] / otherNumberValue);
}

- (NSNumber *)numberByOperation:(HTMathOperation)operation val:(NSNumber *)other {
    switch (operation) {
        case HTMathOperationAdd:
            return [self numberByAdd:other];
        case HTMathOperationSub:
            return [self numberBySub:other];
        case HTMathOperationMul:
            return [self numberByMul:other];
        case HTMathOperationDiv:
            return [self numberByDiv:other];
        default:
            break;
    }
    return nil;
}
@end
