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

- (BOOL)hasMoreDataForPagination:(NSDictionary*)responseObject;

- (UIScrollView*)scrollViewForPagination;

- (NSInteger)currentPageForPagination;

- (NSMutableArray*)dataArrayForPagination;

- (void)didPaginationIncrementPage;

@end

#endif /* EDProtocol_h */
