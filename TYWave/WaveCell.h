//
//  WaveCell.h
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewAdditions.h"

@interface WaveCell : UITableViewCell
@property(nonatomic,assign)int precent;
+(instancetype)cell;//使用instancetype作为返回类型,得到的返回类型和方法所在类的类型相同
//instancetype的作用，就是使那些非关联返回类型的方法返回所在类的类型
/*
 instancetype和id的异同
 1、相同点
 都可以作为方法的返回类型
 
 2、不同点
 ①instancetype可以返回和方法所在类相同类型的对象，id只能返回未知类型的对象；
 
 ②instancetype只能作为返回值，不能像id那样作为参数
 
 
 */
@property (weak, nonatomic) IBOutlet UILabel *discriptionLbl;
@property (weak, nonatomic) IBOutlet UILabel *avgScoreLbl;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIImageView *rotateImg;

@property(nonatomic,strong)UIImageView *bigImg;

@property(nonatomic,assign)CGFloat alpha;

@property(nonatomic,strong)UIColor *textColor;
@property(nonatomic,assign,getter=isEndless)BOOL endless;//
//userInteractionEnabled的getter方法是isUserInteractionEnabled；
//我们可以通过isUserInteractionEnabled方法，得到userInteractionEnabled的布尔值。

@property(nonatomic,assign)int type;
-(instancetype)initWithPrecent:(int)precent;//初始化
-(void)addAnimateWithType:(int)type;//
-(void)setPrecent:(int)precent textColor:(UIColor *)tcolor type:(int) type alpha:(CGFloat )alpha;

@end
