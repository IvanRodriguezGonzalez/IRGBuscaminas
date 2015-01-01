//
//  IRGGestorDeEstados.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGGestorDeEstados.h"

@interface IRGGestorDeEstados ()
    #pragma mark - Propiedades privadas
    @property (nonatomic) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic) id<IRGEstadosDelJuego> estadoDelJuego;
    @property (nonatomic) id<IRGEstadosDelJuego> antiguoEstadoDelJuego;
@end

#pragma mark -
@implementation IRGGestorDeEstados


#pragma mark - Inicializadores

-(instancetype) initConSender:(IRGVentanaPrincipalViewController *)sender{
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
        
        self.estadoDelJuegoConfiguracion = [[IRGEstadoDelJuegoConfiguracion alloc]initConGestorDeEstados:self delegado:self.delegado];
        self.estadoDelJuegoMostrandoAyuda = [[IRGEstadoDelJuegoMostrandoAyuda alloc]initConGestorDeEstados:self delegado:self.delegado];
        
        self.estadoDelJuego = self.estadoDelJuegoInicio;
        self.antiguoEstadoDelJuego = self.estadoDelJuegoInicio;
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

-(void) accionPausar{
    [self.estadoDelJuego accionPausar];
}

-(void) ponerBandera:(IRGCeldaViewController *)celdaViewController{
    [self.estadoDelJuego ponerBandera:celdaViewController];
}

-(void) despejarCelda:(IRGCeldaViewController *)celdaViewController{
    [self.estadoDelJuego despejarCelda:celdaViewController];
}

-(void) establecerBotones{
    [self.estadoDelJuego establecerBotones];
}

- (void) mostrarYOcultarBotones{
    [self.estadoDelJuego mostrarYOcultarBotones];
}

- (void) accionConfigurar{
    [self.estadoDelJuego accionConfigurar];
}

- (void) accionMostrarVentanaDeAyuda{
    [self.estadoDelJuego accionMostrarVentanaDeAyuda];
}

-(void) accionOcultarVentanaDeAyuda{
    [self.estadoDelJuego accionOcultarVentanaDeAyuda];
}
-(void) accionRotarPantalla{
    [self.estadoDelJuego accionRotarPantalla];
}

#pragma mark - Accesors


-(void) setEstadoDelJuego:(id<IRGEstadosDelJuego>)estadoDelJuego{
    _antiguoEstadoDelJuego = _estadoDelJuego;
    _estadoDelJuego = estadoDelJuego;
    [self establecerBotones];
}

#pragma mark - metodos propios primer nivel

-(void) establecerEstado:(id<IRGEstadosDelJuego>)nuevoEstado{
    self.estadoDelJuego = nuevoEstado;
}

- (id<IRGEstadosDelJuego>) estadoDelJuegoAnterior {
    return _antiguoEstadoDelJuego;
}

@end
