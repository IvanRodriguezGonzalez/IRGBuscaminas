//
//  IRGSettings.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 21/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IRGSettings : NSObject

#pragma mark - Propiedades publicas -
#pragma mark Caracterísitcas generales del juego
@property (nonatomic) NSInteger dificultad;
@property (nonatomic) NSInteger numeroDeMinas;
@property (nonatomic) bool      activarAyuda;
@property (nonatomic) NSInteger tiempoDeAyuda;
@property (nonatomic) float     porcerntajeDeTransparenciaDelMenu;
@property (nonatomic) float     porcerntajeDeTransparenciaDeLasCeldas;
@property (nonatomic) BOOL      tapPoneBandera;
@property (nonatomic) float     sensibilidadDelTap;
@property (nonatomic) NSInteger desplazamientoXDelCanvasEnModoHorizontal;


#pragma mark Colores
@property (nonatomic) UIColor * colorPorDefectoDelNumeroDeMinasAlrededorDeUnaCelda;

@property (nonatomic) UIColor * colorDeRellenoDeLaCeldaProcesada;
@property (nonatomic) UIColor * colorDeRellenoDeLaCeldaNoProcesada;

@property (nonatomic) UIColor * colorDeRellenoDeLaBarraDeBotones;

@property (nonatomic) UIColor * colorEtiquetaDeBoton;

#pragma mark - Metodos publicos

+ (instancetype) sharedSettings;
-(bool) guardarSettings;
-(NSInteger)numeroDeMInasPorDefectoDelNivel:(NSInteger)nivelDeDificultad;
-(NSInteger)tiempoDeAyudaPorDefectoDelNivel:(NSInteger)nivelDeDificultad;

@end
