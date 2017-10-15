//
//  FloatingButton.m
//  AllCool.pl
//
//  Created by Sanjay on 14/10/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "FloatingButton.h"
#import "FloatingButtonCell.h"
@implementation FloatingButton

@synthesize array_images,array_titles;

- (void)drawRect:(CGRect)rect {

    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    for (int i = 0; i < 4 ; i++)
    {
        FloatingButtonCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FloatingButtonCell" owner:self options:nil]objectAtIndex:0];
        cell.frame = CGRectMake(0, HEIGHT - 320+80*i,WIDTH ,80);
        cell.btn_tap.tag = i;
        [self addSubview:cell];
        cell.lbl_title.text = @"Title";
    }
    
}


@end
