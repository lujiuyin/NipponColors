//
//  DetailViewController.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/10.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "DetailViewController.h"
#import "CycleProgressView.h"
#import <Photos/Photos.h>
#import "HQToastManager.h"

#define ScreenW         [UIScreen mainScreen].bounds.size.width
#define ScreenH         [UIScreen mainScreen].bounds.size.height

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *desRightMargin;
@property (weak, nonatomic) IBOutlet UIView *desView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *localname_lab;


@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgHeight;

@property (nonatomic, strong) ColorModel *model;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoLeftMargin;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet CycleProgressView *rView;
@property (weak, nonatomic) IBOutlet CycleProgressView *gView;
@property (weak, nonatomic) IBOutlet CycleProgressView *bView;

@property (weak, nonatomic) IBOutlet CycleProgressView *cView;
@property (weak, nonatomic) IBOutlet CycleProgressView *mView;
@property (weak, nonatomic) IBOutlet CycleProgressView *yView;
@property (weak, nonatomic) IBOutlet CycleProgressView *kView;

@property (weak, nonatomic) IBOutlet UILabel *hexLab;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgWidth.constant = ScreenW;
    self.bgHeight.constant = ScreenH;
    
    self.model = self.models[self.index];
    [self configure:self.model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self setNeedsStatusBarAppearanceUpdate];
    self.settingBtn.selected = !self.settingBtn.selected;

    self.desRightMargin.constant = sender.selected ? ScreenW : 0;
    self.infoLeftMargin.constant = sender.selected ? - ScreenW : 0;
    
    self.bgWidth.constant = sender.selected ? ScreenW*0.8 : ScreenW;
    self.bgHeight.constant = sender.selected ? ScreenH*0.8 : ScreenH;
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {

    }];
}

- (IBAction)downLoadAction:(UIButton *)sender {
    UIImage *image = [self bg2Image];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        [HQToast showToast:@"下载成功"];
    }
}

- (UIImage *)bg2Image {
    CGRect frame = CGRectMake(0, 0, ScreenW, ScreenH);
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self.model.color CGColor]);
    CGContextFillRect(context, frame);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark - I/F
- (void)configure:(ColorModel *)model {
    self.nameLab.text = model.name;
    self.localname_lab.text = model.localName;
    self.bgView.backgroundColor = model.color;
    
    self.rView.parameterStr = @"R";
    self.rView.value = [model.r integerValue];
    
    self.gView.parameterStr = @"G";
    self.gView.value = [model.g integerValue];
    
    self.bView.parameterStr = @"B";
    self.bView.value = [model.b integerValue];
    
    self.cView.parameterStr = @"C";
    self.cView.total = 100.0;
    self.cView.value = [model.c integerValue];
    
    self.mView.parameterStr = @"M";
    self.mView.total = 100.0;
    self.mView.value = [model.m integerValue];
    
    self.yView.parameterStr = @"Y";
    self.yView.total = 100.0;
    self.yView.value = [model.y integerValue];
    
    self.kView.parameterStr = @"K";
    self.kView.total = 100.0;
    self.kView.value = [model.k integerValue];
    
    self.hexLab.text = [NSString stringWithFormat:@"#%@",model.hexColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.saveBtn.selected ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
}

@end
