//
//  LQLiveCell.h
//  LQIJKMediaFrameDemo
//
//  Created by liqi on 16/9/8.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQLiveItem;
@interface LQLiveCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImgView;
@property (strong, nonatomic) IBOutlet UILabel *liveNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberPersonLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *liveImg;

@property (nonatomic,strong) LQLiveItem *item;




@end
