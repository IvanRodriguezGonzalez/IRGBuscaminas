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
    self.delegado.etiquetaBotonPrincipal.enabled = true;
    self.delegado.etiquetaBotonPrincipal.textColor = [IRGSettings sharedSettings].colorEtiquetaDeBoton;
}

-(void) desactivarBotonPrincipal{
    self.delegado.botonPrincipal.enabled  = false;
    self.delegado.etiquetaBotonPrincipal.enabled = false;
}

-(void) activarBotonPausar{
    self.delegado.botonPausar.enabled = true;
    self.delegado.etiquetaBotonPausar.enabled = true;
    self.delegado.etiquetaBotonPausar.textColor = [IRGSettings sharedSettings].colorEtiquetaDeBoton;
}

-(void) desactivarBotonPausar{
    self.delegado.botonPausar.enabled  = false;
    self.delegado.etiquetaBotonPausar.enabled = false;
}

- (void) activarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = true;
    self.delegado.etiquetaBotonMostrarMejoresTiempos.enabled = true;
    self.delegado.etiquetaBotonMostrarMejoresTiempos.textColor = [IRGSettings sharedSettings].colorEtiquetaDeBoton;
}

- (void) desactivarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = false;
    self.delegado.etiquetaBotonMostrarMejoresTiempos.enabled = false;
}

- (void) activarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = TRUE;
    self.delegado.etiquetaBotonMostrarMinas.enabled = true;
    self.delegado.etiquetaBotonMostrarMinas.textColor = [IRGSettings sharedSettings].colorEtiquetaDeBoton;
}

- (void) desactivarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = false;
    self.delegado.etiquetaBotonMostrarMinas.enabled = false;
}

- (void) activarSettings{
    self.delegado.botonSettings.enabled = true;
    self.delegado.etiquetaSettings.enabled = true;
    self.delegado.etiquetaSettings.textColor = [IRGSettings sharedSettings].colorEtiquetaDeBoton;
}

- (void) desactivarSettings{
    self.delegado.botonSettings.enabled = false;
    self.delegado.etiquetaSettings.enabled = false;
}



@end
