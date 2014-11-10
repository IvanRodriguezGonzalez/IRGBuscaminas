//
//  IRGEstadoDelJuegoAyuda.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoAyuda.h"
#import "IRGGestorDeEstados.h"

@interface IRGEstadoDelJuegoAyuda()
@property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@end

@implementation IRGEstadoDelJuegoAyuda
#pragma mark Inicializadores
//designated initizalizer
-(instancetype) initConGestorDeEstados: (IRGGestorDeEstados *)gestorDeEstados
                                delegado:(IRGVentanaPrincipalViewController *)sender{
    self = [super init];
    if (self) {
        _delegado = sender;
        _gestorDeEstados = gestorDeEstados;
    }
    return self;
}

-(instancetype)init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Use initConSender" userInfo:nil];
    return false;
}

#pragma mark Metodos del protocolo

- (void) establecerBotones{
    [self.delegado activarBotonMostrarMinas];
    [self.delegado desactivarBotonMejoresTiempos];
    [self.delegado desactivarBotonPrincipal];
    [self.delegado desactivarTextFieldNumeroDeMinas];
}


- (void) accionJugar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) accionMostrarMinas{
    self.gestorDeEstados.estadoDelJuego = self.gestorDeEstados.estadoDelJuegoEnJuegoConAyuda;
    [self.delegado ocultarMinasxx];
}

-(void) celdaPulsada:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}

- (void) celdaDoblePulsada:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}


@end
