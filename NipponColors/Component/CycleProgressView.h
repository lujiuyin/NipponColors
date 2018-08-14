//
//  CycleProgressView.h
//  NipponColors
//
//  Created by 陆久银 on 2018/8/10.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleProgressView : UIView

@property (nonatomic, strong) NSString *parameterStr;

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, assign) CGFloat total;

@end
