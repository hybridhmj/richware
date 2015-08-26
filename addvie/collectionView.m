//
//  collectionView.m
//  addvie
//
//  Created by Dev.lee on 2015. 8. 21..
//  Copyright (c) 2015년 Bean. All rights reserved.
//

#import "collectionView.h"
#import "collectionViewCell.h"

@interface collectionView ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataList;

@end

@implementation collectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = [[NSMutableArray alloc] init] ;
    [_collectionView setAllowsMultipleSelection:YES] ;
    
    UINib *nib = [UINib nibWithNibName:@"collectionViewCell" bundle:nil] ;
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"collectionViewCell"] ;
    
    [self dataUpdate] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - collection

// 1. Highlight
//오버 되었을 때 강조를 할지 여부를// 생략할 경우 항상 YES이다
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES ;
}

// Highlight를 YES 된 인덱스를 잡아서 효과를 어떻게 줄지 하는 델리게이트
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = [UIColor cyanColor].CGColor;
    cell.layer.borderWidth = 3.0f;
    
}

// Highlight가 해제되는 시점에 적용 할 델리게이트
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = nil;
    cell.layer.borderWidth = 0.0f;
}



//2. Select
//특성 셀이 선택 되어야하는지 컨트롤 하는 델리게이트
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES ;
}

//셀이 선택 되었을때 이때  selected는 YES가 된 상태이다. 선택된 상태의 효과를 여기서 준다.
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    //row가 흔히 생각하는  index이다.
    NSLog(@"indexPath row : %ld",indexPath.row) ;

    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = [UIColor yellowColor].CGColor;
    cell.layer.borderWidth = 5.0f;
    
}




//3. 선택된 셀을 또 선택했을 경우 델리게이트
// 선택된 특성 셀이 해제 되어야 하는지 여부(안하면 항상 yes)
-(BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES ;
}

// 선택 해제 됐을 때 효과(selected 값이 NO가 된다.)
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
        NSLog(@"deselected indexPath row : %ld",indexPath.row) ;
    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = nil;
    cell.layer.borderWidth = 0.0f;
    
}



#pragma mark - UICollectionViewDataSource


//데이터 수
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"numberOfItemsInSection") ;
    
//        return [self.dataList[section] count] ;
    return [self.dataList count] ;
}

//섹션 갯수
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"numberOfSectionsInCollectionView") ;
//    return [self.dataList count] ;
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    collectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath] ;
    
    NSString *data = [_dataList objectAtIndex:[indexPath row]] ;
    
    NSLog(@" data : %@", data) ;
    
    [cell.lb setText:data];
    
    return cell;
}

//셀의 크기
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat w = (_collectionView.frame.size.width - 2.0f) / 3.0f ;
    CGFloat h = 70.0f ;
    
    return CGSizeMake(w, h);
}


////////===============================
-(void) dataUpdate
{
    [self.dataList removeAllObjects] ;
    
    for (NSInteger i =0; i<100; i++) {
        
        NSString *numberi = [[NSString alloc] initWithFormat:@"i : %ld", i] ;
        [self.dataList addObject:numberi] ;
        
    }
    
    NSLog(@"dataUpdate") ;
    [self.collectionView reloadData] ;
}



-(void) onAdd
{
    NSString *back = @"<";
    [self.dataList[0] addObject:back];
    NSIndexPath* indexPath = [NSIndexPath indexPathForItem:[self.dataList[0] count] - 1 inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    

}
@end
