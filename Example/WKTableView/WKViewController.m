//
//  WKViewController.m
//  WKTableView
//
//  Created by objective on 09/08/2018.
//  Copyright (c) 2018 objective. All rights reserved.
//

#import "WKViewController.h"
#import "WKTableViewKit.h"

@interface WKViewController ()<WKTableViewDataSource>

/** Description:WKTableView */
//@property (strong, nonatomic) WKTableView *tableView;
@property (weak, nonatomic) IBOutlet WKTableView *tableView;

@end

@implementation WKViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.wk_dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [_tableView configurationPlaceholderView:nil];
}



- (NSInteger)wk_tableView:(WKTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)wk_tableView:(WKTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
