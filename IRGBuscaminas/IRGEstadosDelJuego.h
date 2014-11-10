//
//  IRGEstadosDelJuego.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IRGCeldaViewController;
@class IRGGestorDeEstados;
@class IRGVentanaPrincipalViewController;

@protocol IRGEstadosDelJuego  <NSObject>

-(void)accionJugar;
-(void)accionMostrarMinas;
-(void) celdaPulsada: (IRGCeldaViewController *)celdaViewController;
-(void) celdaDoblePulsada: (IRGCeldaViewController *)celdaViewController;
-(void) establecerBotones;

@end
