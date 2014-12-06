//
//  IRGGestionarBotonera.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 11/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGGestionarBotonera.h"
#import "IRGSettings.h"
#import "IRGVentanaPrincipalViewController.h"
#import <UIKit/UIKit.h>
@interface IRGGestionarBotonera ()
    #pragma mark - Propiedades privadas
    @property (nonatomic) IRGVentanaPrincipalViewController *delegado;
@property (nonatomic) UIView * cortinilla;
@end

#pragma mark -
@implementation IRGGestionarBotonera


#pragma mark - Inicializadores
-(instancetype) initConSender:(IRGVentanaPrincipalViewController *)sender{
    self = [super init];
    if (self){
        _delegado = sender;
    }
    return self;
}

-(instancetype)init{
    [NSException exceptionWithName:@"Invalid init" reason:@"Use initConSender" userInfo:nil];
    return false;
}


# pragma mark - Metodos Publicos de activar y desactivar botones
-(void) activarBotonPrincipal{
    self.delegado.botonPrincipal.enabled = true;
}

-(void) desactivarBotonPrincipal{
    self.delegado.botonPrincipal.enabled  = false;
}

-(void) activarBotonJugarSecundario{
    self.delegado.botonJugarSecundario.enabled = true;
    self.delegado.botonJugarSecundarioVertical.enabled = true;
}

-(void) desactivarBotonJugarSecundario{
    self.delegado.botonJugarSecundario.enabled = false;
    self.delegado.botonJugarSecundarioVertical.enabled = FALSE;
}

-(void) activarBotonPausar{
    self.delegado.botonPausar.enabled = true;
    self.delegado.botonPausarVertical.enabled = true;
}

-(void) desactivarBotonPausar{
    self.delegado.botonPausar.enabled  = false;
    self.delegado.botonPausarVertical.enabled = false;
}

- (void) activarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = true;
    self.delegado.botonMostrarMejoresTiempoVertical.enabled = true;
}

- (void) desactivarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = false;
    self.delegado.botonMostrarMejoresTiempoVertical.enabled = false;
}

- (void) activarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = TRUE;
    self.delegado.botonMostrarMinasVertical.enabled = true;
}

- (void) desactivarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = false;
    self.delegado.botonMostrarMinasVertical.enabled = false;
}

- (void) activarSettings{
    self.delegado.botonSettings.enabled = true;
    self.delegado.botonSettingsVertical.enabled = true;
}

- (void) desactivarSettings{
    self.delegado.botonSettings.enabled = false;
    self.delegado.botonSettingsVertical.enabled = false;
}

-(void) mostrarVistaBotonJugarPrincipal{
    self.delegado.vistaBotonJugarPrincipal.hidden = NO;

}

- (void) ocultarVistaBotonJugarPrincipal{
   self.delegado.vistaBotonJugarPrincipal.hidden = YES;
}

- (void) mostrarVistaBotonJugarSecundario{
    self.delegado.vistaBotonJugarSecundario.hidden = NO;
    [self.delegado.canvas bringSubviewToFront: self.delegado.vistaBotonJugarSecundario];
    
    self.delegado.vistaBotonJugarSecundarioVertical.hidden = NO;
    [self.delegado.canvas bringSubviewToFront: self.delegado.vistaBotonJugarSecundarioVertical];
}

-(void) ocultarVistaBotonJugarSecundario{
    self.delegado.vistaBotonJugarSecundario.hidden = YES ;
    self.delegado.vistaBotonJugarSecundarioVertical.hidden = YES;
}

-(void) mostrarBarraDeBotones{
    
    if ([self iPadVertical]){
        self.delegado.vistaBarraDeBotones.hidden = NO;
        self.delegado.vistaBarraDeBotonesVertical.hidden= YES;
}
    else{
        self.delegado.vistaBarraDeBotones.hidden = YES;
        self.delegado.vistaBarraDeBotonesVertical.hidden = NO;;
    }
}

-(void) ocultarBarraDeBotones{
    self.delegado.vistaBarraDeBotones.hidden = YES;
    self.delegado.vistaBarraDeBotonesVertical.hidden = YES;
}

-(void) mostrarVistaTiempoYMinas{
    self.delegado.vistaTiempoYMinas.hidden = NO;
}

- (void) ocultarVistaTiempoYMinas{
    self.delegado.vistaTiempoYMinas.hidden = YES;
}

- (BOOL) iPadVertical{
    
    UIInterfaceOrientation newOrientation =  [UIApplication sharedApplication].statusBarOrientation;
    if ((newOrientation == UIInterfaceOrientationLandscapeLeft || newOrientation == UIInterfaceOrientationLandscapeRight)){
        return false;
    }
    else {
        return true;
    }
}

-(void) mostrarIndicadorModoAyuda{
    self.delegado.vistaModoAyuda.hidden = NO;
}


-(void) ocultarIndicadorModoAyuda{
    self.delegado.vistaModoAyuda.hidden = YES;
}

@end
