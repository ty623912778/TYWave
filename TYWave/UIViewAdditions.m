//
//  UIView+Frame.m
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.


//@selector是查找当前类（含子类）的方法。

#import "UIViewAdditions.h"

@implementation UIView(Frame)

- (void) setTop:(CGFloat)t {
    self.frame = CGRectMake(self.left, t, self.width, self.height);
}
- (CGFloat) top {
    return self.frame.origin.y;
}
- (void) setBottom:(CGFloat)b {
    self.frame = CGRectMake(self.left,b-self.height,self.width,self.height);
}
- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void) setLeft:(CGFloat)l {
    self.frame = CGRectMake(l,self.top,self.width,self.height);
}
- (CGFloat) left {
    return self.frame.origin.x;
}
- (void) setRight:(CGFloat)r {
    self.frame = CGRectMake(r-self.width,self.top,self.width,self.height);
}
- (CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void) setWidth:(CGFloat)w {
    self.frame = CGRectMake(self.left, self.top, w, self.height);
}
- (CGFloat) width {
    return self.frame.size.width;
}
- (void) setHeight:(CGFloat)h {
    self.frame = CGRectMake(self.left, self.top, self.width, h);
}
- (CGFloat) height {
    return self.frame.size.height;
}
- (CGFloat) centerx {
    return self.left +self.width/2;
}
- (CGFloat) centery {
    return self.top + self.height/2;
}
-(void) setCenterx:(CGFloat)centerx
{
    self.frame = CGRectMake(centerx-self.width/2, self.top, self.width, self.height);
}
-(void) setCentery:(CGFloat)centery
{
    self.frame = CGRectMake(self.left, centery-self.height/2, self.width, self.height);
}
@end



@implementation UIView (ViewHiarachy)

-(UIViewController *)viewController{
    for (UIView*next=self; next; next=next.superview) {
        UIResponder* nextResponder=[next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
-(void)removeAllSubviews
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

@end


@implementation UIView(gesture)

-(void)addTapAction:(SEL)tapAction target:(id)taget{
    self.userInteractionEnabled=YES;
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:taget action:tapAction];

    [ self  addGestureRecognizer:gesture];
}

/*
 当视图对象的userInteractionEnabled设置为NO的时候，用户触发的事件，如触摸，键盘等，将会被该视图忽略（其他视图照常响应），并且该视图对象也会从事件响应队列中被移除。 当userInteractionEnabled设为YES时，则事件可以正常的传递给该视图对象。 userInteractionEnabled的属性默认值就是YES。
 
 UIResponder
 定义了一些接口对象，然后响应事件 子类必须override这个方法来设置下一个响应者
 
 
 – touchesBegan:withEvent:   当用户触摸到屏幕时调用方法
 – touchesMoved:withEvent:  当用户触摸到屏幕并移动时调用此方法
 – touchesEnded:withEvent:  当触摸离开屏幕时调用此方法
 – touchesCancelled:withEvent:  当触摸被取消时调用此方法
 
 iOS 3.0 + 开始支持motion事件，特别是摇动设备
 – motionBegan:withEvent:       运动开始时执行
 – motionEnded:withEvent:       运动结束时执行
 – motionCancelled:withEvent:  运动被取消时执行
 
 – remoteControlReceivedWithEvent:
 */
@end

@implementation UIView(sepLine)

+(UIView *)sepLineWithRect:(CGRect)rect
{
    UIView *view =[[UIView alloc]initWithFrame:rect];
    view.backgroundColor=[UIColor whiteColor];
    return view;
}

+(UIView *)twoLayerSepLineWithRect:(CGRect)rect
{
    UIImageView *view=[[UIImageView alloc]initWithFrame:rect];
    view.contentMode=UIViewContentModeScaleToFill;
    view.image=[UIImage imageNamed:@"backgroundLine"];
    return view;
}
@end
