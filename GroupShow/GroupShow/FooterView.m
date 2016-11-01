//
//  FooterView.m
//  GroupShow
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "FooterView.h"

@interface FooterView()

@property (weak, nonatomic) IBOutlet UIView *downLoadView;
@end
@implementation FooterView

- (IBAction)didDownLoad:(UIButton *)sender {

    /*
     点击按钮,显示下载视图
     */
    //放在这里不好,lg:手机打电话(手机不能拨号,只有使用者才能拨号
//    _downLoadView.alpha = 1;


    if ([self.delegate respondsToSelector:@selector(footerView:)]) {
        [self.delegate footerView:self];
    }
    NSLog(@"jishisd");
}

-(void)downLoadShow:(BOOL)isShow
{
    _downLoadView.alpha = isShow;
}

@end
