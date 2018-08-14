//
//  MainViewModel.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/9.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "MainViewModel.h"
#import <YYModel/YYModel.h>

@implementation MainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadColors];
    }
    return self;
}

- (void)loadColors {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"nipponcolors" ofType:@".plist"];
    NSArray *dics = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i<dics.count; i++) {
        ColorModel *model = [ColorModel yy_modelWithDictionary:dics[i]];
        [models addObject:model];
    }
    self.colorModels = models;
}
@end
