//
//  BrowaryVC.m
//  AllCool.pl
//
//  Created by Sanjay on 08/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "BrowaryVC.h"

@interface BrowaryVC ()
{
    IBOutlet UIScrollView *scrollData;
}
@end

@implementation BrowaryVC

- (void)viewDidLoad {
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.title.text = @"Browary";
    
    [self loadData];
}

-(void)loadData
{
    for (int i = 0; i<10; i++)
    {
        int wd = WIDTH/3;
    
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(wd*(i%3), wd * (int)(i/3), WIDTH/3, WIDTH/3)];
        [scrollData addSubview:view];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(wd/6,10,wd-wd/3,wd- wd/3)];
        image.backgroundColor = GRAY_COLOR;
        [view addSubview:image];
        image.image = [UIImage imageNamed:@"test.png"];
        
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(5,wd-40,wd-10,50)];
        lbl.numberOfLines = 0;
        lbl.text = @"title hello";
        [view addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = [UIFont systemFontOfSize:14];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
