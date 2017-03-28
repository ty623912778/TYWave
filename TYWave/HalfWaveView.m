//
//  HalfWaveView.m
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HalfWaveView.h"
#import "WaveView.h"

@interface HalfWaveView ()

@property(nonatomic,strong)WaveView *waveView;

@end
@implementation HalfWaveView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        CGRect subFrame = frame;
        subFrame.size.width = subFrame.size.width * 2;
        subFrame.origin.x = -self.width;
        subFrame.origin.y = 0;
        WaveView *waveView = [[WaveView alloc]initWithFrame:subFrame];
        self.waveView = waveView;
        waveView.backgroundColor = [UIColor orangeColor];
        [self addSubview:waveView];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha{
    [self.waveView setPrecent:precent description:description textColor:tcolor bgColor:bColor alpha:alpha clips:YES];
    self.waveView.half = YES;
}

 //参数值：0-正常 1-从高而降 2-先升再降
- (void)addAnimateWithType:(int)type{
    [self.waveView addAnimateWithType:type];
}

@end
