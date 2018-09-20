//
//  WKTableViewConfiguration.h
//  Pods-WKTableView_Example
//
//  Created by Aaron_wk on 2018/9/8.
//


/**
 WKTableView风格

 - WKTableViewPlaceholderViewStyleNone: 默认跟随tableview一起滚动
 - WKTableViewScrollViewFollow: WKTableViewPlaceholderViewStyleNone
 - WKTableViewScrollViewAllow: 默认图不跟随tableview滚动
 - WKTableViewScrollViewRefused: 禁止任何滚动
 */
typedef NS_ENUM(NSUInteger, WKTableViewPlaceholderViewStyle) {
    WKTableViewPlaceholderViewStyleNone,
    WKTableViewScrollViewFollow,
    WKTableViewScrollViewAllow,
    WKTableViewScrollViewRefused,
};

#import <Foundation/Foundation.h>

@interface WKTableViewConfiguration : NSObject

// placehoder -> ph

/** Description:默认图片 类型：UIImage/NSString */
@property (assign, nonatomic) id placeholderImage;

/** Description:默认文本 */
@property (copy, nonatomic) NSString *placeholderText;

/** Description:文本颜色 */
@property (strong, nonatomic) UIColor *phTextColor;

/** Description:字号 */
@property (strong, nonatomic) UIFont *phTextFont;


/** Description:WKTableView风格 */
@property (assign, nonatomic) WKTableViewPlaceholderViewStyle placeholderViewStyle;


@end
