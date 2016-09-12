//
//  LQLiveCell.m
//  LQIJKMediaFrameDemo
//
//  Created by liqi on 16/9/8.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "LQLiveCell.h"
#import "LQLiveItem.h"
#import <UIImageView+WebCache.h>
@implementation LQLiveCell

- (void)setItem:(LQLiveItem *)item {
    
    _item = item;
    
   NSString *imgUrl = [NSString stringWithFormat:@"http://img.meelive.cn/%@",_item.creator.portrait];
    NSLog(@"_item.creator.portrait = %@",item.creator.portrait);
    [self.headImgView sd_setImageWithURL:[NSURL  URLWithString:imgUrl] placeholderImage:nil options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    if (item.city.length == 0) {
        self.addressLabel.text = @"这不是重点";
    } else {
        self.addressLabel.text = item.city;
        
    }
    
    self.liveNameLabel.text = item.creator.nick;
    
    self.numberPersonLabel.text = [NSString stringWithFormat:@"%zd人在看",item.online_users];
    
    [self.liveImg sd_setImageWithURL:[NSURL  URLWithString:imgUrl] placeholderImage:nil];
    
}

- (void)awakeFromNib {
    
    self.headImgView.layer.cornerRadius = YES;
    self.headImgView.layer.cornerRadius = 5;
    
    
    
}



@end
