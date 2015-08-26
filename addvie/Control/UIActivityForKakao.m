//
//  UIActivityForKakao.m
//  M1300K
//
//  Created by dev01 on 2015. 8. 13..
//  Copyright (c) 2015년 1300K. All rights reserved.
//

#import "UIActivityForKakao.h"

@implementation UIActivityForKakao

- (NSString *)activityType
{
    return @"kakao.share";
}

- (NSString *)activityTitle
{
    return @"카카오톡";
}

- (UIImage *)activityImage
{
    // Note: These images need to have a tr3ansparent background and I recommend these sizes:
    // iPadShare@2x should be 126 px, iPadShare should be 53 px, iPhoneShare@2x should be 100
    // px, and iPhoneShare should be 50 px. I found these sizes to work for what I was making.
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return [UIImage imageNamed:@"ktalk53"];
    }
    else
    {
        return [UIImage imageNamed:@"ktalk50"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"%s", __FUNCTION__);
    
    _shareMsg = [activityItems objectAtIndex:0] ;
    
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"%s",__FUNCTION__);
}

- (UIViewController *)activityViewController
{
    NSLog(@"%s",__FUNCTION__);
    return nil;
}

- (void)performActivity
{
    // This is where you can do anything you want, and is the whole reason for creating a custom
    // UIActivity
    
//    NSString *kakaoLink = @"kakaolink://send?appkey=800034df48c3be6e41a999081f393a1e&appver=1.0&apiver=3.0&linkver=3.5&extras=%7B%22KA%22%3A%22sdk%2F1.0.45%20os%2Fjavascript%20lang%2Fko-kr%20device%2FiPhone%20origin%2Fhttp%253A%252F%252Fmts.1300k.com%22%7D&objs=%5B%7B%22objtype%22%3A%22label%22%2C%22text%22%3A%22Free%20Your%20Style!%20%EB%94%94%EC%9E%90%EC%9D%B8%EC%86%8C%ED%92%88%20%EC%87%BC%ED%95%91%EB%AA%B0%201300K%22%7D%2C%7B%22objtype%22%3A%22button%22%2C%22action%22%3A%7B%22type%22%3A%22web%22%2C%22url%22%3A%22http%3A%2F%2F1300k.com%2Findex.html%3Fdevice_type_id%3D101%22%7D%7D%5D&forwardable=false" ;
    
    NSString *kakaoLink = @"kakaolink://send?appkey=800034df48c3be6e41a999081f393a1e&appver=1.0&apiver=3.0&linkver=3.5&extras={\"KA\":\"sdk/1.0.45 os/javascript lang/ko-kr device/iPhone origin/http://mts.1300k.com\"}&objs=" ;

    NSLog(@"shareMsg : %@", _shareMsg) ;
    
    NSString *params = [NSString stringWithFormat:@"[{\"objtype\":\"label\",\"text\":\"%@\"}]&forwardable=false", _shareMsg] ;
    
    kakaoLink = [kakaoLink stringByAppendingString:params] ;
    
    kakaoLink = [kakaoLink stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ;
    
    NSURL *url = [NSURL URLWithString:kakaoLink];
    
    [[UIApplication sharedApplication] openURL:url] ;
    
    [self activityDidFinish:YES];
}

@end
