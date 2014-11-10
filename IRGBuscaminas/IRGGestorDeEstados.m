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

#pragma mark - Meotodos de primer nivel


-(void) setEstadoDelJuego:(id<IRGEstadosDelJuego>)estadoDelJuego{
    _estadoDelJuego = estadoDelJuego;
    [self.estadoDelJuego establecerBotones];
}


@end