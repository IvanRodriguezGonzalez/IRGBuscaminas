//
//  IRGEstadoDelJuegoSinErrorConAyuda.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 11/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoFinalizadoSinErrorConAyuda.h"
#import "IRGGestorDeEstados.h"

@interface IRGEstadoDelJuegoFinalizadoSinErrorConAyuda()
@property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@end

@implementation IRGEstadoDelJuegoFinalizadoSinErrorConAyuda

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


#pragma mark - Overrides
-(NSString *) description{
    return @"Bien... (ahora intentalo sin ayuda)";
}

#pragma mark Metodos del protocolo

- (void) establecerBotones{
    [self.delegado desactivarBotonMostrarMinas];
    [self.delegado activarBotonMejoresTiempos];
    [self.delegado activarBotonPrincipal];
    [self.delegado activarTextFieldNumeroDeMinas];
}


- (void) accionJugar{
    self.gestorDeEstados.estadoDelJuego = self.gestorDeEstados.estadoDelJuegoEnJuego;
    [self.delegado iniciarJuego];
}

-(void) accionMostrarMinas{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) celdaPulsada:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}

- (void) celdaDoblePulsada:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}




@end
