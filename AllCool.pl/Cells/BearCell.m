//
//  BearCell.m
//  AllCool.pl
//
//  Created by Sanjay on 07/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "BearCell.h"

@implementation BearCell
{
    IBOutlet UILabel *lblDaduj;
    IBOutlet UILabel *lblKasuj;
    IBOutlet UILabel *lblNottaki;
    IBOutlet UIView *viewMid;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    lblDaduj.layer.cornerRadius = 13;
    lblDaduj.layer.borderWidth = 1;
    lblDaduj.layer.borderColor = lblDaduj.textColor.CGColor;

    lblKasuj.layer.cornerRadius = 13;
    lblKasuj.layer.borderWidth = 1;
    lblKasuj.layer.borderColor = lblKasuj.textColor.CGColor;
    
    lblNottaki.layer.cornerRadius = 13;
    lblNottaki.layer.borderWidth = 1;
    lblNottaki.layer.borderColor = lblNottaki.textColor.CGColor;
    
    viewMid.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor;
    viewMid.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    viewMid.layer.shadowOpacity = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
