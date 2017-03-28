//
//  HalfWaveView.h
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HalfWaveView : UIView

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha;
- (void)addAnimateWithType:(int)type;//参数值：0-正常 1-从高而降 2-先升再降

@end
