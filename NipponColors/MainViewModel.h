//
//  MainViewModel.h
//  NipponColors
//
//  Created by 陆久银 on 2018/8/9.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorModel.h"

@interface MainViewModel : NSObject
@property (nonatomic, strong) NSArray<ColorModel *> *colorModels;
@end
