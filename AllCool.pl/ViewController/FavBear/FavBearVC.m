//
//  FavBearVC.m
//  AllCool.pl
//
//  Created by Sanjay on 07/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FavBearVC.h"
#import "BotalVC.h"
#import "BearCell.h"
#import "ViewAddDodaj.h"
@interface FavBearVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation FavBearVC
{
    NSArray *arrBeer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.title.text = @"Ulubione piwa";
    
    [self get_Data];
}

-(void) get_Data
{
    // http://allcool.pl/api_ios/wishlist_favourite_record_beer.php
    
    SVHUD_START
    [WebServiceCalls GET:@"wishlist_favourite_record_beer.php" parameter:nil completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         NSLog(@"%@", JSON);
         
         @try
         {
             if ([JSON[@"success"] integerValue] == 1)
             {
                 arrBeer = JSON[@"festivals"];
             }
             else
             {
                 [WebServiceCalls alert:@"Unable to fetch data. try again"];
             }
         }
         @catch (NSException *exception)
         {
         }
         @finally
         {
         }
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table

-(CGFloat)tableView:(UITableView* )tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BearCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Cells" owner:self options:nil]objectAtIndex:0];
    
    cell.btnDaduj.tag = indexPath.row;
    [cell.btnDaduj addTarget:self action:@selector(methodDauj:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BotalVC *OBJ = [self.storyboard instantiateViewControllerWithIdentifier:@"BotalVC"];
    [self.navigationController pushViewController:OBJ animated:YES];
}

-(void)methodDauj:(UIButton*)sender
{
    ViewAddDodaj *view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil]objectAtIndex:0];
    [self.view addSubview:view];
}

@end
