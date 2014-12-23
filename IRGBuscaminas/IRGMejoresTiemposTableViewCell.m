//
//  IRGMejoresTiemposTableViewCell.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 15/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGMejoresTiemposTableViewCell.h"

@implementation IRGMejoresTiemposTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.vistaInteriorPrincipal.layer.borderWidth = 1;
    self.vistaInteriorPrincipal.layer.borderColor = [UIColor grayColor].CGColor;
    self.vistaInteriorPrincipal.layer.cornerRadius = 5;
    self.vistaInteriorPrincipal.layer.masksToBounds = YES;

    self.vistaDeLosDatos.layer.borderWidth =0;
    self.vistaDeLosDatos.layer.borderColor = [UIColor grayColor].CGColor;
    self.vistaDeLosDatos.layer.cornerRadius = 0;
    self.vistaDeLosDatos.layer.masksToBounds = YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
