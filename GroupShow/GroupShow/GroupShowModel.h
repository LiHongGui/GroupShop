//
//  GroupShowModel.h
//  GroupShow
//
//  Created by MichaelLi on 2016/10/31.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupShowModel : NSObject
@property(nonatomic,copy) NSString *buyCount;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *title;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupShowWithDict:(NSDictionary *)dict;


@end
