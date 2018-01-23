//
//  HTCard.h
//  HTAnimation_Example
//
//  Created by ocean on 2018/1/10.
//  Copyright © 2018年 squarepants1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTCardLayer : CALayer
@property (assign, nonatomic) CGFloat rotateX;
@property (assign, nonatomic) CATransform3D customMatrix;
@end

@interface HTCard : UIView
@end
