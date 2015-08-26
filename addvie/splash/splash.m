//
//  splash.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 24..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "splash.h"
#import "AdtSplash.h"


@interface splash ()
@property (strong, nonatomic) IBOutlet UIListView *lvsplash;

@property (strong, nonatomic) AdtSplash *adapater ;

@end

@implementation splash

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _adapater = [AdtSplash new] ;
    [_lvsplash setAdapter:_adapater] ;
    [_lvsplash setListDelegate:self] ;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) callList
{
    [_adapater clear] ;
    
    
    NSMutableArray *imageArr = [[NSMutableArray alloc] init] ;
    
    
    for (NSInteger i = 1; i < 7; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"loading_%ld",i] ;
        
        UIImage *img = [UIImage imageNamed:imageName] ;
        
        [imageArr addObject:img] ;
        
    }
    
    [_adapater addDatas:imageArr reload:YES] ;
    
    
}


@end
