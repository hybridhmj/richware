//
//  JustView.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 20..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "JustView.h"

@interface JustView()

@property (strong, nonatomic) IBOutlet UILabel *cachelabel;

@end

@implementation JustView

- (id)initWithLoadXib
{
    self=[super init] ;
    if(self)
    {
        self=[[[NSBundle mainBundle]loadNibNamed:@"JustView" owner:self options:nil] objectAtIndex:0];
    }
    
    
    //    [[NSURLCache sharedURLCache] removeAllCachedResponses ] ;
    NSInteger value = [[NSURLCache sharedURLCache] currentDiskUsage] ;
//    [[NSURLCache sharedURLCache] ] ;
    
    
    _cachelabel.text = [NSString stringWithFormat:@"%lu bytes",value] ;
    

    
    
    return self ;
}

@end
