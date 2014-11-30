//
//  IRGPincel.h
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IRGPincel : NSObject

@property (nonatomic) UIColor * colorDelNumeroDeMInas;
@property (nonatomic) UIColor * colorDeTrazoDelPincel;
@property (nonatomic) NSUInteger grosorDelTrazoDelPincel;

@property (nonatomic) UIColor * colorDeRellenoDelPincel;
@property (nonatomic) UIColor * colorDeRellenoDeLaCeldaVacia;
@property (nonatomic) UIColor * colorDeRellenoDePantallaNormal;
@property (nonatomic) UIColor * colorDeRellenoDePantallaDeError;
@property (nonatomic) UIColor * colorDeRellenoDePantallaDeVictoria;
@property (nonatomic) UIColor * colorDeRellenoDePantallaDeModoAyuda;
@property (nonatomic) UIColor * colorDeRellenoDeLaBarraDeBotones;

@property (nonatomic) UIColor * colorEtiquetaDeBotonSeleccionado;
@property (nonatomic) UIColor * colorEtiquetaDeBotonNormal;

+ (instancetype) sharedPincel;

@end
