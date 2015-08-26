//
//  imageAction.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 25..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "imageAction.h"

@interface imageAction ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation imageAction

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) recognizer
{
    NSLog(@"이미지 클릭") ;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"gestureRecognizerShouldBegin") ;
    
    return YES ;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"shouldReceiveTouch") ;
    
    return YES;
    
}
- (IBAction)clicked:(id)sender {
    
    NSLog(@"tabp") ;
    
}

- (IBAction)longtab:(id)sender {
    NSLog(@"logntab");
}



@end
