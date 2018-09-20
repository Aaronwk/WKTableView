//
//  WKPlaceholderView.h
//  Pods
//
//  Created by Aaron_wk on 2018/9/8.
//

#import <UIKit/UIKit.h>

@class WKTableViewConfiguration;

@interface WKPlaceholderView : UIView

/** Description:配置信息 */
@property (strong, nonatomic) WKTableViewConfiguration *configuration;

/** Description:默认图片的X，默认为0 即为中心点 */
@property (assign, nonatomic) CGFloat placeholderImageX;
/** Description:默认图片的Y，默认为0 即为中心点 */
@property (assign, nonatomic) CGFloat placeholderImageY;


/**
 构造器方法
 
 @param frame frame
 @param configuration 配置信息
 @return 实例
 */
+ (instancetype)placeholderViewWithFrame:(CGRect)frame Configuration:(WKTableViewConfiguration *)configuration;


/**
 初始化方法

 @param frame frame
 @param configuration 配置信息
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame configuration:(WKTableViewConfiguration *)configuration;

@end
