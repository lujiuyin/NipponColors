//
//  DetailViewController.h
//  NipponColors
//
//  Created by 陆久银 on 2018/8/10.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorModel.h"

@interface DetailViewController : UIViewController
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSArray *models;

@end
