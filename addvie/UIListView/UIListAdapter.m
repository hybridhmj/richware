//
//  UIListAdapter.m
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import "UIListAdapter.h"

@implementation UIListAdapter
{
    UIListView* _listView ;
    NSMutableArray *_dataProvider ;
}

-(instancetype)init
{
    if( self = [super init] ) {
                
        _dataProvider = [[NSMutableArray alloc]init] ;
        
    }
    
    return self ;
}

- (void)setListView:(UIListView*) listView
{
    _listView = listView ;
}

- (void)clear {
    [_dataProvider removeAllObjects] ;
    [_listView reloadData] ;
}

- (NSInteger)count {
    return _dataProvider.count ;
}

- (UIListItem*)build:(id) data {
    
    UIListItem *item = [[UIListItem alloc]init] ;
    item.identifier = @"CellIdentifier" ;
    item.height = 40.0f ;
    item.data = data ;
    item.bundle = nil ;
    
    return item ;
}

- (void) addItem:(id) item {
    [_dataProvider addObject:item] ;
}

- (UIListItem*) getItem:(NSInteger) position {
    return [_dataProvider objectAtIndex:position] ;
}

- (void)updateItem:(id) item atIndex:(NSInteger) index {
    [_dataProvider replaceObjectAtIndex:index withObject:item] ;
}

- (void)addDatas:(NSArray*) datas reload:(BOOL) reload {
    for( int32_t i = 0 ; i < datas.count ; i++ ) {
        [self addItem:[self build:[datas objectAtIndex:i]]] ;
    }
    
    if( reload )
        [_listView reloadData] ;
}

- (void)addData:(id) data reload:(BOOL) reload {
    
    NSArray *datas = [NSArray arrayWithObject:data] ;
    [self addDatas:datas reload:reload];
}

- (void)updateData:(id) data atIndex:(NSInteger) index {
    
    UIListItem *item = [self getItem:index] ;
    item.data = data ;
    
    [self updateItem:item atIndex:index] ;
}

@end
