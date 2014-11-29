//
//  IRGNumeroSieteSegmentos.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRGNumeroSieteSegmentos : UIView

#pragma mark - Propiedades publicas

@property(nonatomic) NSInteger grosorDelSegmento;
@property (nonatomic) NSInteger grosorDelTrazo;

@property(nonatomic) NSInteger separacionEntreSegmentos;
@property(nonatomic) NSInteger separacionVerticalDeLosSegmentosConLaVista;
@property(nonatomic) NSInteger separacionHorizontalDeLosSegmentosConLaVista;

@property(nonatomic) UIColor * colorDelTrazoDelBorde;
@property(nonatomic) UIColor * colorDelRellenoDelSegmento;


#pragma mark - Metodos publicos
-(void) dibujarNumero:(NSInteger )valor;

@end
