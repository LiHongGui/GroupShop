//
//  FooterView.h
//  GroupShow
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
//代理协议
@protocol FooterViewDelegate <NSObject>

-(void)footerView:(FooterView *)footerView;

@end
@interface FooterView : UIView

-(void)downLoadShow:(BOOL)isShow;
@property(nonatomic,weak) id<FooterViewDelegate>delegate;
@end
