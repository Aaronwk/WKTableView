//
//  UIView+WKExtension.h
//  Pods
//
//  Created by Aaron_wk on 2018/9/8.
//

#import <UIKit/UIKit.h>

@interface UIView (WKExtension)

@property (assign, nonatomic) CGFloat wk_x;
@property (assign, nonatomic) CGFloat wk_y;
@property (assign, nonatomic) CGFloat wk_w;
@property (assign, nonatomic) CGFloat wk_h;
@property (assign, nonatomic) CGPoint wk_center;
@property (assign, nonatomic) CGPoint wk_origin;
@property (assign, nonatomic) CGSize wk_size;

@end
