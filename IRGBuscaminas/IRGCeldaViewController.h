//
//  IRGCeldaViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    libre,
    procesado,
    conBandera,
    conDuda
} IRGEstados;

@class IRGVentanaPrincipalViewController;

@interface IRGCeldaViewController : UIViewController
#pragma mark - Propiedades publicas

@property (nonatomic) NSInteger numeroDeFila;
@property (nonatomic) NSInteger numeroDeColumna;
@property (nonatomic) BOOL tieneMina;
@property (nonatomic) IRGEstados estado;
@property (nonatomic) IRGVentanaPrincipalViewController *delegado;

#pragma mark - Inicializadores

//designated initializer
- (instancetype) initConNumeroDeFila:(NSInteger)numeroDeFila
                     numeroDeColumna:(NSInteger)numeroDeColumna
                         conDelegado:(IRGVentanaPrincipalViewController*)delegado;

#pragma mark - Metodos publicos

- (void) mostrarNumeroDeMinas;
- (void) mostrarMina;
- (void) ocultarMina;
- (void) dibujarEstado;
- (void) ocultarCelda;



@end
