//
//  HTViewController.m
//  HTAnimation
//
//  Created by squarepants1991 on 01/10/2018.
//  Copyright (c) 2018 squarepants1991. All rights reserved.
//

#import "HTViewController.h"
#import "HTCard.h"
#import <HTAnimation/CALayer+HTPropertyAnimation.h>

#define RAD(degree) (degree * M_PI / 180.0)

@interface HTViewController () {
    UIView *animView;
}

@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    animView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    animView.backgroundColor = UIColor.redColor;
    [self.view addSubview:animView];
    [animView.layer ht_property:@"transform.scale" animateTo:@(0.5) complete:^(BOOL finished) {
        
    }];
}
@end
