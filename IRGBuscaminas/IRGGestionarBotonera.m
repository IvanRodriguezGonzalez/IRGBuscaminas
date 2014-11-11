//
//  IRGGestionarBotonera.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 11/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGGestionarBotonera.h"
#import "IRGPincel.h"
#import "IRGVentanaPrincipalViewController.h"

@interface IRGGestionarBotonera ()
@property (nonatomic) IRGVentanaPrincipalViewController *delegado;

@end

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


# pragma mark - Metodos de activar y desactivar botones
-(void) activarBotonPrincipal{
    self.delegado.botonPrincipal.enabled = true;
    self.delegado.etiquetaBotonPrincipal.enabled = true;
}

-(void) desactivarBotonPrincipal{
    self.delegado.botonPrincipal.enabled  = false;
    self.delegado.etiquetaBotonPrincipal.enabled = false;
}

-(void) activarBotonPausar{
    self.delegado.botonPausar.enabled = true;
    self.delegado.etiquetaBotonPausar.enabled = true;
}

-(void) desactivarBotonPausar{
    self.delegado.botonPausar.enabled  = false;
    self.delegado.etiquetaBotonPausar.enabled = false;
}

- (void) activarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = true;
    self.delegado.etiquetaBotonMostrarMejoresTiempos.enabled = true;
}

- (void) desactivarBotonMejoresTiempos{
    self.delegado.botonMostrarMejoresTiempos.enabled = false;
    self.delegado.etiquetaBotonMostrarMejoresTiempos.enabled = false;
}

- (void) activarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = TRUE;
    self.delegado.etiquetaBotonMostrarMinas.enabled = true;
}

- (void) desactivarBotonMostrarMinas{
    self.delegado.botonMostrarMinas.enabled = false;
    self.delegado.etiquetaBotonMostrarMinas.enabled = false;
}

- (void) activarTextFieldNumeroDeMinas{
    self.delegado.totalMinas.enabled = true;
    self.delegado.etiquetaTextFieldTotalMinas.enabled = true;
}

- (void) desactivarTextFieldNumeroDeMinas{
    self.delegado.totalMinas.enabled = false;
    self.delegado.etiquetaTextFieldTotalMinas.enabled = false;
}


-(void) establecerBotonYEtiquetaBotonMostrarMinasModoNormal{
    self.delegado.etiquetaBotonMostrarMinas.textColor = [IRGPincel sharedPincel].colorEtiquetaDeBotonNormal;
}



@end
