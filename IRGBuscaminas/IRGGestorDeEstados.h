//
//  IRGGestorDeEstados.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRGVentanaPrincipalViewController.h"

#import "IRGEstadosDelJuego.h"
#import "IRGEstadoDelJuegoInicio.h"
#import "IRGEstadoDelJuegoEnJuego.h"
#import "IRGEstadoDelJuegoAyuda.h"
#import "IRGEstadoDelJuegoEnJuegoConAyuda.h"
#import "IRGEstadoDelJuegoFinalizadoSinErrorSinAyuda.h"
#import "IRGEstadoDelJuegoFinalizadoSinErrorConAyuda.h"
#import "IRGEstadoDelJuegoFinalizadoConError.h"
#import "IRGEstadoDelJuegoEnPausa.h"


@interface IRGGestorDeEstados : NSObject<IRGEstadosDelJuego>


@property (nonatomic) IRGEstadoDelJuegoInicio *estadoDelJuegoInicio;
@property (nonatomic) IRGEstadoDelJuegoEnJuego * estadoDelJuegoEnJuego;
@property (nonatomic) IRGEstadoDelJuegoAyuda *estadoDelJuegoAyuda;
@property (nonatomic) IRGEstadoDelJuegoEnJuegoConAyuda * estadoDelJuegoEnJuegoConAyuda;
@property (nonatomic) IRGEstadoDelJuegoFinalizadoSinErrorSinAyuda * estadoDelJuegoFinalizadoSinErrorSinAyuda;
@property (nonatomic) IRGEstadoDelJuegoFinalizadoSinErrorConAyuda * estadoDelJuegoFinalizadoSinErrorConAyuda;
@property (nonatomic) IRGEstadoDelJuegoFinalizadoConError* estadoDelJuegoFinalizadoConError;
@property (nonatomic) IRGEstadoDelJuegoEnPausa* estadoDelJuegoEnPausa;


-(instancetype) initConDelegado:(IRGVentanaPrincipalViewController *)sender;



-(void) establecerEstado:(id<IRGEstadosDelJuego>)nuevoEstado;

@end
