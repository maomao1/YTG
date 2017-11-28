//
//  BaseViewController.h
//  YTGShop
//
//  Created by maomao on 2017/11/27.
//  Copyright © 2017年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BV_Exception_Format @"在%@的子类中必须override:%@方法"
typedef  void (^maryFailure) (NSError *error);
typedef void(^maryReturnWithData)(id result);//下步操作后有跟新数据
typedef  void (^maryFailure) (NSError *error);
@interface BaseViewController : UIViewController
@property  (copy,   nonatomic)  NSString         *ytg_title;
@property (nonatomic,strong)    UIButton         *ytg_BtnLeft;
@property (nonatomic,strong)    UIButton         *ytg_BtnRight;
@property (nonatomic,copy  ) dispatch_block_t ytg_RereshingData;//下步操作后有更新数据
@property (nonatomic,copy  ) maryReturnWithData ytg_returnWithData;
-(void)marySetNavBarClear;
-(void)marySetNavBarNormal;
-(void)setBtnRightEnabled:(BOOL)enbled;
-(void)setbtnLeftEnabled:(BOOL)enbled;
-(void)setBtnEnabled:(BOOL)enbled NavBtn:(UIButton *)sender;
-(void)marySetViewBackImg:(NSString *)imageName;
//有导航栏按钮 必须重写事件
-(void)maryRightReturn:(UIButton *)sender;
//导航栏左边按钮 可重写事件
-(void)maryLeftReturn:(UIButton *)sender;
-(void)maryRootReturn:(id)control;/**返回根控制器*/

/**
 *
 *  导航栏统一左边按钮
 *
 *
 *  @return 左按钮
 */
-(UIButton *)marySetLeftButton:(id)element;
/**
 *
 *  导航栏统一右边按钮
 *
 *
 *  @return 右按钮
 */
-(UIButton *)marySetRightButton:(id)element;
//导航栏自定义样式左边按钮
-(UIButton *)marySetCustomLeftBtn:(id)element;
//导航栏自定义样式右边按钮
-(UIButton *)marySetCustomRightBtn:(id)element;
/**
 *
 *  导航栏多个按钮
 *
 */
-(void)marySetLeftItems:(NSArray *)itemName;
-(void)marySetRightItems:(NSArray *)itemName;
@end
