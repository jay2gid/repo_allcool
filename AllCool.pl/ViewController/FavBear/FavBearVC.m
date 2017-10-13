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
    NSDictionary *dict = @{@"uid":UserID};
    
    [WebServiceCalls POST:@"wishlist_favourite_record_beer.php" parameter:dict completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         NSLog(@"%@", JSON);
         
         @try
         {
             if ([JSON[@"success"] integerValue] == 1)
             {
                 arrBeer = JSON[@"beer_details"];
                 [tblViewBeer reloadData];
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
    return arrBeer.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BearCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Cells" owner:self options:nil]objectAtIndex:0];
    
    cell.btnDaduj.tag = indexPath.row;
    
    [cell.imgBeerLogo sd_setImageWithURL:[NSURL URLWithString:arrBeer[indexPath.row][@"image"]] placeholderImage:[UIImage imageNamed:@"noimage.jpg"]];
    
    cell.lblTitle.text = arrBeer[indexPath.row][@"title"];
    
    NSInteger star_count = [arrBeer[indexPath.row][@"Avg_rating"] integerValue];
    cell.viewStarRating.rating = star_count;
    
    cell.lbl_IBU_ABV_BLG.text = [NSString stringWithFormat:@"IBU %@ | ABV %@ | BLG %@", arrBeer[indexPath.row][@"ibu"], arrBeer[indexPath.row][@"alcohole_per"], arrBeer[indexPath.row][@"ekstrakt"]];
    
    [cell.btnDaduj addTarget:self action:@selector(methodDauj:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnDaduj.tag = indexPath.row;
    [cell.btnNottaki addTarget:self action:@selector(methodNottaki:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnNottaki.tag = indexPath.row;
    
    [cell.btnKasuj addTarget:self action:@selector(methodKasuj:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnKasuj.tag = indexPath.row;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BotalVC *OBJ = [self.storyboard instantiateViewControllerWithIdentifier:@"BotalVC"];
    OBJ.dictBeer = arrBeer[indexPath.row];
    [self.navigationController pushViewController:OBJ animated:YES];
}

-(void)methodDauj:(UIButton*)sender
{
    ViewAddDodaj *view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil]objectAtIndex:0];
    view.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:view];
}

-(void)methodNottaki:(UIButton *)sender
{
    ViewNotesList *obj = [[[NSBundle mainBundle] loadNibNamed:@"ViewNotesList" owner:self options:nil] objectAtIndex:0];
    obj.selfBack = self;
    [self.view addSubview:obj];
}

-(void)methodKasuj:(UIButton *)sender
{
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"Sure want to delete from list" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                   
                                    
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"No"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   // What we write here????????**
                                   // api shoud b there
                               }];
   
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
