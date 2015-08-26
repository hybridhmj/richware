//
//  VCIntro.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 19..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "VCIntro.h"
#import "JustView.h"


@interface VCIntro ()

@property (strong, nonatomic) IBOutlet UIView *viContainer;
@property (strong, nonatomic) IBOutlet UIView *viCell;

@end

@implementation VCIntro

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = [_viContainer frame] ;
    
    NSLog(@" width :  %f , height : %f ",frame.size.width, frame.size.height) ;
    
    
    
    for (int i =0; i< 5; i ++) {
        
        NSLog(@"%d",i) ;
        
//        UIView *view = [[UIView alloc] init] ;
//        view = [_viCell copy];
        UIView *view = [[JustView alloc] initWithLoadXib] ;
        
        
        [_viContainer addSubview:view] ;
        
        view.translatesAutoresizingMaskIntoConstraints = NO ;
        
//        // 뷰 넓이는 컨테이너 넓이와 같게함
//        NSLayoutConstraint *constWidth = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:frame.size.width] ;
        
        // 뷰 상단을 컨테이너 상단에 맞춤
        NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_viContainer attribute:NSLayoutAttributeTop multiplier:1 constant:0] ;
        
        // 뷰 하단을 컨테이너 하단에 맞춤
        //    NSLayoutConstraint *constBottom = [NSLayoutConstraint constraintWithItem:_viCell attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_viContainer attribute:NSLayoutAttributeBottom multiplier:1 constant:0] ;
        
        NSLayoutConstraint *constHeight = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20.0f] ;
        
        NSLayoutConstraint *constright = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_viContainer attribute:NSLayoutAttributeRight multiplier:1 constant:0] ;
        
        NSLayoutConstraint *constleft = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_viContainer attribute:NSLayoutAttributeLeft multiplier:1 constant:0] ;
        
        NSLog(@"Check") ;
        
        if (i == 0) {
            // 뷰 상단을 컨테이너 상단에 맞춤
            constTop = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_viContainer attribute:NSLayoutAttributeTop multiplier:1 constant:0] ;
        } else {
            // 두번째 이후부터   전 뷰 아래로 위치
            constTop = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[_viContainer.subviews objectAtIndex:(i-1)] attribute:NSLayoutAttributeBottom multiplier:1 constant:0] ;
            
        }
        
        
        [view.superview addConstraint:constHeight] ;
        [view.superview addConstraint:constleft] ;
        [view.superview addConstraint:constright] ;
        [view.superview addConstraint:constTop] ;
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
