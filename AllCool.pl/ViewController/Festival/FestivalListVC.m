//
//  FestivalListVC.m
//  AllCool.pl
//
//  Created by Sanjay on 08/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FestivalListVC.h"

@interface FestivalListVC ()
{
    IBOutlet UITableView *tableList;
    IBOutlet UIButton *btnRight;
    IBOutlet UIButton *btnLeft;
    IBOutlet UIView *viewUpButtons;
    
    int tag;
    
    NSArray *arrFest, *arrNewFest, *arrOldFest;
}
@end

@implementation FestivalListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.title.text = @"Festiwale piwne";
    
    viewUpButtons.layer.borderColor = APP_COLOR_RED.CGColor;
    viewUpButtons.layer.borderWidth = 1;
    
    tag =1;
    
    [self get_New_Festival];
    [self get_Old_Festival];
    
    [tableList reloadData];

}

-(void) get_New_Festival
{
    // http://allcool.pl/api_ios/festival/new_in_festival.php
    
    SVHUD_START
    [WebServiceCalls GET:@"festival/new_in_festival.php" parameter:nil completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         NSLog(@"%@", JSON);
         
         @try
         {
             if ([JSON[@"success"] integerValue] == 1)
             {
                 arrNewFest = JSON[@"festivals"];
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

-(void) get_Old_Festival
{
    // http://allcool.pl/api_ios/festival/out_festival.php
    
    SVHUD_START
    [WebServiceCalls GET:@"festival/out_festival.php" parameter:nil completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         NSLog(@"%@", JSON);
         
         @try
         {
             if ([JSON[@"success"] integerValue] == 1)
             {
                 arrOldFest = JSON[@"festivals"];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)tapButtons:(UIButton *)sender {
    
    btnLeft.backgroundColor = CLEAR_COLOR;
    btnRight.backgroundColor = CLEAR_COLOR;
    [btnRight setTitleColor:APP_COLOR_RED forState:UIControlStateNormal];
    [btnLeft setTitleColor:APP_COLOR_RED forState:UIControlStateNormal];
   
    sender.backgroundColor = APP_COLOR_RED;
    [sender setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
  
    tag = (int)sender.tag;
    [tableList reloadData];
}

#pragma mark Table

-(CGFloat)tableView:(UITableView* )tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tag == 1)
    {
        return 3;
    }
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Cells" owner:self options:nil]objectAtIndex:2];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FestivalViewVC *obj = [storybord instantiateViewControllerWithIdentifier:@"FestivalViewVC"];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
