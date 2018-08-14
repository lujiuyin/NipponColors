//
//  ColorCell.m
//  NipponColors
//
//  Created by 陆久银 on 2018/8/9.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ColorCell.h"

@interface ColorCell()
@property (weak, nonatomic) IBOutlet UILabel *colorname;
@property (weak, nonatomic) IBOutlet UILabel *locolname;

@end

@implementation ColorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(ColorModel *)model {
    self.colorname.text = model.name;
    self.locolname.text = model.localName;
    self.contentView.backgroundColor = model.color;
}

@end


