//
//  GroupShowCellTableViewCell.m
//  GroupShow
//
//  Created by MichaelLi on 2016/10/31.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "GroupShowCellTableViewCell.h"
#import "GroupShowModel.h"
@interface GroupShowCellTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detaileLabel;
@property (weak, nonatomic) IBOutlet UILabel *payLabel;


@end
@implementation GroupShowCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//重写初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}
-(void)setGroupShowModel:(GroupShowModel *)groupShowModel
{
    //给属性赋值
    _groupShowModel = groupShowModel;
    //给控件赋值
    _iconImageView.image = [UIImage imageNamed:_groupShowModel.icon];
    _titleLabel.text = _groupShowModel.title;
    _detaileLabel.text = [NSString stringWithFormat:@"$%@", _groupShowModel.price];
    _payLabel.text = [NSString stringWithFormat:@"已卖出%@",_groupShowModel.buyCount];

}
@end
