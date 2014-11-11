//
//  IRGGestorDeEstados.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGGestorDeEstados.h"


@interface IRGGestorDeEstados ()

@property (nonatomic) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic) id<IRGEstadosDelJuego> estadoDelJuego;

@end

@implementation IRGGestorDeEstados


#pragma mark - Inicializadores
-(instancetype) initConDelegado:(IRGVentanaPrincipalViewController *)sender{
    self = [super init];
    if (self) {
        self.delegado = sender;
        self.estadoDelJuegoInicio = [[IRGEstadoDelJuegoInicio alloc]initConGestorDeEstados:self
                                                                                    delegado:self.delegado];
        self.estadoDelJuegoEnJuego = [[IRGEstadoDelJuegoEnJuego alloc]initConGestorDeEstados:self
                                                                                    delegado:self.delegado];
        self.estadoDelJuegoAyuda = [[IRGEstadoDelJuegoAyuda alloc]initConGestorDeEstados:self
                                                                                delegado:self.delegado];
        self.estadoDelJuegoEnJuegoConAyuda = [[IRGEstadoDelJuegoEnJuegoConAyuda alloc]initConGestorDeEstados:self delegado:self.delegado];
        
        self.estadoDelJuegoFinalizadoSinErrorSinAyuda = [[IRGEstadoDelJuegoFinalizadoSinErrorSinAyuda alloc] initConGestorDeEstados:self delegado:self.delegado];

        self.estadoDelJuegoFinalizadoSinErrorConAyuda = [[IRGEstadoDelJuegoFinalizadoSinErrorConAyuda alloc] initConGestorDeEstados:self delegado:self.delegado];
        
        self.estadoDelJuegoFinalizadoConError = [[IRGEstadoDelJuegoFinalizadoConError alloc] initConGestorDeEstados:self delegado:self.delegado];
        
        self.estadoDelJuegoEnPausa = [[IRGEstadoDelJuegoEnPausa alloc] initConGestorDeEstados:self delegado:self.delegado];
        
        
        self.estadoDelJuego = self.estadoDelJuegoInicio;
    }
    return self;
}

-(instancetype)init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Use initConSender" userInfo:nil];
    return false;
}

#pragma mark - metodos del protocolo
- (void) accionJugar{
    [self.estadoDelJuego accionJugar];
}

-(void) accionMostrarMinas{
    [self.estadoDelJuego accionMostrarMinas];
}

-(void) celdaPulsada:(IRGCeldaViewController *)celdaViewController{
    [self.estadoDelJuego celdaPulsada:celdaViewController];
}

-(void) celdaDoblePulsada:(IRGCeldaViewController *)celdaViewController{
    [self.estadoDelJuego celdaDoblePulsada:celdaViewController];
}

-(void) establecerBotones{
    [self.estadoDelJuego establecerBotones];
}

-(void) accionPausar{
    [self.estadoDelJuego accionPausar];
}

#pragma mark - Meotodos de primer nivel


-(void) setEstadoDelJuego:(id<IRGEstadosDelJuego>)estadoDelJuego{
    _estadoDelJuego = estadoDelJuego;
    [self establecerBotones];
    self.delegado.etiquetaBotonPrincipal.text = [NSString stringWithFormat:@"%@",self.estadoDelJuego];
}

#pragma mark - metodos propios primer nivel

-(void) establecerEstado:(id<IRGEstadosDelJuego>)nuevoEstado{
    self.estadoDelJuego = nuevoEstado;
}


@end
