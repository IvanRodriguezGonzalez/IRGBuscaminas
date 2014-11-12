//
//  IRGEstadoDelJuegoAyuda.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoAyuda.h"
#import "IRGGestorDeEstados.h"
#import "IRGNUmeroSieteSegmentosViewController.h"

@interface IRGEstadoDelJuegoAyuda()
@property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@property (nonatomic)  NSTimer * relojDeEspera;
@property (nonatomic) NSInteger contador;
@property (nonatomic) IRGNUmeroSieteSegmentosViewController *sieteSegmentosViewController;
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
        _contador = 5;
    }
    return self;
}

-(instancetype)init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Use initConSender" userInfo:nil];
    return false;
}

#pragma mark Accesors

-(IRGNUmeroSieteSegmentosViewController *) sieteSegmentosViewController{
    if (_sieteSegmentosViewController == nil){
        _sieteSegmentosViewController = [[IRGNUmeroSieteSegmentosViewController alloc] init];
    }
    return  _sieteSegmentosViewController;
}


#pragma mark - Overrides
-(NSString *) description{
    return @"Ayuda!";
}

#pragma mark Metodos del protocolo

- (void) establecerBotones{
    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera desactivarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera desactivarBotonPrincipal];
    [self.delegado.gestionarBotonera desactivarTextFieldNumeroDeMinas];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self anadirVistaSieteSegmentos];
    [self iniciarReloj];

}


- (void) accionJugar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
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


#pragma mark auxiliares primer nivel

- (void) anadirVistaSieteSegmentos{
    [self.delegado.view addSubview:self.sieteSegmentosViewController.view];
}
-(void) iniciarReloj{
    self.relojDeEspera = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(descontarContador)
                                                    userInfo:nil
                                                     repeats:TRUE];
}

- (void) descontarContador{
    self.contador = self.contador-1;
    if (self.contador ==0){
        [self.relojDeEspera invalidate];
        [self ocultarAyuda];
        [self.delegado.view sendSubviewToBack:self.sieteSegmentosViewController.view];
    }
    else {
        self.delegado.etiquetaBotonPrincipal .text= [NSString stringWithFormat:@"%ld",(long)self.contador];
        self.sieteSegmentosViewController.valorADibujar = 2;
    }
}

-(void) ocultarAyuda{
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoEnJuegoConAyuda];
    [self.delegado ocultarMinas];
}

-(void) accionPausar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

@end
