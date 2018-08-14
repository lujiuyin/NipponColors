//
//  UINavigationController+Status.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "UINavigationController+Status.h"

@implementation UINavigationController (Status)

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

@end
