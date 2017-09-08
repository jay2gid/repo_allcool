//
//  FavListVC.m
//  AllCool.pl
//
//  Created by Sanjay on 08/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FavListVC.h"

@interface FavListVC ()
{
    IBOutlet UIButton *btn;
    IBOutlet UIScrollView *scrollData;
}

@end

@implementation FavListVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.title.text = @"Inne Listy";
    
    [self loadData];
    scrollData.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = APP_COLOR_RED.CGColor;
    btn.layer.cornerRadius = 2;
}

-(void)loadData
{
    NSArray *arrayImegs = @[@"listbeertaste",@"listpubvisit",@"listbrewery",@"listfavbrewer",@"listfestival",@"listpubvisit",@"listvisitfestvial",@"listcustom"];
    
    // NSArray *arrTitles;
    
    for (int i = 0; i<arrayImegs.count; i++)
    {
        int wd = WIDTH/3;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(wd*(i%3), 57 + wd * (int)(i/3), WIDTH/3, WIDTH/3)];
        [scrollData addSubview:view];
        view.backgroundColor = WHITE_COLOR;
        view.layer.borderColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1].CGColor;
        view.layer.borderWidth = 1;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(wd/6+5,10,wd-wd/3-10,wd- wd/3-10)];
        [view addSubview:image];
        image.image = [UIImage imageNamed:arrayImegs[i]];
        
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(5,wd-40,wd-10,40)];
        lbl.numberOfLines = 0;
        lbl.text = @"title";
        [view addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = [UIFont systemFontOfSize:14];
        lbl.textColor = APP_COLOR_RED;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
