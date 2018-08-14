//
//  CycleProgressView.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/10.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "CycleProgressView.h"

@interface CycleProgressView()
@property (nonatomic, strong) UILabel *cycleLab;
@property (nonatomic, strong) CAShapeLayer *cycleLayer;

@property (nonatomic, strong) UILabel *numberLab;
@end

@implementation CycleProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
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
    self.total = 255.0;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.cycleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
    [self addSubview:self.cycleLab];
    self.cycleLab.textAlignment = NSTextAlignmentCenter;
    self.cycleLab.textColor = [UIColor whiteColor];
    
    //placeholder layer
    CAShapeLayer *placeholderLayer = [CAShapeLayer layer];
    placeholderLayer.frame = self.cycleLab.bounds;
    
    UIBezierPath *placeholderPath = [UIBezierPath bezierPathWithOvalInRect:self.cycleLab.frame];
    placeholderLayer.path = placeholderPath.CGPath;
    placeholderLayer.strokeColor = [UIColor colorWithWhite:0.8 alpha:0.3].CGColor;
    placeholderLayer.lineWidth = 2;
    placeholderLayer.fillColor = nil;
    [self.cycleLab.layer addSublayer:placeholderLayer];
    
    //cycleLayer
    self.cycleLayer = [CAShapeLayer layer];
    self.cycleLayer.frame = self.cycleLab.bounds;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.cycleLab.center radius:self.cycleLab.bounds.size.width/2 startAngle:-M_PI_2 endAngle:M_PI*3/2 clockwise:YES];;
    self.cycleLayer.path = path.CGPath;
    self.cycleLayer.strokeEnd = 0;
    self.cycleLayer.lineCap = kCALineCapRound;
    self.cycleLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.cycleLayer.lineWidth = 2;
    self.cycleLayer.fillColor = nil;
    [self.cycleLab.layer addSublayer:self.cycleLayer];
    
    self.numberLab = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.height+5, 0, self.bounds.size.width-5-self.bounds.size.height, self.bounds.size.height)];
    self.numberLab.textColor = [UIColor whiteColor];
    [self addSubview:self.numberLab];
}

#pragma mark - Getter & Setter
- (void)setParameterStr:(NSString *)parameterStr {
    _parameterStr = parameterStr;
    self.cycleLab.text = parameterStr;
}

- (void)setValue:(NSInteger)value {
    if (value == _value && value != 0) {
        return;
    }
    _value = value;
    self.numberLab.text = [NSString stringWithFormat:@"%ld",(long)value];
    [self removeAnimation:self.cycleLayer];
    [self addAnimation:self.cycleLayer toValue:value];
}

- (void)removeAnimation:(CALayer *)layer {
    if ([layer animationForKey:@"strokeEnd"]) {
        [layer removeAnimationForKey:@"strokeEnd"];
    }
}

- (void)addAnimation:(CALayer *)layer toValue:(NSInteger)value {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1;
    animation.fromValue = @(0);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    float percent = value/self.total;
    animation.toValue = [NSNumber numberWithFloat:percent];
    [layer addAnimation:animation forKey:@"strokeEnd"];
}
@end
