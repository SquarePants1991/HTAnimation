//
//  NSValue+HTMath.m
//  Expecta
//
//  Created by yang wang on 2018/1/25.
//

#import <Foundation/Foundation.h>
#import "NSValue+HTMath.h"
#import "NSNumber+HTMath.h"

@implementation NSValue (HTMath)
- (NSValue *)valueByOperation:(HTMathOperation)operation val:(NSValue *)other {
    if ([self isKindOfClass:[NSNumber class]] &&
            [other isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self numberByOperation:operation val:other];
    }
    const char *selfType = [self objCType];
    const char *otherType = [other objCType];
    if (strcmp(selfType, otherType) != 0 && operation != HTMathOperationMulScalar) {
        // 放弃计算encodeType不一致的情况
        return nil;
    }

    char memLayout[1024];
    int nodeCount = 0;
    int sizeInBytes = 0;
    [self valueMemoryLayout:memLayout count:&nodeCount sizeInBytes:&sizeInBytes];

    unsigned char *selfData = malloc(sizeInBytes);
    [self getValue:selfData];
    unsigned char *otherData = malloc(sizeInBytes);
    [other getValue:otherData];

#define BinaryOp(type)\
    {\
    type selfValue = *((type *)(selfData + offset));\
    type otherValue = *((type *)(otherData + offset));\
    type result;\
    switch (operation) {\
        case HTMathOperationAdd:\
            result = selfValue + otherValue;\
            break;\
        case HTMathOperationSub:\
            result = selfValue - otherValue;\
            break;\
        case HTMathOperationMul:\
            result = selfValue * otherValue;\
            break;\
        case HTMathOperationDiv:\
            result = selfValue / otherValue;\
            break;\
        case HTMathOperationMulScalar:\
            result = selfValue * [(NSNumber *)other doubleValue];\
            break;\
    }\
    memcpy(resultData + offset, &result, sizeof(type));\
    offset += sizeof(type);\
    }


    char *resultData = malloc(sizeInBytes);
    int offset = 0;
    for (int i = 0; i < nodeCount; ++i) {
        char type = memLayout[i];
        switch (type) {
            case 'c':
            BinaryOp(char)
                break;
            case 'C':
            BinaryOp(unsigned char)
                break;
            case 'i':
            BinaryOp(int)
                break;
            case 'I':
            BinaryOp(unsigned int)
                break;
            case 's':
            BinaryOp(short)
                break;
            case 'S':
            BinaryOp(unsigned short)
                break;
            case 'l':
            BinaryOp(long)
                break;
            case 'L':
            BinaryOp(unsigned long)
                break;
            case 'q':
            BinaryOp(long long)
                break;
            case 'Q':
            BinaryOp(unsigned long long)
                break;
            case 'f':
            BinaryOp(float)
                break;
            case 'd':
            BinaryOp(double)
                break;
            case 'B':
            BinaryOp(BOOL)
                break;
        }
    }
    NSValue *value = [NSValue valueWithBytes:resultData objCType:selfType];
    free(selfData);
    free(otherData);
    free(resultData);
    return value;
}

- (void)valueMemoryLayout:(char *)layout count:(int *)count sizeInBytes:(int *)sizeInBytes {
    const char *selfType = [self objCType];
    [self searchVarsInEncodeType:selfType vars:layout varCount:count];
    int size = 0;
    for (int i = 0; i < *count; ++i) {
        char type = *(layout+i);
        switch(type) {
            case 'c':
            case 'C':
                size += sizeof(char);
                break;
            case 'i':
            case 'I':
                size += sizeof(int);
                break;
            case 's':
            case 'S':
                size += sizeof(short);
                break;
            case 'l':
            case 'L':
                size += sizeof(long);
                break;
            case 'q':
            case 'Q':
                size += sizeof(long long);
                break;
            case 'f':
                size += sizeof(float);
                break;
            case 'd':
                size += sizeof(double);
                break;
            case 'B':
                size += sizeof(BOOL);
                break;
        }
    }
    *sizeInBytes = size;
}

- (void)searchVarsInEncodeType:(const char *)str vars:(char *)ptr varCount:(int *)varCount {
    // TODO: 处理多字符的type情况
    // static char *types = "cislqCISLQfdB";
    // 0: unknown
    // 1: collect type
    // 2: struct
    int state = 0;
    int count = 0;
    while ((*str) != '\0') {
        char ch = *str;
        switch (ch) {
            case '{':
                state = 2;
                break;
            case '}':
                state = 0;
                break;
            case '=':
                state = 1;
                break;
            default:
                if (state == 0) {
                    state = 1;
                }
                if (state == 1) {
                    *ptr = ch;
                    ptr++;
                    count++;
                }
        }
        str++;
    }
    *varCount = count;
}

- (NSValue *)valueByAdd:(NSValue *)other {
    return [self valueByOperation:HTMathOperationAdd val:other];
}

- (NSValue *)valueBySub:(NSValue *)other {
    return [self valueByOperation:HTMathOperationSub val:other];
}

- (NSValue *)valueByMul:(NSValue *)other {
    return [self valueByOperation:HTMathOperationMul val:other];
}

- (NSValue *)valueByDiv:(NSValue *)other {
    return [self valueByOperation:HTMathOperationDiv val:other];
}

- (NSValue *)valueByMulScalar:(double)scalar {
    return [self valueByOperation:HTMathOperationMulScalar val:@(scalar)];
}
@end
