//
//  BaseTabBarViewController.m
//  YTGShop
//
//  Created by maomao on 2017/11/27.
//  Copyright © 2017年 maomao. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationController.h"
#import "YTGHomeViewController.h"
#import "YTGMineViewController.h"
#import "YTGRolloutViewController.h"
@interface BaseTabBarViewController ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController
-(id)init{
    self = [super init];
    if (self) {
        self.tabBar.translucent = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self maryInitViewControllers];
}
-(void)maryInitViewControllers{
    YTGHomeViewController           *homeVc     = [[YTGHomeViewController alloc]init];
    YTGRolloutViewController        *rolloutVc  = [[YTGRolloutViewController alloc]init];
    YTGMineViewController           *mineVc     = [[YTGMineViewController alloc]init];
    
    
    BaseNavigationController     *nav1      = [[BaseNavigationController alloc]initWithRootViewController:homeVc];
    BaseNavigationController     *nav2       = [[BaseNavigationController alloc]initWithRootViewController:rolloutVc];
    BaseNavigationController     *nav3       = [[BaseNavigationController alloc]initWithRootViewController:mineVc];
    
    self.delegate=self;
    self.viewControllers= @[nav1,nav2,nav3];
    
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_ItemHomeUn"] selectedImage:[UIImage imageNamed:@"tabbar_ItemHome"]];
    //
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"开奖" image:[UIImage imageNamed:@"tabbar_ItemHomeUn"] selectedImage:[UIImage imageNamed:@"tabbar_ItemHome"]];
    //
    nav3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"tabbar_ItemHomeUn"] selectedImage:[UIImage imageNamed:@"tabbar_ItemHome"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
