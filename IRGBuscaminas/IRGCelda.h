//
//  IRGCelda.h
//  IRGDibujar
//
//  Created by Ivan Rodriguez Gonzalez on 26/10/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IRGCelda : UIView

@property (nonatomic) UIColor *colorDelBorde;
@property (nonatomic) NSUInteger grosorDelTrazoDeLaCelda;
@property (nonatomic) UILabel * numeroDeMinasAlrededor;
@property (nonatomic) UIImageView *imagenDeMina;
@property (nonatomic) bool procesada;


- (instancetype) initWithFrame:(CGRect)frame
                 colorDelBorde:(UIColor *)colorDelBorde
                grosorDelTrazo:(NSUInteger) grosorDelTrazo
                     procesada:(bool) proesada;

@end
