//
//  MainViewController.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/9.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewModel.h"
#import "ColorCell.h"
#import "DetailViewController.h"
#import "ColorIndicator.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *pickerView;

@property (nonatomic, strong) MainViewModel *viewModel;

@property (nonatomic, strong) ColorIndicator *colorIndicator;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 150;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    [self configuPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(ColorCell *)sender {
    DetailViewController *vc = segue.destinationViewController;
    vc.models = self.viewModel.colorModels;
    vc.index = [self.tableView indexPathForCell:sender].row;
}

#pragma mark - I/F
- (void)configuPickerView {
    for (int i = 0; i < self.viewModel.colorModels.count; i++) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(i, 0, 1, self.pickerView.bounds.size.height)];
        lab.backgroundColor = self.viewModel.colorModels[i].color;
        [self.pickerView addSubview:lab];
    }
    self.pickerView.layer.cornerRadius = 5;
    self.pickerView.layer.masksToBounds = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.pickerView addGestureRecognizer:pan];
    
    [self.view addSubview:self.colorIndicator];
    self.colorIndicator.hidden = YES;
}

- (void)pan:(UIPanGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture locationInView:self.pickerView];
    int index = (int)touchPoint.x;
    if (index < 0 || index >= 250) {
        self.colorIndicator.hidden = YES;
        return;
    }
    [self.colorIndicator configure:self.viewModel.colorModels[index]];
    self.colorIndicator.indicatPoint = CGPointMake(touchPoint.x+self.pickerView.frame.origin.x, self.pickerView.frame.origin.y-10);

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.colorIndicator.hidden = NO;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            self.colorIndicator.hidden = YES;
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            self.colorIndicator.hidden = YES;
        }
            break;
            
        default:
            break;
    }

}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.colorModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ColorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCell" forIndexPath:indexPath];
    ColorModel *model = [self.viewModel.colorModels objectAtIndex:indexPath.row];
    [cell configure:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.transform = CGAffineTransformMakeTranslation(0, 20);
    [UIView animateWithDuration:0.3 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - Setter & Getter
- (MainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MainViewModel alloc] init];
    }
    return _viewModel;
}

- (ColorIndicator *)colorIndicator {
    if (!_colorIndicator) {
        _colorIndicator = [[ColorIndicator alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    }
    return _colorIndicator;
}
#pragma mark - overide
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
