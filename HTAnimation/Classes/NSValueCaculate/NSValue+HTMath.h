//
//  NSValue+HTMath.h
//  Expecta
//
//  Created by yang wang on 2018/1/25.
//

#import <Foundation/Foundation.h>
#import "HTMathOperations.h"

@interface NSValue (HTMath)
- (NSValue *)valueByAdd:(NSValue *)other;
- (NSValue *)valueBySub:(NSValue *)other;
- (NSValue *)valueByMul:(NSValue *)other;
- (NSValue *)valueByDiv:(NSValue *)other;
- (NSValue *)valueByMulScalar:(double)scalar;
- (NSValue *)valueByOperation:(HTMathOperation)operation val:(NSValue *)other;
@end
