//
//  IRGEstadoDelJuegoEnJuego.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRGEstadosDelJuego.h"
@class  IRGGestorDeEstados;


@interface IRGEstadoDelJuegoEnJuego :NSObject<IRGEstadosDelJuego>

#pragma mark - Inicializadores
//designated initializer
-(instancetype) initConGestorDeEstados: (IRGGestorDeEstados *)gestorDeEstados
                                delegado:(IRGVentanaPrincipalViewController *)sender;

@end
