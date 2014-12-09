//
//  IRGGestionarBotonera.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 11/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IRGVentanaPrincipalViewController;

@interface IRGGestionarBotonera : NSObject

#pragma mark - Inicializadores

//designatedInitializer
-(instancetype) initConSender:(IRGVentanaPrincipalViewController *)sender;


#pragma mark - Metodos publicos de activar y desactivar botones



- (void) activarBotonJugarSecundario;

- (void) desactivarBotonJugarSecundario;

- (void) activarBotonPausar;

- (void) desactivarBotonPausar;

- (void) activarBotonMejoresTiempos;

- (void) desactivarBotonMejoresTiempos;

- (void) activarBotonMostrarMinas;

- (void) desactivarBotonMostrarMinas;

- (void) activarSettings;

- (void) desactivarSettings;



- (void) mostrarVistaBotonJugarSecundario;

- (void) ocultarVistaBotonJugarSecundario;

- (void) mostrarBarraDeBotones;

- (void) ocultarBarraDeBotones;

- (void) mostrarVistaTiempoYMinas;

- (void) ocultarVistaTiempoYMinas;

- (void) bloquearBotones;

- (void) desbloquearBotones;

- (void) mostrarIndicadorModoAyuda;

- (void) ocultarIndicadorModoAyuda;

@end
