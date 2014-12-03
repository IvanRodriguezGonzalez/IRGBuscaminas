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
    #pragma mark - Propiedades privadas
    @property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@end

#pragma mark -
@implementation IRGEstadoDelJuegoFinalizadoSinErrorConAyuda

#pragma mark - Inicializadores
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

#pragma mark - Metodos del protocolo

- (void) establecerBotones{
    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera activarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera activarBotonPrincipal];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self.delegado.gestionarBotonera activarSettings];
}


- (void) accionJugar{
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoEnJuego];
    [self.delegado iniciarJuego];
}

-(void) accionMostrarMinas{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) ponerBandera:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}

- (void) despejarCelda:(IRGCeldaViewController *)celdaViewControlle{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}

-(void) accionPausar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) mostrarYOcultarBotones{
    
};

@end
