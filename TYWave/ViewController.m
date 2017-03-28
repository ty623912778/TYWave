//
//  ViewController.m
//  TYWave
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "TYViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtView.layer.cornerRadius=30;//设置圆角
    self.txtView.layer.masksToBounds=YES;//告诉layer将位于他之下的layer都遮盖住
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //第一个参数是 segue， 第二个参数是 sender
    /*
     解决2个问题：
     
     （1） 获取所要跳转到的视图控制器 （ViewController）；
     
     （2） 同时，将上一个视图的数据，传递给下一个视图。 （比如： 上一个视图是TableView， 那么，就要将点击cell的行号传递到下一个视图）。
     
     通过 [viewController setValue: forKey: ] 来存储数据。  既然提供了存储方式，就有对应的获取的方式。
     */
    if ([segue.destinationViewController isKindOfClass:[TableViewController class]]) {
        TableViewController *tbvc=(TableViewController *)segue.destinationViewController;
        tbvc.precent=[self.txtView.text intValue];
    
    }else if ([segue.destinationViewController isKindOfClass:[TYViewController class]]){
        TYViewController *vc = (TYViewController *)segue.destinationViewController;
        vc.precent = [self.txtView.text intValue];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)pushClick {
    int number = [self.txtView.text intValue];
    if (number < 0 || number > 100) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"输入有误" message:@"请输入0~100的数字" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [self performSegueWithIdentifier:@"percent" sender:nil];
    }
}

- (IBAction)pushViewClick {
    int number = [self.txtView.text intValue];
    if (number < 0 || number > 100) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"输入有误" message:@"请输入0~100的数字" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [self performSegueWithIdentifier:@"percentView" sender:nil];
    }
}

@end

