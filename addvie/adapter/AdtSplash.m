//
//  AdtSplash.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 25..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "AdtSplash.h"

@implementation AdtSplash

- (id)build:(id)data {
    
    UIListItem *item = [super build:data] ;
    
    item.identifier = @"Cellsplash" ;

    
    return item ;
}

@end
