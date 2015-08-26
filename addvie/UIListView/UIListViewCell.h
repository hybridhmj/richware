//
//  UIListViewCell.h
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import <UIKit/UIKit.h>
#import "UIListView.h"
#import "UIListItem.h"

@interface UIListViewCell : UITableViewCell

@property (strong, nonatomic) UIListItem *currentItem ;
@property (strong, nonatomic) id currentListView ;

// 뷰를 갱신
- (void)invalidate:(id) listView item:(id) item ;

@end
