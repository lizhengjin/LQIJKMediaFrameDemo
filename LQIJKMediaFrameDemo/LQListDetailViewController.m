//
//  LQListDetailViewController.m
//  LQIJKMediaFrameDemo
//
//  Created by liqi on 16/9/7.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "LQListDetailViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "LQLiveItem.h"
#import <UIImageView+WebCache.h>


@interface LQListDetailViewController ()

@property (nonatomic,strong) IJKFFMoviePlayerController *player; //专门用来直播的

@end

@implementation LQListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeView];
    [self livePlayer];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)makeView {
    
    UIImageView *liveImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:liveImgView];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat padding = 20;
    backBtn.frame = CGRectMake(0, 0, 100, 80);
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIImageView *backImgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding/2, padding, 20, 20)];
    backImgView.image = [UIImage imageNamed:@"back.png"];
    [self.view addSubview:backImgView];
    
}

- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)livePlayer{
    
 //   NSString  *imageUrl = [NSString stringWithFormat:@"http://img.meelive.cn/%@",self.item.creator.portrait];
 //   [_liveDetaiView.liveImgView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
    
    //流地址
    NSURL *url = [NSURL URLWithString:self.item.stream_addr];
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    [self.view addSubview:playerVc.view];
    [playerVc prepareToPlay];
    
    self.player = playerVc;
    
    playerVc.view.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:playerVc.view  atIndex:1];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.player pause];
    [self.player stop];
    [self.player shutdown];
    
}




- (void)dealloc {
    
    self.player = nil;
    
}

@end
