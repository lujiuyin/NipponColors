//
//  ColorModel.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/9.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ColorModel.h"
#import "UIColor+hex2color.h"

@implementation ColorModel

- (UIColor *)color {
    return [UIColor colorWithHex:self.hexColor];
}
@end
