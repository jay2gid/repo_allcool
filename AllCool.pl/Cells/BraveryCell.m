//
//  BraveryCell.m
//  AllCool.pl
//
//  Created by Sanjay on 07/09/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

#import "BraveryCell.h"

@implementation BraveryCell
{
    IBOutlet UILabel *lblDaduj;
    IBOutlet UILabel *lblKasuj;
    IBOutlet UILabel *lblNottaki;
}
- (void)awakeFromNib {
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
    
    _imageBravery.clipsToBounds = YES;
    _imageBravery.layer.cornerRadius = 36;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
