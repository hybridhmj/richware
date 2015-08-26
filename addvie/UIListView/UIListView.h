//
//  UIListView.h
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import <UIKit/UIKit.h>
#import "UIListAdapter.h"
#import "UIListItem.h"
#import "UIListViewCell.h"

@interface UIListView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) BOOL morePage ;
@property (nonatomic) BOOL blockMaxScroll ;

// 아답터 설정
- (void)setAdapter:(id) adapter ;

//델리게이트 연결
-(void)setListDelegate:(id)newDelegate ;

//셀과 리스트뷰간 이벤트 전달
-(void)dispatchEventWithName:(NSString *)name data:(id) data ;

@end

@interface UIListViewEvent : NSObject

@property (strong, nonatomic) NSString *name ;
@property (strong, nonatomic) id data ;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@protocol UIListViewDelegate <NSObject>
@optional

- (void)listView:(id)listView itemOfSelect:(id) item indexOfSelect:(NSInteger) index ;

- (void)listView:(id)listView dispatchEvent:(UIListViewEvent *) event ;

- (void)maxScrollOfListView:(id)listView ;

@end