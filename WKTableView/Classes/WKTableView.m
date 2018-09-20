//
//  WKTableView.m
//  Pods-WKTableView_Example
//
//  Created by Aaron_wk on 2018/9/8.
//

#import "WKTableView.h"
#import "WKPlaceholderView.h"
#import "WKTableViewConfiguration.h"

@interface WKTableView ()<UITableViewDataSource>

@end

@implementation WKTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if(self) {
        
        [self initialization];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
}

- (void)initialization {
    self.dataSource = self;
}

- (void)configurationPlaceholderView:(WKTableViewConfiguration *)configuration {
    WKPlaceholderView *placeholderView = [WKPlaceholderView placeholderViewWithFrame:self.bounds Configuration:configuration];
    _placeholderView = placeholderView;
    switch (configuration.placeholderViewStyle) {
            
        case WKTableViewPlaceholderViewStyleNone:
        case WKTableViewScrollViewFollow:
            [self setBackgroundView:_placeholderView];
            break;
        case WKTableViewScrollViewAllow:
        {
            
        }
            break;
        case WKTableViewScrollViewRefused:
        {
            
        }
            break;
            
        default:
            [self setBackgroundView:_placeholderView];
            break;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger rows = [self.wk_dataSource wk_tableView:self numberOfRowsInSection:section];
    if(rows < 1 && section < 1) {
         _placeholderView.hidden = NO;
    }else{
        _placeholderView.hidden = YES;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.wk_dataSource wk_tableView:self cellForRowAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if([self.wk_dataSource respondsToSelector:@selector(wk_numberOfSectionsInTableView:)]) {
        return [self.wk_dataSource wk_numberOfSectionsInTableView:self];
    }
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:titleForHeaderInSection:)]) {
        return [self.wk_dataSource wk_tableView:self titleForHeaderInSection:section];
    }
    return nil;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:titleForFooterInSection:)]) {
        return [self.wk_dataSource wk_tableView:self titleForFooterInSection:section];
    }
    return nil;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:canEditRowAtIndexPath:)]) {
        return [self.wk_dataSource wk_tableView:self canEditRowAtIndexPath:indexPath];
    }
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:canMoveRowAtIndexPath:)]) {
        return [self.wk_dataSource wk_tableView:self canMoveRowAtIndexPath:indexPath];
    }
    return NO;
}


- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if([self.wk_dataSource respondsToSelector:@selector(wk_sectionIndexTitlesForTableView:)]) {
        return [self.wk_dataSource wk_sectionIndexTitlesForTableView:self];
    }
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:sectionForSectionIndexTitle:atIndex:)]) {
        return [self.wk_dataSource wk_tableView:self sectionForSectionIndexTitle:title atIndex:index];
    }
    return 0;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:commitEditingStyle:forRowAtIndexPath:)]) {
        [self.wk_dataSource wk_tableView:self commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if([self.wk_dataSource respondsToSelector:@selector(wk_tableView:moveRowAtIndexPath:toIndexPath:)]) {
        [self.wk_dataSource wk_tableView:self moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    }
}


@end
