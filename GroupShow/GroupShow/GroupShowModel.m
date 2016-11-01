//
//  GroupShowModel.m
//  GroupShow
//
//  Created by MichaelLi on 2016/10/31.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "GroupShowModel.h"

@implementation GroupShowModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)groupShowWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
