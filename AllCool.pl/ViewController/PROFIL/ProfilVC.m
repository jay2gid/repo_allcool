//
//  ProfilVC.m
//  AllCool.pl
//
//  Created by Sanjay on 24/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "ProfilVC.h"

@interface ProfilVC ()

@end

@implementation ProfilVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.title.text = @"Profil";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end