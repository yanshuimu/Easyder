//
//  EDProtocol.h
//  Easyder
//
//  Created by mac on 2021/1/14.
//

#ifndef EDProtocol_h
#define EDProtocol_h

#import <UIKit/UIKit.h>

@protocol EDPaginationDelegate <NSObject>

/**
 * 是否有更多数据
 */
- (BOOL)hasMoreDataForPagination:(NSDictionary*)responseObject;

/**
 * 列表控件
 */
- (UIScrollView*)scrollViewForPagination;

/**
 * 当前页
 */
- (NSInteger)currentPageForPagination;

/**
 * 存放数据数组
 */
- (NSMutableArray*)dataArrayForPagination;

/**
 * 页数增长
 */
- (void)incrementPageForPagination;

@end

#endif /* EDProtocol_h */
