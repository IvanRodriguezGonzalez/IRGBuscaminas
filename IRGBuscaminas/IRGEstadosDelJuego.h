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
#pragma mark - Metodos del protocolo obligatorios
-(void)accionJugar;
-(void)accionMostrarMinas;
-(void) accionPausar;
-(void) ponerBandera: (IRGCeldaViewController *)celdaViewController;
-(void) despejarCelda: (IRGCeldaViewController *)celdaViewController;
-(void) establecerBotones;
-(void) mostrarYOcultarBotones;

@end
