//
//  IRGEstadoDelJuegoEnJuego.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoEnJuego.h"
#import "IRGGestorDeEstados.h"
#import "IRGCeldaViewController.h"

@interface IRGEstadoDelJuegoEnJuego()
@property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;


@end


@implementation IRGEstadoDelJuegoEnJuego

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
    return @"En juego...";
}

#pragma mark Metodos del protocolo

- (void) establecerBotones{
    [self.delegado activarBotonMostrarMinas];
    [self.delegado desactivarBotonMejoresTiempos];
    [self.delegado activarBotonPrincipal];
    [self.delegado desactivarTextFieldNumeroDeMinas];
}

- (void) accionJugar{
    [self.delegado iniciarJuego];
    self.gestorDeEstados.estadoDelJuego = self.gestorDeEstados.estadoDelJuegoEnJuego;
}

-(void) accionMostrarMinas{
    [self.delegado mostrarMinas];
    self.gestorDeEstados.estadoDelJuego = self.gestorDeEstados.estadoDelJuegoAyuda;
}

-(void) celdaDoblePulsada:(IRGCeldaViewController *)celdaViewController{
    if (celdaViewController.estado == libre){
        if ((celdaViewController.tieneMina) ){
            self.gestorDeEstados.estadoDelJuego= self.gestorDeEstados.estadoDelJuegoFinalizadoConError;
            [self.delegado acabarJuegoConError];
        }
        else {
            [self.delegado propagaTouch:celdaViewController];
            NSInteger porcentajeDeAvance =[self.delegado actualizarBotonYBarraDeProgreso];
            if (porcentajeDeAvance == 1){
                self.gestorDeEstados.estadoDelJuego = self.gestorDeEstados.estadoDelJuegoFinalizadoSinErrorSinAyuda;
                [self.delegado acabarJuegoSinErrorSinAyuda];
            }
        }
    }
}
    


- (void) celdaPulsada:(IRGCeldaViewController *)celdaViewController{
    switch (celdaViewController.estado)
    {
        case libre:
            celdaViewController.estado = conBandera;
            break;
        case conBandera:
            celdaViewController.estado = conDuda;
            break;
        case conDuda:
            celdaViewController.estado = libre ;
            break;
        default:
            NSLog (@"Estdo de celda no esperado");
            break;
    }
    [self.delegado actualizaMinasPendientes];
}


@end
