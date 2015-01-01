//
//  IRGVentanaPrincipalViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRGGestionarBotonera.h"
#import "IRGSettingsViewController.h"
@class  IRGGestorDeEstados;


@class IRGCeldaViewController;

@interface IRGVentanaPrincipalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (nonatomic) IBOutlet UIView *vistaCanvasDeLasCeldas;

@property (weak, nonatomic) IBOutlet UILabel *labelEstadoDelJuego;

//botoneras
@property (weak, nonatomic) IBOutlet UIView *vistaBarraDeBotones;
@property (weak, nonatomic) IBOutlet UIView *vistaBarraDeBotonesVertical;

@property (weak, nonatomic) IBOutlet UIButton *botonSettings;
@property (weak, nonatomic) IBOutlet UIButton *botonSettingsVertical;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMinasVertical;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMejoresTiempos;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMejoresTiempoVertical;
@property (weak, nonatomic) IBOutlet UIButton *botonPausar;
@property (weak, nonatomic) IBOutlet UIButton *botonPausarVertical;
@property (weak, nonatomic) IBOutlet UIButton *botonJugarSecundario;
@property (weak, nonatomic) IBOutlet UIButton *botonJugarSecundarioVertical;

@property (weak, nonatomic) IBOutlet UIView *vistaBotonJugarSecundario;
@property (weak, nonatomic) IBOutlet UIView *vistaBotonJugarSecundarioVertical;


@property (weak, nonatomic) IBOutlet UIView *vistaTiempoYMinas;
@property (weak, nonatomic) IBOutlet UITextField *totalMinas;
@property (weak, nonatomic) IBOutlet UIView *cuentaAtras;
@property (weak, nonatomic) IBOutlet UIImageView *vistaImagenDeFondo;
@property (weak, nonatomic) IBOutlet UIImageView *vistaModoAyuda;

@property (nonatomic) NSInteger banderasPuestas;
@property (nonatomic,weak) NSTimer *reloj;

@property (nonatomic) IRGGestionarBotonera *gestionarBotonera;
@property (nonatomic) IRGGestorDeEstados * gestorDeEstados;


// delegados de Estados del juego
- (void) iniciarJuego;
- (void) delegadoMostrarMinas;
- (void) ocultarTodasLasMinas;
- (void) delegadoPausarJuego;
- (void) delegadoReanudarJuego;
- (void) delegadoMostrarVentanaDeConfiguracion;
- (void) propagaTouch:(IRGCeldaViewController *)celdaViewController;
- (void) actualizaMinasPendientes;
- (NSInteger) calcularPorcentajeDeProgreso;
- (void) acabarJuegoConError;
- (void) acabarJuegoSinErrorSinAyuda;
- (void) acabarJuegoSinErrorConAyuda;
- (void) mostrarBotonVentanaDeAyuda;
- (void) establecerFrameDelCanvasDeLasCeldas;
- (void) ocultarBotonVentanaDeAyuda;

- (void) restaurarEstado;


//delegados de Celdas
- (void) ponerBandera:(IRGCeldaViewController *)celda;
- (void) despejarCelda: (IRGCeldaViewController *)celda;

// delegado de configuracion
- (void) cambiarTransparenciaDelMenu:(float) porcentajeDeTransparencia;
- (void) establecerImagenesDeLosBotones;

// generales
- (BOOL) iPadVertical;

@end
