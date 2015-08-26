//
//  UIListView.m
//  UIListView
//
//  Created by Sejin Jang on 2015. 4. 14..
//
//

#import "UIListView.h"

@implementation UIListView
{
    UIListAdapter *_adapter ;
    UIViewController *_owner ;
    
    __weak id __delegate;
}

-(void) setListDelegate:(id)newDelegate
{
    dispatch_block_t block = ^{
        __delegate = newDelegate;
        
        _blockMaxScroll = NO ;
        _morePage = YES ;
    };
    
    block();
}

- (void)setAdapter:(id) adapter {
    
    _adapter = adapter ;
    [_adapter setListView:self] ;
    
    if( _owner == nil ) {
        
        UIResponder *responder = self;
        while (![responder isKindOfClass:[UIViewController class]]) {
            responder = [responder nextResponder];
            if (nil == responder) {
                break;
            }
        }
        
        _owner = (UIViewController*) responder ;
        
        self.delegate = self ;
        self.dataSource = self ;

    }
    
}

-(void)dispatchEventWithName:(NSString *)name data:(id) data {
    
    if( __delegate && [__delegate respondsToSelector:@selector(listView:dispatchEvent:)] ) {
        
        UIListViewEvent *event = [UIListViewEvent new] ;
        event.name = name ;
        event.data = data ;
        
        [__delegate performSelector:@selector(listView:dispatchEvent:) withObject:self withObject:event] ;
    }
    
}


#pragma mark
#pragma mark UITableView Delegate

// Cell 높이 실연산
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger position = indexPath.row;
    
    UIListItem* item = [_adapter getItem:position] ;
    CGFloat height = item.height ;

    return height;
}

// TableView List Count
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_adapter count] ;
    
}

// TableView Cell을 획득
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger position = indexPath.row;
    
    UIListItem* item = [_adapter getItem:position] ;
    NSString* cellIdentifier = item.identifier ;
    
    UIListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
    
    if( cell == nil ) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellIdentifier owner:_owner options:nil]firstObject] ;
        //[cell setAdapter:self] ;
    }
    
    [cell invalidate:self item:item] ;
    
    //NSLog(@"Table [ %d ] get cell at %d", tableView.tag, position) ;
    
    return cell ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger index = indexPath.row ;
    
    if( __delegate && [__delegate respondsToSelector:@selector(listView:itemOfSelect:indexOfSelect:)])
        [__delegate listView:self itemOfSelect:[_adapter getItem:index] indexOfSelect:index] ;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

//최대 스크롤
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    
//    NSLog(@"scroll") ;
    
    if (aScrollView.frame.size.height > aScrollView.contentSize.height) {
        return ;
    }
    
    if (!_morePage || _blockMaxScroll) {
        return ;
    }
    
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    // NSLog(@"offset: %f", offset.y);
    // NSLog(@"content.height: %f", size.height);
    // NSLog(@"bounds.height: %f", bounds.size.height);
    // NSLog(@"inset.top: %f", inset.top);
    // NSLog(@"inset.bottom: %f", inset.bottom);
    // NSLog(@"pos: %f of %f", y, h);
    
    float reload_distance = 10;
    
    if(y > h + reload_distance) {
        
        _blockMaxScroll = YES ;
        
        if( __delegate && [__delegate respondsToSelector:@selector(maxScrollOfListView:)] ) {
            [__delegate performSelector:@selector(maxScrollOfListView:) withObject:self] ;
        }
        
    }
}

@end

@implementation UIListViewEvent


@end
