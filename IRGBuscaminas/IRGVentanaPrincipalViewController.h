//
//  IRGVentanaPrincipalViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRGGestionarBotonera.h"

@class IRGCeldaViewController;

@interface IRGVentanaPrincipalViewController : UIViewController
@property (nonatomic) NSInteger altoDelCanvas;

@property (weak, nonatomic) IBOutlet UITextField *totalMinas;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaTextFieldTotalMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonPrincipal;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonPrincipal;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMinas;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonMostrarMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMejoresTiempos;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonMostrarMejoresTiempos;
@property (weak, nonatomic) IBOutlet UIButton *botonPausar;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonPausar;
@property (nonatomic,weak) NSTimer *reloj;

@property (nonatomic) IRGGestionarBotonera *gestionarBotonera;





-(void) celdaPulsada:(IRGCeldaViewController *)celdaPulsada;
-(void) celdaDoblePulsada: (IRGCeldaViewController *)celdaDoblePulsada;

-(void) actualizaMinasPendientes;

- (void) recuperarNumeroDeMinasPendietes;
- (void) iniciarJuego;
- (void) mostrarMinas;
- (void) ocultarMinas;
- (void) acabarJuegoConError;
- (void) propagaTouch:(IRGCeldaViewController *)celdaViewController;
- (NSInteger) actualizarBotonYBarraDeProgreso;
- (void) acabarJuegoSinErrorSinAyuda;
- (void) acabarJuegoSinErrorConAyuda;
- (void) iniciarReloj;
- (void) inicializarTiempoDeJuego;
- (void) detenerRelor;
- (void) mostrarImagenSobreElCanvas:(NSString *)imagen;
- (void) eliminarImagenSobreElCanvas;




@end
