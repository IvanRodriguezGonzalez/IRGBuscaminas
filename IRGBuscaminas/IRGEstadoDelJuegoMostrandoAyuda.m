//
//  IRGEstadoDelJuegoMostrandoAyuda.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 28/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//





#import "IRGEstadoDelJuegoMostrandoAyuda.h"
#import "IRGDatos.h"
#import "IRGVentanaPrincipalViewController.h"
#import "IRGGestorDeEstados.h"
#import "IRGSettingsViewController.h"
#import "IRGSettings.h"

#import "IRGPantallaDeAyudaLandscapeViewController.h"
#import "IRGPantallaDeAyudaPortraitViewController.h"




@interface IRGEstadoDelJuegoMostrandoAyuda()
#pragma mark - Propiedades privadas
@property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
@property (nonatomic) IRGPantallaDeAyudaLandscapeViewController * pantallaDeAyudaLandscapeViewController ;
@property (nonatomic) IRGPantallaDeAyudaPortraitViewController * pantallaDeAyudaPortraitViewController ;
@end

#pragma mark -
@implementation IRGEstadoDelJuegoMostrandoAyuda


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
    return @"ayuda";
}

#pragma mark - Metodos del protocolo

- (void) establecerBotones{
    self.delegado.labelEstadoDelJuego.text=@"mostrando ayuda...";
    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera desactivarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera desactivarBotonJugarSecundario];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self.delegado.gestionarBotonera desactivarSettings];
    
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
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
};

-(void) accionConfigurar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}
- (void) accionMostrarVentanaDeAyuda{
    self.pantallaDeAyudaLandscapeViewController = [[IRGPantallaDeAyudaLandscapeViewController alloc]init];
    self.pantallaDeAyudaPortraitViewController = [[IRGPantallaDeAyudaPortraitViewController alloc] init];
    self.pantallaDeAyudaPortraitViewController.sender = self;
    self.pantallaDeAyudaLandscapeViewController.sender = self;
    
    CGRect frameAyuda = [UIApplication sharedApplication].keyWindow.frame;
    
    if ([self.delegado iPadVertical]){
        self.pantallaDeAyudaPortraitViewController.view.frame = frameAyuda;
        self.pantallaDeAyudaPortraitViewController.view.center = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2,[[UIApplication sharedApplication] keyWindow].frame.size.height/2);
        [[[UIApplication sharedApplication] keyWindow] addSubview:self.pantallaDeAyudaPortraitViewController.view];
    }
    else{
        self.pantallaDeAyudaLandscapeViewController.view.frame = frameAyuda;
        self.pantallaDeAyudaLandscapeViewController.view.center = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2,[[UIApplication sharedApplication] keyWindow].frame.size.height/2);
        [[[UIApplication sharedApplication] keyWindow] addSubview:self.pantallaDeAyudaLandscapeViewController.view];
    }
}

-(void) accionOcultarVentanaDeAyuda{
    [self.pantallaDeAyudaLandscapeViewController.view removeFromSuperview];
    [self.pantallaDeAyudaPortraitViewController.view removeFromSuperview];
    [self.delegado restaurarEstado];
};
-(void) accionRotarPantalla{
    [self.pantallaDeAyudaLandscapeViewController.view removeFromSuperview];
    [self.pantallaDeAyudaPortraitViewController.view removeFromSuperview];
    [self accionMostrarVentanaDeAyuda];
}
@end
