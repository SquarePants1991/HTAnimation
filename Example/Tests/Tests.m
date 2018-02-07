//
//  HTAnimationTests.m
//  HTAnimationTests
//
//  Created by squarepants1991 on 01/10/2018.
//  Copyright (c) 2018 squarepants1991. All rights reserved.
//

// https://github.com/Specta/Specta

#import <HTAnimation/NSNumber+HTMath.h>
#import <HTAnimation/NSValue+HTMath.h>

SpecBegin(InitialSpecs)

describe(@"Test NSNumber Math", ^{

    it(@"int add int", ^{
        NSNumber *res = [@(3) numberByAdd:@(2)];
        expect([res doubleValue]).to.equal(5);
    });
    it(@"int add float", ^{
        NSNumber *res = [@(3) numberByAdd:@(2.3f)];
        expect([res doubleValue]).to.equal(5.3f);
    });
    it(@"float add float", ^{
        NSNumber *res = [@(3.3f) numberByAdd:@(2.3f)];
        expect([res doubleValue]).to.equal(5.6f);
    });
    it(@"float add double", ^{
        NSNumber *res = [@(3.25f) numberByAdd:@(2.5)];
        expect([res doubleValue]).to.equal(5.75);
    });
});

    describe(@"Test NSValue Math", ^{

        it(@"CGPoint add CGPoint", ^{
            id val1 = [NSValue valueWithCGPoint: CGPointMake(1, 4)];
            id val2 = [NSValue valueWithCGPoint: CGPointMake(9, 3)];
            id resAdd = [val1 valueByOperation:HTMathOperationAdd val:val2];
            expect([resAdd CGPointValue].x).to.equal(10);
            expect([resAdd CGPointValue].y).to.equal(7);
            id resSub = [val1 valueByOperation:HTMathOperationSub val:val2];
            expect([resSub CGPointValue].x).to.equal(-8);
            expect([resSub CGPointValue].y).to.equal(1);
        });

        it(@"Rect add Rect", ^{
            id val1 = [NSValue valueWithCGRect:CGRectMake(10, 100, 30, 55)];
            id val2 = [NSValue valueWithCGRect:CGRectMake(10, 105, 10, 55)];
            id res = [val1 valueByOperation:HTMathOperationAdd val:val2];
            expect([res CGRectValue].origin.x).to.equal(20);
            expect([res CGRectValue].origin.y).to.equal(205);
            expect([res CGRectValue].size.width).to.equal(40);
            expect([res CGRectValue].size.height).to.equal(110);
        });


        it(@"Mul Scalar", ^{
            id val1 = [NSValue valueWithCGRect:CGRectMake(10, 100, 30, 55)];
            id res = [val1 valueByMulScalar:0.5];
            expect([res CGRectValue].origin.x).to.equal(5);
            expect([res CGRectValue].origin.y).to.equal(50);
            expect([res CGRectValue].size.width).to.equal(15);
            expect([res CGRectValue].size.height).to.equal(55/2.0);
        });

    });
SpecEnd

