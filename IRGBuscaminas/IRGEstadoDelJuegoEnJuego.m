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
#import "IRGSettings.h"

@interface IRGEstadoDelJuegoEnJuego()
#pragma mark - Propiedades privadas

    @property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;


@end

#pragma mark -
@implementation IRGEstadoDelJuegoEnJuego

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
    return @"En juego...";
}

#pragma mark - Metodos del protocolo

- (void) establecerBotones{
    self.delegado.labelEstadoDelJuego.text=@"jugando...";

    if ([IRGSettings sharedSettings].activarAyuda){
        [self.delegado.gestionarBotonera activarBotonMostrarMinas];
    }
        else{
            [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
        }
    [self.delegado.gestionarBotonera desactivarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera activarBotonJugarSecundario];
    [self.delegado.gestionarBotonera activarBotonPausar];
    [self.delegado.gestionarBotonera activarSettings];
    [self.delegado.gestionarBotonera ocultarIndicadorModoAyuda];

    
    [self.delegado.gestionarBotonera mostrarBarraDeBotones];
    [self.delegado.gestionarBotonera mostrarVistaTiempoYMinas];
    
}

- (void) accionJugar{
    [self.delegado iniciarJuego];
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoEnJuego];
}

-(void) accionMostrarMinas{
    [self.delegado delegadoMostrarMinas];
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoAyuda];
}

-(void) despejarCelda:(IRGCeldaViewController *)celdaViewController{
    if (celdaViewController.estado == libre){
        if ((celdaViewController.tieneMina) ){
            [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoFinalizadoConError];
            [self.delegado acabarJuegoConError];
        }
        else {
            [self.delegado propagaTouch:celdaViewController];
            NSInteger porcentajeDeAvance =[self.delegado calcularPorcentajeDeProgreso];
            if (porcentajeDeAvance == 1){
                [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoFinalizadoSinErrorSinAyuda];
                [self.delegado acabarJuegoSinErrorSinAyuda];
            }
        }
    }
}

- (void) ponerBandera:(IRGCeldaViewController *)celdaViewController{
    switch (celdaViewController.estado)
    {
        case libre:
            if (self.delegado.banderasPuestas < [IRGSettings sharedSettings].numeroDeMinas){
                celdaViewController.estado = conBandera;
                self.delegado.banderasPuestas ++;
            }
            else{
                celdaViewController.estado = conDuda;
            }
            break;
        case conBandera:
            celdaViewController.estado = conDuda;
            self.delegado.banderasPuestas --;
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

-(void) accionPausar{
    [self.delegado delegadoPausarJuego];
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoEnPausa];

}

-(void) mostrarYOcultarBotones{
    if ((self.delegado.vistaBarraDeBotones.hidden ==YES) & (self.delegado.vistaBarraDeBotonesVertical.hidden ==YES)){
        [self.delegado.gestionarBotonera mostrarBarraDeBotones];
    }
    else {
        [self.delegado.gestionarBotonera ocultarBarraDeBotones];
    }
}

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
