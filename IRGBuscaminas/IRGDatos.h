//
//  IRGDatos.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRGCeldaViewController.h"
@class IRGCelda;


@interface IRGDatos : NSObject

#pragma mark - Inicializadores
//designated initializer
+ (instancetype) sharedDatos;

#pragma mark - Metodos publicos

- (NSArray *) todasLasCeldas;
- (void) borrarJuego;

- (NSInteger)   numeroDeMinasAlrededor:(IRGCeldaViewController *) celdaViewcontroller;
- (BOOL)        tieneMinasAlrededor:(IRGCeldaViewController *) celdaViewcontroller;
- (NSArray *)   celdasSinMinasAlrededorDe: (IRGCeldaViewController *) celdaViewcontroller
                     incluyendoEsquinas:(bool)incluirEsquinas;
- (void) anadirCeldaViewController:(IRGCeldaViewController *)celdaViewControllerNuevo;

@end
