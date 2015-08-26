//
//  UIListViewCell.m
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import "UIListViewCell.h"

@implementation UIListViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)invalidate:(UIListView*) listView item:(UIListItem*) item {

    _currentListView = listView ;
    _currentItem = item ;
    
}

@end
