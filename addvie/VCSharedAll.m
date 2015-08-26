//
//  VCSharedAll.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 21..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "VCSharedAll.h"
#import "UIActivityForKakao.h"

@interface VCSharedAll ()

@end

@implementation VCSharedAll

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedShared:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:Log object:nil] ;
    
    
//    NSString *msg = @"kakao";
//    
//    NSMutableArray *sharingItems = [NSMutableArray new];
//    
//    [sharingItems addObject:msg] ;
//    
//    UIActivityForKakao *kakaoShare = [UIActivityForKakao new] ;
//    
//    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:@[kakaoShare]] ;
//    
//    [self presentViewController:activityController animated:YES completion:nil] ;
    
}


@end
