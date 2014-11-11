//
//  IRGVentanaPrincipalViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IRGCeldaViewController;

@interface IRGVentanaPrincipalViewController : UIViewController
@property (nonatomic) NSInteger altoDelCanvas;

@property (weak, nonatomic) IBOutlet UITextField *totalMinas;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonPrincipal;





-(void) celdaPulsada:(IRGCeldaViewController *)celdaPulsada;
-(void) celdaDoblePulsada: (IRGCeldaViewController *)celdaDoblePulsada;

-(void) actualizaMinasPendientes;

- (void) activarBotonMostrarMinas;
- (void) desactivarBotonMostrarMinas;
- (void) activarBotonMejoresTiempos;
- (void) desactivarBotonMejoresTiempos;
- (void) activarBotonPrincipal;
- (void) desactivarBotonPrincipal;
- (void) activarTextFieldNumeroDeMinas;
- (void) desactivarTextFieldNumeroDeMinas;

- (void) iniciarJuego;
- (void) mostrarMinas;
- (void) ocultarMinas;
- (void) acabarJuegoConError;
- (void) propagaTouch:(IRGCeldaViewController *)celdaViewController;
- (NSInteger) actualizarBotonYBarraDeProgreso;
- (void) acabarJuegoSinErrorSinAyuda;
- (void) acabarJuegoSinErrorConAyuda;

@end
