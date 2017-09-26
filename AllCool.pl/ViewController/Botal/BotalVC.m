//
//  BotalVC.m
//  AllCool.pl
//
//  Created by Sanjay on 18/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "BotalVC.h"
#import "ViewAddRatingTobotal.h"
@interface BotalVC ()
{

    IBOutlet UIScrollView *mainScroll;
    
    IBOutlet UIView *rview1;
    IBOutlet UIView *rview2;
    IBOutlet UIView *rview3;
    
    IBOutlet UIButton *btnOcena1;
    IBOutlet UIButton *btnOcena2;
    IBOutlet UILabel *slidingLine;
}
@end

@implementation BotalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.title.text = @"Reduga loss weekend";

    rview1.layer.cornerRadius = 40;
    rview2.layer.cornerRadius = 40;
    rview3.layer.cornerRadius = 40;
    
    
    mainScroll.contentSize = CGSizeMake(WIDTH, 900);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapBtnOcena:(UIButton *)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        slidingLine.frame =  CGRectMake(WIDTH/2*sender.tag, 40, WIDTH/2, 2);
    }];
    
    [btnOcena1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [btnOcena2 setTitleColor:[UIColor darkGrayColor]forState:UIControlStateNormal];

    [sender setTitleColor:APP_COLOR_RED forState:UIControlStateNormal];


}
- (IBAction)tapRating:(id)sender {
    
    ViewAddRatingTobotal *view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil]objectAtIndex:1];
    [self.view addSubview:view];
    
}

@end
