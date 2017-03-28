//
//  WaveCell.m
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "WaveCell.h"

@implementation WaveCell
/*
 init－初始化程序
 viewDidLoad－加载视图
 viewWillAppear－UIViewController对象的视图即将加入窗口时调用；
 viewDidApper－UIViewController对象的视图已经加入到窗口时调用；viewWillDisappear－UIViewController对象的视图即将消失、被覆盖或是隐藏时调用；
 viewDidDisappear－UIViewController对象的视图已经消失、被覆盖或是隐藏时调用；didReceiveMemoryWarning - 内存不足时候调用这个
 
 bundle是一个目录,其中包含了程序会使用到的资源. 这些资源包含了如图像,声音,编译好的代码,nib文件(用户也会把bundle称为plug-in). 对应bundle,cocoa提供了类NSBundle.
 
 通过使用下面的方法得到程序的main bundle
 NSBundle *myBundle = [NSBundle mainBundle];
 
 一般我们通过这种方法来得到bundle.如果你需要其他目录的资源,可以指定路径来取得bundle
 NSBundle *goodBundle;
 goodBundle = [NSBundle bundleWithPath:@"~/.myApp/Good.bundle"];
 
 一旦我们有了NSBundle 对象,那么就可以访问其中的资源了
 // Extension is optional
 NSString *path = [goodBundle pathForImageResource:@"Mom"];
 NSImage *momPhoto = [[NSImage alloc] initWithContentsOfFile:path];
 
 bundle中可以包含一个库. 如果我们从库得到一个class, bundle会连接库,并查找该类:
 Class newClass = [goodBundle classNamed:@"Rover"];
 id newInstance = [[newClass alloc] init];
 
 如果不知到class名,也可以通过查找主要类来取得
 Class aClass = [goodBundle principalClass];
 id anInstance = [[aClass alloc] init];
 
 可以看到, NSBundle有很多的用途.在这章中, NSBundle负责(在后台)加载nib文件. 我们也可以不通过NSWindowController来加载nib文件, 直接使用NSBundle:
 BOOL successful = [NSBundle loadNibNamed:@"About" owner:someObject];
 注意噢, 我们指定了一个对象someObject作为nib的File's Owner
 
 */
- (void)awakeFromNib {
    _alpha=1;//属性
    _endless=NO;//属性
}
+(instancetype)cell{
    return [[NSBundle mainBundle ]loadNibNamed:@"WaveCell" owner:nil options:nil][0];
}
-(instancetype)initWithPrecent:(int)precent{
    [self setPrecent:precent];
    self.type=2;
    self.avgScoreLbl.text=[NSString stringWithFormat:@"%d%%",precent];//显示分数
    return  [[NSBundle mainBundle]loadNibNamed:@"WaveCell" owner:nil options:nil][0];
    
}
-(void)setAlpha:(CGFloat)alpha
{
    _alpha=alpha;
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor=textColor;
}
-(void)setType:(int)type
{
    _type=type;
}
-(void)setPrecent:(int)precent{
    _precent=precent;
    self.avgScoreLbl.text=[NSString stringWithFormat:@"%d%%",precent];
    self.avgScoreLbl.textColor=self.textColor;
    self.discriptionLbl.textColor=self.textColor;
    self.leftView.layer.cornerRadius=self.leftView.bounds.size.width/2.0;
    self.leftView.clipsToBounds=YES;
    UIImageView *bigImg = [[UIImageView alloc]init];
    bigImg.image = [UIImage imageNamed:@"fb_wave"];
    self.bigImg = bigImg;
    bigImg.alpha = self.alpha;
    [self.leftView addSubview:bigImg];
    //bigImg.frame = CGRectMake(0, 0, 450, 300);
    bigImg.frame = CGRectMake(0, 0, 520, 350);

    bigImg.top = 115;
    bigImg.left = -370;
}

- (void)setPrecent:(int)precent textColor:(UIColor *)tcolor type:(int)type alpha:(CGFloat)alpha
{
    [self setAlpha:alpha];
    [self setType:type];
    [self setTextColor:tcolor];
    [self setPrecent:precent];
}

NSString * cellRotationKey = @"rotationAnimation";
NSString * cellMoveKey = @"waveMoveAnimation";
- (void)addAnimateWithType:(int)type
{
    CABasicAnimation * transformRoate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    transformRoate.byValue = [NSNumber numberWithDouble:(2 * M_PI)];
    transformRoate.duration = 2;
    transformRoate.repeatCount = self.isEndless == YES ? MAXFLOAT : 2;
    [self.rotateImg.layer addAnimation:transformRoate forKey:cellRotationKey];
    
    __weak __typeof(&*self)weakSelf = self;
    void(^acallBack)(CGFloat start) = ^(CGFloat start) {
        CAKeyframeAnimation * moveAction = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        moveAction.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-60],[NSNumber numberWithFloat:start],nil];
        moveAction.duration = 4;
        // moveAction.autoreverses = YES;
        moveAction.repeatCount = MAXFLOAT;
        [weakSelf.bigImg.layer addAnimation:moveAction forKey:cellMoveKey];
    };
    
    
    if (type == 0) {
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        } completion:^(BOOL finished) {
            if (self.endless == YES) {
                acallBack(self.bigImg.layer.position.x);
            }
        }];
    }else if (type == 1){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:4.0 animations:^{
            self.bigImg.top = 115 - ((avgScore/100.0) * 115);
            if (avgScore == 100) {
                self.bigImg.top = -20;
            }
            self.bigImg.left = 0;
        }completion:^(BOOL finished) {
            if (self.endless == YES) {
                acallBack(self.bigImg.layer.position.x);
            }
        }];
    }else if (type == 2){
        CGFloat avgScore = self.precent;
        [UIView animateWithDuration:1.0 animations:^{
            self.bigImg.top = 0;
            self.bigImg.left = -200;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3.0 animations:^{
                self.bigImg.top = 115 - ((avgScore/100.0) * 115);
                if (avgScore == 100) {
                    self.bigImg.top = -20;
                }
                self.bigImg.left = 0;
            } completion:^(BOOL finished) {
                if (self.endless == YES) {
                    acallBack(self.bigImg.layer.position.x);
                }
            }];
        }];
    }
}

-(void)dealloc{
    [self.bigImg.layer removeAnimationForKey:cellMoveKey];
    [self.bigImg.layer removeAnimationForKey:cellRotationKey];
}




@end
