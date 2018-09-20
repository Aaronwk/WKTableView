//
//  WKPlaceholderView.m
//  Pods
//
//  Created by Aaron_wk on 2018/9/8.
//

#import "WKPlaceholderView.h"
#import "WKTableViewConfiguration.h"
#import "UIView+WKExtension.h"

@interface WKPlaceholderView () {
    
}

/** Description:PlaceholderImageView */
@property (strong, nonatomic) UIImageView *placeholderImageView;

/** Description:提示文字 */
@property (strong, nonatomic) UILabel *placeholderText;

@end

@implementation WKPlaceholderView

/**
 构造器方法

 @param frame frame
 @param configuration 配置信息
 @return 实例对象
 */
+ (instancetype)placeholderViewWithFrame:(CGRect)frame Configuration:(WKTableViewConfiguration *)configuration {
    WKPlaceholderView *placeholderView = [[self alloc] initWithFrame:frame];
    placeholderView.configuration = configuration;
    return placeholderView;
}


/**
 初始化方法
 
 @param frame frame
 @param configuration 配置信息
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame configuration:(WKTableViewConfiguration *)configuration
{
    self = [super initWithFrame:frame];
    if (self) {
        _configuration = configuration;
        [self initialization];
        [self setupMainView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
        [self setupMainView];
    }
    return self;
}

- (void)initialization {
    self.placeholderImageX = 0;
    self.placeholderImageY = 0;
    self.placeholderImageView.backgroundColor = [UIColor redColor];
}

- (void)setupMainView {
    [self addSubview:self.placeholderImageView];
    [self layoutSubviewsWithFrame:self.frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}


- (void)layoutSubviewsWithFrame:(CGRect)frame {
    UIImage *image = self.placeholderImageView.image;
    CGSize img_size = image.size;
    CGFloat imgv_w = image?img_size.width:self.wk_size.width - 100;
    CGFloat imgv_h = imgv_w;
    CGFloat imgv_x = self.center.x - imgv_w / 2 + _placeholderImageX;
    CGFloat imgv_y = self.center.y - imgv_h / 2 + _placeholderImageY;
    [self.placeholderImageView setFrame:CGRectMake(imgv_x, imgv_y, imgv_w, imgv_h)];
}

- (void)setPlaceholderImageY:(CGFloat)placeholderImageY {
    _placeholderImageY = placeholderImageY;
    [self layoutSubviewsWithFrame:self.frame];
}

- (void)setPlaceholderImageX:(CGFloat)placeholderImageX {
    _placeholderImageX = placeholderImageX;
    [self layoutSubviewsWithFrame:self.frame];
}

- (UILabel *)placeholderText {
    if(!_placeholderText) {
        _placeholderText = [[UILabel alloc] init];
        _placeholderText.text = _configuration.placeholderText;
    }
    return _placeholderText;
}

- (UIImageView *)placeholderImageView {
    if(!_placeholderImageView) {
        _placeholderImageView = [[UIImageView alloc] init];
        _placeholderImageView.image = _configuration.placeholderImage;
    }
    return _placeholderImageView;
}

@end
