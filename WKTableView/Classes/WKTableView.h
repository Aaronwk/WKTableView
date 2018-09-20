//
//  WKTableView.h
//  Pods-WKTableView_Example
//
//  Created by Aaron_wk on 2018/9/8.
//

#import <UIKit/UIKit.h>

@class WKTableView;

@protocol WKTableViewDataSource <NSObject, UITableViewDelegate>


@required

- (NSInteger)wk_tableView:(WKTableView *)tableView numberOfRowsInSection:(NSInteger)section;

/** Description:
 * 行显示。实现者应该总是通过设置每个单元格的reuseIdentifier和使用dequeueReusableCellWithIdentifier查询可用的可重用单元格来尝试重用单元格:
 * 单元格根据表(分隔符)和数据源(附属视图、编辑控件)自动设置各种属性
 */
- (UITableViewCell *)wk_tableView:(WKTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

/** Description:如果没有实现，默认值为1 */
- (NSInteger)wk_numberOfSectionsInTableView:(WKTableView *)tableView;

/** Description:
 * 固定的字体样式。如果你想要一些不同的东西，使用自定义视图(UILabel)
 */
- (nullable NSString *)wk_tableView:(WKTableView *)tableView titleForHeaderInSection:(NSInteger)section;
- (nullable NSString *)wk_tableView:(WKTableView *)tableView titleForFooterInSection:(NSInteger)section;

/** Description: 编辑
 * 单个行可以选择不为它们设置-editing属性。如果没有实现，则假定所有行都是可编辑的。
 */
- (BOOL)wk_tableView:(WKTableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;

/** Description: 移动/重新排序
 * 允许为特定行显示重排附属视图。默认情况下，只有当数据源实现-tableView:moveRowAtIndexPath:toIndexPath:
 */
- (BOOL)wk_tableView:(WKTableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;


/** Description:Index
 * 返回要在节索引视图中显示的节标题列表(例如。“ABCD…Z #”)
 */
- (nullable NSArray<NSString *> *)wk_sectionIndexTitlesForTableView:(UITableView *)tableView;

/** Description:
 * 告诉表哪个节对应于节标题/索引(例如。“B”,1))
 */
- (NSInteger)wk_tableView:(WKTableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;

/** Description:
 * 数据操作-插入和删除支持
 * 在调用了减号或加号按钮(基于单元格的UITableViewCellEditingStyle)之后，数据源必须提交更改
 * 没有使用UITableViewRowAction调用编辑操作——操作的处理程序将被调用
 */
- (void)wk_tableView:(WKTableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;


/** Description:
 * 数据操作-重新排序/移动支持
 */
- (void)wk_tableView:(WKTableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end


@class WKPlaceholderView;
@class WKTableViewConfiguration;

@interface WKTableView : UITableView

/** Description:Delegate */
@property (assign, nonatomic) id<WKTableViewDataSource> wk_dataSource;

/** Description:占位图 */
@property (strong, nonatomic) WKPlaceholderView *placeholderView;


/**
 配置信息

 @param configuration 配置信息
 */
- (void)configurationPlaceholderView:(WKTableViewConfiguration *)configuration;

@end
