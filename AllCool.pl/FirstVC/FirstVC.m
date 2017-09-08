//
//  FirstVC.m
//  AllCool.pl
//
//  Created by Sanjay on 06/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.title.text = @"Map";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
