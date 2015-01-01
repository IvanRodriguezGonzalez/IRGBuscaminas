//
//  IRGEstadoDelJuegoInicio.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoInicio.h"
#import "IRGDatos.h"
#import "IRGVentanaPrincipalViewController.h"
#import "IRGGestorDeEstados.h"
#import "IRGSettingsViewController.h"
#import "IRGSettings.h"



@interface IRGEstadoDelJuegoInicio()
    #pragma mark - Propiedades privadas
    @property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@end

#pragma mark -
@implementation IRGEstadoDelJuegoInicio


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
    self.delegado.labelEstadoDelJuego.text=@"buscaminas";
    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera activarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera activarBotonJugarSecundario];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self.delegado.gestionarBotonera activarSettings];
    [self.delegado.gestionarBotonera ocultarIndicadorModoAyuda];
    
    [self.delegado.gestionarBotonera mostrarBarraDeBotones];
    [self.delegado.gestionarBotonera mostrarVistaTiempoYMinas];
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

- (void) despejarCelda:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
 
}

-(void) accionPausar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}
-(void) mostrarYOcultarBotones{
    if ((self.delegado.vistaBarraDeBotones.hidden ==YES) & (self.delegado.vistaBarraDeBotonesVertical.hidden ==YES)){
        [self.delegado.gestionarBotonera mostrarBarraDeBotones];
        
    }
    else {
        [self.delegado.gestionarBotonera ocultarBarraDeBotones];
    }
    
};

-(void) accionConfigurar{
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoConfiguracion];
    [self.delegado delegadoMostrarVentanaDeConfiguracion];
}

- (void) accionMostrarVentanaDeAyuda{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}
-(void) accionOcultarVentanaDeAyuda{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
};
-(void) accionRotarPantalla{
}
@end
