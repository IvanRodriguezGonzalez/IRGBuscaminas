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

//designatedInitializer
-(instancetype) initConSender:(IRGVentanaPrincipalViewController *)sender;


#pragma mark - Metodos de activar y desactivar botones

-(void) activarBotonPrincipal;

-(void) desactivarBotonPrincipal;

-(void) activarBotonPausar;

-(void) desactivarBotonPausar;

- (void) activarBotonMejoresTiempos;

- (void) desactivarBotonMejoresTiempos;

- (void) activarBotonMostrarMinas;

- (void) desactivarBotonMostrarMinas;

- (void) activarTextFieldNumeroDeMinas;

- (void) desactivarTextFieldNumeroDeMinas;


-(void) establecerBotonYEtiquetaBotonMostrarMinasModoNormal;




@end