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

@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (weak, nonatomic) IBOutlet UIButton *botonSettings;
@property (weak, nonatomic) IBOutlet UIButton *botonSettingsVertical;

@property (weak, nonatomic) IBOutlet UITextField *totalMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonPrincipal;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMinasVertical;

@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMejoresTiempoVertical;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMejoresTiempos;

@property (weak, nonatomic) IBOutlet UIButton *botonPausar;
@property (weak, nonatomic) IBOutlet UIButton *botonPausarVertical;

@property (weak, nonatomic) IBOutlet UIView *cuentaAtras;

@property (nonatomic,weak) NSTimer *reloj;

@property (nonatomic) IRGGestionarBotonera *gestionarBotonera;
@property (weak, nonatomic) IBOutlet UIView *vistaBotonJugarPrincipal;
@property (weak, nonatomic) IBOutlet UIView *vistaBotonJugarSecundario;
@property (weak, nonatomic) IBOutlet UIView *vistaBotonJugarSecundarioVertical;

@property (weak, nonatomic) IBOutlet UIView *vistaBarraDeBotones;
@property (weak, nonatomic) IBOutlet UIView *vistaTiempoYMinas;
@property (nonatomic) IBOutlet UIView *vistaCanvasDeLasCeldas;

@property (weak, nonatomic) IBOutlet UIView *vistaBarraDeBotonesVertical;



-(void) ponerBandera:(IRGCeldaViewController *)celda;
-(void) despejarCelda: (IRGCeldaViewController *)celda;
- (void) propagaTouch:(IRGCeldaViewController *)celdaViewController;


- (void) iniciarJuego;
- (void) mostrarMinas;
- (void) ocultarMinas;
- (void) actualizaMinasPendientes;

- (void) acabarJuegoConError;
- (void) acabarJuegoSinErrorSinAyuda;
- (void) acabarJuegoSinErrorConAyuda;
- (void) inicializarTiempoDeJuego;
- (void) iniciarReloj;
- (void) detenerRelor;
- (void) mostrarImagenDeBloqueo:(NSString *)imagen;
- (void) eliminarImagenDeBloqueo;

- (NSInteger) calcularPorcentajeDeProgreso;
-(void) actualizarBotonConProgreso:(float)porcentajeDeAvance;


@end
