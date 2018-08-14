//
//  ColorIndicator.h
//  NipponColors
//
//  Created by 陆久银 on 2018/8/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorModel.h"

@interface ColorIndicator : UIView

@property (nonatomic, assign) CGPoint indicatPoint;

- (void)configure:(ColorModel *)model;
@end
