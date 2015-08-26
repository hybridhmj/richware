//
//  UIListItem.h
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIListItem : NSObject

// Cell Identifier <- 동일한 이름의 Nib, Class를 호출
@property (strong, nonatomic) NSString *identifier ;

// Cell 높이
@property (nonatomic) CGFloat height ;

// 데이터
@property (strong, nonatomic) id data ;

// 추가 데이터
@property (strong, nonatomic) NSMutableDictionary *bundle ;

@end
