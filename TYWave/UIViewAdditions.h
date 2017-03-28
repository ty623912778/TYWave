//
//  UIView+Frame.h
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//segue虽然实现的是视图之间的跳转，其实是视图控制器之间的切换

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIView (Frame)
@property (nonatomic,assign)CGFloat top;
@property (nonatomic,assign)CGFloat bottom;
@property (nonatomic,assign)CGFloat left;
@property (nonatomic,assign)CGFloat right;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGFloat centerx;
@property (nonatomic,assign)CGFloat centery;
@end

@interface UIView(ViewHiarachy)//层

@property(nonatomic,readonly)UIViewController *viewController;
-(void)removeAllSubviews;

@end

@interface  UIView(gesture)
-(void)addTapAction:(SEL)tapAction target:(id)taget;/*
                                                     根据一个SEL数据就可以找到对应的方法地址，进而调用方法
                                                     */
@end

@interface  UIView(sepLine)
+(UIView *)sepLineWithRect:(CGRect)rect;
+(UIView *)twoLayerSepLineWithRect:(CGRect )rect;

@end