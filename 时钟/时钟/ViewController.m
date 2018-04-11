//
//  ViewController.m
//  时钟
//
//  Created by Sdr on 2018/4/10.
//  Copyright © 2018年 com.msxf. All rights reserved.
//

#import "ViewController.h"

#define perSecondA 6

#define perMinA 6

#define perHourA 30

//每一分时针旋转的度数
#define perMinHour 0.5

#define angle2Rad(angle)((angle)/180.0 *M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@property (weak, nonatomic) CALayer *secondL;
@property (weak, nonatomic) CALayer *minuteL;
@property (weak, nonatomic) CALayer *hourL;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
 

    [self addHour];
    [self addMinue];
    [self addSecond];
  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeChange) userInfo:self repeats:YES];
  [self timeChange];
}

- (void)addSecond {
  
  CALayer *layer = [CALayer layer];
  layer.backgroundColor = [UIColor redColor].CGColor;
  layer.bounds = CGRectMake(0, 0, 1, 80);
  layer.position = CGPointMake(self.clockView.bounds.size.width *0.5, self.clockView.bounds.size.height * 0.5);
  layer.anchorPoint = CGPointMake(0.5, 1);
  self.secondL = layer;
  [self.clockView.layer addSublayer:layer];
  
  
}

- (void)addMinue {
  
  CALayer *layer = [CALayer layer];
  layer.backgroundColor = [UIColor blackColor].CGColor;
  layer.bounds = CGRectMake(0, 0, 3, 70);
  layer.position = CGPointMake(self.clockView.bounds.size.width *0.5, self.clockView.bounds.size.height * 0.5);
  layer.anchorPoint = CGPointMake(0.5, 1);
  self.minuteL = layer;
  [self.clockView.layer addSublayer:layer];
  
  
  
}
- (void)timeChange {
  
  NSCalendar *calendar = [NSCalendar currentCalendar];
  //component 日历 年 月 日 时 分秒
  NSDateComponents *cmp =  [calendar  components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour fromDate:[NSDate date]];
  NSInteger curSecond = cmp.second;
  NSInteger curMinute = cmp.minute;
  NSInteger curHour = cmp.hour;
  //旋转多少度
  CGFloat angle = curSecond * perSecondA;
  
  self.secondL.transform = CATransform3DMakeRotation(angle2Rad(angle), 0, 0, 1);
  //让分针开始旋转
  CGFloat minuteA = curMinute *perMinA;
  self.minuteL.transform = CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1);
  CGFloat hourA = curHour *perHourA +curMinute *perMinHour;
  self.hourL.transform = CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1);
  
}

- (void)addHour {

  CALayer *layer = [CALayer layer];
  layer.backgroundColor = [UIColor blackColor].CGColor;
  layer.bounds = CGRectMake(0, 0, 4, 50);
  layer.position = CGPointMake(self.clockView.bounds.size.width *0.5, self.clockView.bounds.size.height * 0.5);
  layer.anchorPoint = CGPointMake(0.5, 1);
  self.hourL = layer;
  [self.clockView.layer addSublayer:layer];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
