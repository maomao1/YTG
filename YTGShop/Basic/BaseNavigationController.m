//
//  BaseNavigationController.m
//  YTGShop
//
//  Created by maomao on 2017/11/27.
//  Copyright © 2017年 maomao. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [[UINavigationBar appearance]setBarTintColor:[UIColor whiteColor]];
        [UINavigationBar appearance].tintColor = [UIColor blackColor];
        
        
        [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    }
    return self;
}
+(instancetype)maryBasicNation:(UIViewController*)rootViewController{
    BaseNavigationController *basicNatcon=[[BaseNavigationController alloc]initWithRootViewController:rootViewController];
    return basicNatcon;
}
+(instancetype)maryClearNation:(UIViewController*)rootViewController{
    BaseNavigationController *basicNatcon=[[BaseNavigationController alloc]initWithRootViewController:rootViewController];
    [basicNatcon.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_clearBack"] forBarMetrics:UIBarMetricsDefault];
    [basicNatcon.navigationBar setShadowImage:[UIImage new]];
    return basicNatcon;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
