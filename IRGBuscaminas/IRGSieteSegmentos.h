//
//  IRGSieteSegmentos.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRGSieteSegmentos : UIView
-(void) dibujarNumero:(NSInteger )valor;

#pragma mark - Propiedades configurables por el usuario

@property(nonatomic) NSInteger grosorDelSegmento;
@property(nonatomic) NSInteger separacionEntreSegmentos;
@property(nonatomic) NSInteger separacionVerticalDeLosSegmentosConLaVista;
@property(nonatomic) NSInteger separacionHorizontalDeLosSegmentosConLaVista;
@property(nonatomic) UIColor * colorDelTrazoDelBorde;
@property(nonatomic) UIColor * colorDelTrazoDelBordeConLuz;
@property(nonatomic) UIColor * colorDelTrazoDelBordeConSombra;
@property(nonatomic) UIColor * colorDelRellenoDelSegmento;
@property (nonatomic) NSInteger grosorDelTrazo;
@property(nonatomic) UIColor *colorDeFondo;
@property (nonatomic) bool efecto3D;






@end
