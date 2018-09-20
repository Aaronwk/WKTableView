//
//  WKTableViewConfiguration.m
//  Pods-WKTableView_Example
//
//  Created by Aaron_wk on 2018/9/8.
//

#import "WKTableViewConfiguration.h"
#import <UIKit/UIKit.h>

@implementation WKTableViewConfiguration

- (instancetype)init
{
    self = [super init];
    if (self) {
        _placeholderText = @"暂无内容";
        _phTextColor = [UIColor grayColor];
        _phTextFont = [UIFont systemFontOfSize:15];
    }
    return self;
}




- (void)setPlaceholderImage:(id)placeholderImage {
    if(placeholderImage != nil) {
        if([placeholderImage isKindOfClass:[NSString class]]) {
            _placeholderImage = [UIImage imageNamed:placeholderImage];
        }else{
            _placeholderImage = placeholderImage;
        }
    }else{
        NSLog(@"error:图片不能传空类型");
    }
}


@end
