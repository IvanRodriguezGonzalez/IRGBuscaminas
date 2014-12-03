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

-(void) activarBotonPausar{
    self.delegado.botonPausar.enabled = true;
}

-(void) desactivarBotonPausar{
    self.delegado.botonPausar.enabled  = false;
}

- (void) activarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = true;
}

- (void) desactivarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = false;
}

- (void) activarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = TRUE;
}

- (void) desactivarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = false;
}

- (void) activarSettings{
    self.delegado.botonSettings.enabled = true;
}

- (void) desactivarSettings{
    self.delegado.botonSettings.enabled = false;
}

-(void) mostrarVistaBotonJugarPrincipal{
    self.delegado.vistaBotonJugarPrincipal.hidden = NO;

}

- (void) ocultarVistaBotonJugarPrincipal{
   self.delegado.vistaBotonJugarPrincipal.hidden = YES;
}

- (void) mostrarVistaBotonJugarSecundario{
    self.delegado.vistaBotonJugarSecundario.hidden = NO;
}

-(void) ocultarVistaBotonJugarSecundario{
    self.delegado.vistaBotonJugarSecundario.hidden = YES ;
}

-(void) mostrarBarraDeBotones{
   self.delegado.vistaBarraDeBotones.hidden = NO;
}

-(void) ocultarBarraDeBotones{
    self.delegado.vistaBarraDeBotones.hidden = YES;
}

@end
