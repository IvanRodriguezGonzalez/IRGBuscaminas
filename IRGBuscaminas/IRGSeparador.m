//
//  IRGSeparador.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 1/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSeparador.h"
#define TAMANO_HORIZONTAL .50
#define TAMANO_VERTICAL .15


@implementation IRGSeparador

- (void)drawRect:(CGRect)rect {
    
    float anchoSeparador = self.frame.size.width*TAMANO_HORIZONTAL;
    float altoSeparador = self.frame.size.height*TAMANO_VERTICAL;
    float posicionX = self.frame.size.width*(1-TAMANO_HORIZONTAL)/2;
    float posicionYSeparador1 = self.frame.size.height*(1-TAMANO_VERTICAL*2.5)/2;
    float posicionYSeparador2 = self.frame.size.height-posicionYSeparador1-altoSeparador;
    
    CGRect  separador1 = CGRectMake(posicionX,posicionYSeparador1,anchoSeparador,altoSeparador);
    UIBezierPath * pathSeparador1 = [UIBezierPath bezierPathWithRoundedRect:separador1 cornerRadius:10];

    CGRect  separador2 = CGRectMake(posicionX,posicionYSeparador2,anchoSeparador,altoSeparador);
    UIBezierPath * pathSeparador2 = [UIBezierPath bezierPathWithRoundedRect:separador2 cornerRadius:10];
    
    
    
    [self.colorDelBordeDelSeparador setStroke];
    [self.colorDeRellenoDelSeparador setFill];
    
    pathSeparador1.lineWidth = self.grosorDelBorde;
    [pathSeparador1 stroke];
    [pathSeparador1 fill];
    pathSeparador2.lineWidth = self.grosorDelBorde;
    [pathSeparador2 stroke];
    [pathSeparador2 fill];

}

@end
