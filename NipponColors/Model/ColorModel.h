//
//  ColorModel.h
//  NipponColors
//
//  Created by 陆久银 on 2018/8/9.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorModel : NSObject

@property (nonatomic, strong) NSString *index;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *localName;
@property (nonatomic, strong) NSString *hexColor;

@property (nonatomic, strong) NSString *r;
@property (nonatomic, strong) NSString *g;
@property (nonatomic, strong) NSString *b;

@property (nonatomic, strong) NSString *c;
@property (nonatomic, strong) NSString *m;
@property (nonatomic, strong) NSString *y;
@property (nonatomic, strong) NSString *k;

@property (nonatomic, strong) UIColor *color;

@end
