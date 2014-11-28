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

//designated initializer
+ (instancetype) sharedDatos;


- (NSInteger) numeroDeMinasAlrededor:(IRGCeldaViewController *) celdaViewcontroller;
- (BOOL) tieneMinasAlrededor:(IRGCeldaViewController *) celdaViewcontroller;
- (NSArray *) celdasAlrededorDe:(IRGCeldaViewController *)celdaViewcontroller;
- (NSArray *) celdasSinMinasAlrededorDe: (IRGCeldaViewController *) celdaViewcontroller
                     incluyendoEsquinas:(bool)incluirEsquinas;

- (IRGCeldaViewController *) celdaDeLaFila:(NSInteger) fila
                                columna:(NSInteger) columna;

- (void) anadirCeldaViewController:(IRGCeldaViewController *)celdaViewControllerNuevo;
- (void) borrarJuego;
- (NSArray *) todasLasCeldas;

@end
