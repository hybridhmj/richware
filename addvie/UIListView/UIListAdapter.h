//
//  UIListAdapter.h
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import <Foundation/Foundation.h>
#import "UIListView.h"
#import "UIListItem.h"
#import "UIListViewCell.h"

@interface UIListAdapter : NSObject

// 리스트뷰 설정
- (void)setListView:(id) listView ;

// 리스트아이템 생성
- (id)build:(id) data ;

// 바인딩할 데이터 추가 -> 내부에서 build를 호출 -> UIListView datareload
- (void)addDatas:(NSArray*) datas reload:(BOOL) reload;
- (void)addData:(id) data reload:(BOOL) reload;

- (void)updateData:(id) data atIndex:(NSInteger) index ;
- (void)updateItem:(id) item atIndex:(NSInteger) index ;

// 데이터 제거
- (void)clear ;

// 바인딩 된 수
- (NSInteger) count ;

// 아이템 반환
- (id) getItem:(NSInteger) position ;

@end
