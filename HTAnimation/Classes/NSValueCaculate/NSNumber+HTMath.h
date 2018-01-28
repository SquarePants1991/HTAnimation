//
//  NSNumber+HTMath.h
//  Expecta
//
//  Created by yang wang on 2018/1/28.
//

#import <Foundation/Foundation.h>
#import "HTMathOperations.h"

@interface NSNumber (HTMath)
- (NSNumber *)numberByAdd:(NSNumber *)other;
- (NSNumber *)numberBySub:(NSNumber *)other;
- (NSNumber *)numberByMul:(NSNumber *)other;
- (NSNumber *)numberByDiv:(NSNumber *)other;
- (NSNumber *)numberByOperation:(HTMathOperation)operation val:(NSNumber *)other;
@end
