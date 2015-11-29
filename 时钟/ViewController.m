//
//  ViewController.m
//  时钟
//
//  Created by Jusive on 15/11/29.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "ViewController.h"

#define preSecondA 6
#define preMinuteA 6
#define angle2randian(a) ((a) / 180.0 *M_PI)
#define preHourA 30
#define preMinuteHourA 0.5
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Colock;
@property (nonatomic,weak) CALayer *second;
@property (nonatomic,weak) CALayer *minute;
@property (nonatomic,weak) CALayer *hour;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加定时器
    
    [self addHour:nil];
    [self addMinute:nil];
    [self addSecond:nil];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self updateTime];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)updateTime{
   //获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取日期组件
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    //获取秒数
    CGFloat sec = cmp.second;
    //计算旋转角度
    CGFloat secondA = angle2randian(preSecondA *sec);
    
    self.second.transform = CATransform3DMakeRotation(secondA, 0, 0, 1);
    CGFloat minute = cmp.minute;
    CGFloat minuteA = angle2randian(minute * preMinuteA);
    self.minute.transform = CATransform3DMakeRotation(minuteA, 0, 0, 1);
    
    CGFloat hour = cmp.hour;
     CGFloat hourA = angle2randian(hour * preHourA);
    CGFloat minuteHourA = angle2randian(minute * preMinuteHourA);
    hourA += minuteHourA;
    
    // 旋转时针
    self.hour.transform = CATransform3DMakeRotation(hourA, 0, 0, 1);
}
-(void)addSecond:(NSSet *)objects{
    CGFloat w = self.Colock.bounds.size.width;
    CGFloat h = self.Colock.bounds.size.height;
    
    CALayer *second = [CALayer layer];
    self.second = second;
    second.backgroundColor = [UIColor redColor].CGColor;
    second.bounds = CGRectMake(0, 0, 2, 123);
    [self.Colock.layer addSublayer:second];
    second.anchorPoint = CGPointMake(0.5, 0.85);
    second.position = CGPointMake(h * 0.5, w * 0.5);
}
-(void)addMinute:(NSSet *)objects{
    CGFloat w = self.Colock.bounds.size.width;
    CGFloat h = self.Colock.bounds.size.height;
    CALayer *minute = [CALayer layer];
    self.minute = minute;
    
    minute.backgroundColor = [UIColor brownColor].CGColor;
    
    minute.bounds = CGRectMake(0, 0, 4, 115);
    
    [self.Colock.layer addSublayer:minute];
    
    minute.anchorPoint = CGPointMake(0.5, 0.85);
    
    minute.position = CGPointMake(w * 0.5, h * 0.5);
}

-(void)addHour:(NSSet *)objects{
    
    CGFloat w = self.Colock.bounds.size.width;
    CGFloat h = self.Colock.bounds.size.height;
    CALayer *hour = [CALayer layer];
    self.hour = hour;
    
    hour.backgroundColor = [UIColor blackColor].CGColor;
    
    hour.bounds = CGRectMake(0, 0, 6, 90);
    
    [self.Colock.layer addSublayer:hour];
    
    hour.anchorPoint = CGPointMake(0.5, 0.85);
    
    hour.position = CGPointMake(w * 0.5, h * 0.5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
