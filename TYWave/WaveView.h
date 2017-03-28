//
//  WaveView.h
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewAdditions.h"

@interface WaveView : UIView
@property (weak, nonatomic) UIView *leftView;
@property (weak, nonatomic) UIImageView *rotateImg;
@property (weak, nonatomic) UILabel *avgScoreLbl;
@property (weak, nonatomic) UILabel *descriptionLbl;
@property (nonatomic,assign) int precent;

@property (nonatomic,strong) UIImageView *bigImg;

@property (nonatomic,assign) CGFloat alpha;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *bgColor;
@property (nonatomic,assign) int type;
@property (nonatomic,assign,getter=isEndless) BOOL endless;
@property (nonatomic,copy) NSString *descriptionTxt;
@property (nonatomic,assign) BOOL half;


- (instancetype)initWithPrecent:(int)precent;

- (void)addAnimateWithType:(int)type;

- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor alpha:(CGFloat)alpha;

- (void)setPrecent:(int)precent description:(NSString *)description textColor:(UIColor *)tcolor bgColor:(UIColor *)bColor alpha:(CGFloat)alpha clips:(BOOL)clips;


@end
