//
//  LQLiveItem.h
//  LQIJKMediaFrameDemo
//
//  Created by liqi on 16/9/7.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  LQCreatorItem;
@interface LQLiveItem : NSObject

@property (nonatomic,strong) NSString *stream_addr;

@property (nonatomic,assign) NSUInteger online_users;

@property (nonatomic,copy) NSString *city;

@property (nonatomic,strong) LQCreatorItem *creator;



@end


@interface LQCreatorItem : NSObject

/* 主播名 */
@property (nonatomic,strong) NSString *nick;
/* 主播头像  */
@property (nonatomic,strong) NSString *portrait;
@end