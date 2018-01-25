//
//  NSValue+HTMath.m
//  Expecta
//
//  Created by yang wang on 2018/1/25.
//

#import <Foundation/Foundation.h>
#import "NSValue+HTMath.h"

@implementation NSValue (HTMath)
- (NSValue *)valueByAdding:(NSValue *)other {
    if ([self isKindOfClass:@[NSNumber class]] &&
        [other isKindOfClass:@[NSNumber class]]) {
        return
    }
    const char *selfType = [self objCType];
    const char *otherType = [other objCType];
    if (strcmp(selfType, otherType) == 0) {
        const char *tp = @encode(int);
        if (strcmp(selfType, @encode(NSInteger)) == 0) {
            
        }
    }
    return nil;
}

- (NSValue *)valueByAddingInt:(NSValue *)other {
    double number = [self ]
}
@end
