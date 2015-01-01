//
//  IRGEstadoDelJuegoMostrandoAyuda.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 28/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRGEstadosDelJuego.h"

@class IRGGestorDeEstados;

@interface IRGEstadoDelJuegoMostrandoAyuda : NSObject<IRGEstadosDelJuego>

//designated initializer
-(instancetype) initConGestorDeEstados: (IRGGestorDeEstados *)gestorDeEstados
                              delegado:(IRGVentanaPrincipalViewController *)sender;


@end
