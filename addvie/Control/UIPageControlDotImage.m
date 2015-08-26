//
//  UIPageControlDotImage.m
//  M1300K
//
//  Created by dev01 on 2015. 8. 10..
//  Copyright (c) 2015년 1300K. All rights reserved.
//

#import "UIPageControlDotImage.h"

@implementation UIPageControlDotImage


-(id) initWithCoder:(NSCoder *)aDecoder {
    
    if( self = [super initWithCoder:aDecoder] ) {

    }
    
    return self;
}


-(void) updateDots
{
    if( activeImage == nil ) {
        activeImage = [UIImage imageNamed:@"ic_footmenu_paging_on"] ;
    }
    
    if( inactiveImage == nil ) {
        inactiveImage = [UIImage imageNamed:@"ic_footmenu_paging_off"] ;
    }
    
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIImageView * dot = [self imageViewForSubview:  [self.subviews objectAtIndex: i]];
        if (i == self.currentPage) dot.image = activeImage;
        else dot.image = inactiveImage;
    }
}

- (UIImageView *) imageViewForSubview: (UIView *) view
{
    UIImageView * dot = nil;
    if ([view isKindOfClass: [UIView class]])
    {
        for (UIView* subview in view.subviews)
        {
            if ([subview isKindOfClass:[UIImageView class]])
            {
                dot = (UIImageView *)subview;
                break;
            }
        }
        if (dot == nil)
        {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            [view addSubview:dot];
        }
    }
    else
    {
        dot = (UIImageView *) view;
    }
    
    return dot;
}

-(void) setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    [self updateDots];
}

@end
