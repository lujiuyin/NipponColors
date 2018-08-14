//
//  ColorIndicator.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ColorIndicator.h"
#import "UIColor+hex2color.h"

#define TriangleW_2 5
#define TriangleH   10

@interface ColorIndicator()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation ColorIndicator

#pragma mark - Life Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor blackColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5];
    CGFloat w_2 = self.bounds.size.width/2;
    CGFloat h = self.bounds.size.height;
    [path moveToPoint:CGPointMake(w_2-TriangleW_2, h)];
    [path addLineToPoint:CGPointMake(w_2, h+TriangleH)];
    [path addLineToPoint:CGPointMake(w_2+TriangleW_2, h)];
    [path fill];
    self.shapeLayer.path = path.CGPath;
    [self.layer addSublayer:self.shapeLayer];
    
    self.titleLab = [[UILabel alloc] initWithFrame:self.bounds];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.titleLab];
}

#pragma mark - I/F
- (void)configure:(ColorModel *)model {
    self.shapeLayer.fillColor = model.color.CGColor;
    self.titleLab.text = model.name;
    self.titleLab.textColor = [UIColor convertColorWithR:[model.r integerValue] g:[model.g integerValue] b:[model.b integerValue]];
}
#pragma mark - Setter * Getter

- (void)setIndicatPoint:(CGPoint)indicatPoint {
    _indicatPoint = indicatPoint;
    
    CGFloat w_2 = self.bounds.size.width/2;
    CGFloat h = self.bounds.size.height;
    CGRect frame = self.frame;
    frame.origin.x = indicatPoint.x - w_2;
    frame.origin.y = indicatPoint.y - h - TriangleH;
    self.frame = frame;
}
@end
