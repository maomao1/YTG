//
//  BaseViewController.m
//  YTGShop
//
//  Created by maomao on 2017/11/27.
//  Copyright © 2017年 maomao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self.navigationItem setHidesBackButton:YES];
}
-(void)marySetNavBarClear{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_clearBack"]  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
-(void)marySetNavBarNormal{
    [self.navigationController.navigationBar setBackgroundImage:nil  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
-(void)setBtnRightEnabled:(BOOL)enbled{
    [self setBtnEnabled:enbled NavBtn:self.ytg_BtnRight];
}
-(void)setbtnLeftEnabled:(BOOL)enbled{
    [self setBtnEnabled:enbled NavBtn:self.ytg_BtnLeft];
    
}

-(void)setBtnEnabled:(BOOL)enbled NavBtn:(UIButton *)sender{
    sender.enabled=enbled;
    if (enbled) {
        sender.alpha=1;
    }
    else {
        sender.alpha=.5;
    }
}
//导航栏左边按钮
-(UIButton *)marySetLeftButton:(id)element {
    return [self marySetLeftButton:element isCustom:NO isLeft:YES];
}
//导航栏自定义样式右边按钮
-(UIButton *)marySetCustomRightBtn:(id)element{
    return [self marySetLeftButton:element isCustom:NO isLeft:NO];
}
-(UIButton *)marySetLeftButton:(id )element isCustom:(BOOL)isCustom isLeft:(BOOL)isLeft{
    UIButton *btnBack=[self maryBarBtnItem:isLeft isCustom:isCustom Medium:element];
    if (isLeft) {
        self.ytg_BtnLeft=nil;
        self.navigationItem.leftBarButtonItems=nil;
        
        self.navigationItem.leftBarButtonItem=[self barButtonItem:btnBack];
        _ytg_BtnLeft=btnBack;
        return _ytg_BtnLeft;
    }else{
        self.ytg_BtnRight=nil;
        self.navigationItem.rightBarButtonItem=[self barButtonItem:btnBack];
        _ytg_BtnRight=btnBack;
        return _ytg_BtnRight;
    }
    
}
-(UIBarButtonItem*)barButtonItem:(UIButton*)btn{
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
-(UIButton *)maryBarBtnItem:(BOOL)isLeft isCustom:(BOOL)isCustom Medium:(id)medium{
    UIButton *btnBack;
    if (isCustom) {///< 自定义样式
        btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    }else{
        btnBack=[UIButton buttonWithType:UIButtonTypeSystem];
    }
    btnBack.tintColor=[UIColor blackColor];
    [btnBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnBack.backgroundColor=[UIColor clearColor];
    btnBack.frame=CGRectMake(0, 0, 25 ,40);
    btnBack.titleLabel.font=[UIFont systemFontOfSize:15];
    //    设置元素
    if ([medium isKindOfClass:[UIImage class]]) {
        UIImage *image=medium;
        btnBack.frame=CGRectMake(0, 0, image.size.width<15?15:image.size.width, 40);
        [btnBack setImage:medium forState:UIControlStateNormal];
    }
    else if([medium isKindOfClass:[NSString class]]){
        [btnBack setTitle:medium  forState:UIControlStateNormal];
        btnBack.frame= CGRectMake(0, 0, 40, 30);
    }
    //    设置左右按钮事件
    if (isLeft) {
        [btnBack setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btnBack addTarget:self action:@selector(maryLeftReturn:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        [btnBack setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [btnBack addTarget:self action:@selector(maryRightReturn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btnBack;
}
-(void)maryLeftReturn:(UIButton *)sender{
    if (![self isMemberOfClass:[BaseViewController class]]) {
        if (self.parentViewController.childViewControllers.count>1) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}
-(void)maryRightReturn:(UIButton *)sender{
    
}
//===============导航栏 多个 按钮=============
-(void)marySetLeftItems:(NSArray *)itemName {
    [self marySetNavigationItems:itemName isLeft:YES];
}
-(void)marySetRightItems:(NSArray *)itemName{
    [self marySetNavigationItems:itemName isLeft:NO];
}
-(void)marySetNavigationItems:(NSArray *)itemsName isLeft:(BOOL)isLeft{
    NSMutableArray *leArrBtn=[NSMutableArray array];
    NSInteger items=itemsName.count;
    for (int i=0; i<items; i++) {
        UIButton *btnBack=[self maryBarBtnItem:isLeft isCustom:NO Medium:itemsName[i]];
        btnBack.tag=10+i;
        [leArrBtn addObject:[self barButtonItem:btnBack]];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItems=nil;
        self.navigationItem.leftBarButtonItems = leArrBtn;
    }
    else{
        self.navigationItem.rightBarButtonItems=nil;
        self.navigationItem.rightBarButtonItems = leArrBtn;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setYtg_title:(NSString *)ytg_title{
    self.navigationItem.title = ytg_title;
    _ytg_title = ytg_title;
}
@end
