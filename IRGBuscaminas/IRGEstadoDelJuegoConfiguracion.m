//
//  IRGEstadoDelJuegoInicio.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoConfiguracion.h"
#import "IRGDatos.h"
#import "IRGVentanaPrincipalViewController.h"
#import "IRGGestorDeEstados.h"



@interface IRGEstadoDelJuegoConfiguracion()
    #pragma mark - Propiedades privadas
    @property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@end

#pragma mark -
@implementation IRGEstadoDelJuegoConfiguracion


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
    return @"Inicio";
}

#pragma mark - Metodos del protocolo

- (void) establecerBotones{
    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera desactivarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera desactivarBotonJugarSecundario];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self.delegado.gestionarBotonera desactivarSettings];
    
    [self.delegado.gestionarBotonera mostrarVistaBotonJugarSecundario];
    [self.delegado.gestionarBotonera mostrarBarraDeBotones];
    [self.delegado.gestionarBotonera mostrarVistaTiempoYMinas];
    
}

- (void) accionJugar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) accionMostrarMinas{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];

}

-(void) ponerBandera:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];

}

- (void) despejarCelda:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
 
}

-(void) accionPausar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}
-(void) mostrarYOcultarBotones{
};

-(void) accionConfigurar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}



@end
