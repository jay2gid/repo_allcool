//
//  FestivalViewVC.m
//  AllCool.pl
//
//  Created by Upendra Singh Shekhawat on 25/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FestivalViewVC.h"
#import "ExibitorTVCell.h"
#import "ProgramTVCell.h"
#import "RatingTVCell.h"
#import "CategoryTVCell.h"

@interface FestivalViewVC ()

@end

@implementation FestivalViewVC
{
    NSArray *arrImgSelected, *arrImgDefault, *arrImgName, *arrLblName;
    
    NSInteger tag;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.title.text = @"Allcool.pl";

    
    viewStar.rating = 4;
    
    btnCall.layer.borderWidth = 1;
    btnCall.layer.borderColor = [[UIColor colorWithRed:102/255.0 green:192/255.0 blue:78/255.0 alpha:1]  CGColor];
    
    btnCall.layer.cornerRadius = 5;
    btnCall.layer.masksToBounds = YES;
    
    arrImgDefault = @[@"exibitors_unselect.png", @"program_unselect.png", @"map_unselect.png", @"rating_unselect.png", @"category_unselect.png"];
    arrImgSelected = @[@"exibitors_select.png", @"program_select.png", @"map_select.png", @"rating_select.png", @"category_select.png"];
    
    arrImgName = @[imgExibitors, imgProg, imgMap, imgRating, imgCategory];
    arrLblName = @[lblExibitors, lblProg, lblMap, lblRating, lblCategory];
    
    imgMapPreiew.hidden = YES;
    
    tag = 0;
    [tblViewFest reloadData];
}

- (IBAction)tabBtnClk:(UIButton *)sender
{
    tag = sender.tag;
    
    for (int i=0; i<5; i++)
    {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView = arrImgName[i];
        imgView.image = [UIImage imageNamed:arrImgDefault[i]];
        
        UILabel *lbl = [[UILabel alloc] init];
        lbl = arrLblName[i];
        lbl.textColor = [UIColor darkGrayColor];
    }
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView = arrImgName[sender.tag];
    imgView.image = [UIImage imageNamed:arrImgSelected[sender.tag]];
    
    UILabel *lbl = [[UILabel alloc] init];
    lbl = arrLblName[sender.tag];
    lbl.textColor = [UIColor colorWithRed:171/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    
    if (sender.tag == 2)
    {
        imgMapPreiew.hidden = NO;
        tblViewFest.hidden = YES;
    }
    else
    {
        imgMapPreiew.hidden = YES;
        tblViewFest.hidden = NO;
        
        [tblViewFest reloadData];
    }
}

#pragma mark Table

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tag == 0)
    {
        return 60.0;
    }
    else if (tag == 1)
    {
        return 50.0;
    }
    else if (tag == 3)
    {
        return 65.0;
    }
    else
    {
        return 45.0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tag+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tag == 0 || tag == 1)
    {
        UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FestCell" owner:self options:nil]objectAtIndex:tag];
        
        return cell;
    }
    else if (tag == 3)
    {
        RatingTVCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FestCell" owner:self options:nil]objectAtIndex:2];
        
        cell.viewStar.rating = indexPath.row;
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FestCell" owner:self options:nil]objectAtIndex:3];
        
        return cell;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
