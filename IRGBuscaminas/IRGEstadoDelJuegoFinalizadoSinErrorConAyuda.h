//
//  IRGEstadoDelJuegoSinErrorConAyuda.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 11/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IRGEstadosDelJuego.h"
@class IRGGestorDeEstados;

@interface IRGEstadoDelJuegoFinalizadoSinErrorConAyuda : NSObject<IRGEstadosDelJuego>

-(instancetype) initConGestorDeEstados: (IRGGestorDeEstados *)gestorDeEstados
                              delegado:(IRGVentanaPrincipalViewController *)sender;

@end
