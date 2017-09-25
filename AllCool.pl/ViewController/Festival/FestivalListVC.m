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
