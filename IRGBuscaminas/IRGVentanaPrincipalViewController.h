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
-( void) mostrarMinasxx;
-(void) ocultarMinasxx;



/*

- (void) borrarCanvas;
- (void) generarCanvas;
- (void) actualizarNumeroDeMinas;
- (void) generarMinas;
- (void) actualizarBotonYBarraDeProgreso;
- (void) iniciarBarraDeProgreso;
- (void) establecerFondoNeutro;
- (void) inicializarTiempoDeJuego;
-(void) iniciarReloj;
 */

@end
