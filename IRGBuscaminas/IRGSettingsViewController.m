//
//  IRGSettingsViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 17/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSettingsViewController.h"
#import "IRGSettings.h"
#import "IRGDatos.h"
#import "IRGSettings.h"
#import "IRGGestorDeEstados.h"
#import "IRGMetodosComunes.h"
#import "IRGDisplaySieteSegmentosViewController.h"

#pragma mark - Constantes
#define REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA 20
#define COLOR_DEL_BORDE_DE_LA_VENTANA [UIColor lightGrayColor]
#define GROSOR_DEL_BORDER_DE_LA_VENTANA 1

#pragma mark -
@interface IRGSettingsViewController ()
#pragma mark - Propiedades privadas

@property (weak, nonatomic) IBOutlet UISegmentedControl *activarAyuda;
@property (weak, nonatomic) IBOutlet UISegmentedControl *nivelDeDificultad;
@property (weak, nonatomic) IBOutlet UISlider *porcentajeDeTransparenciaDeLasCeldas;

@property (weak, nonatomic) IBOutlet UISlider *porcentajeDeTransparenciaDelMenu;

@property (nonatomic) UIViewController * controllerPrincipal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accionTap;
@property (weak, nonatomic) IBOutlet UISlider *sensibilidadDelTap;

@property (weak, nonatomic) IBOutlet UIView *vistaDeLosFondos;

@property (weak, nonatomic) IBOutlet UIStepper *stepperGrupoDeImagenDeLosBotones;

@property (weak, nonatomic) IBOutlet UIView *vistaFondo00;
@property (weak, nonatomic) IBOutlet UIImageView *imagen00;

@property (weak, nonatomic) IBOutlet UIView *vistaFondo10;
@property (weak, nonatomic) IBOutlet UIImageView *imagen10;

@property (weak, nonatomic) IBOutlet UIView *vistaFondo01;
@property (weak, nonatomic) IBOutlet UIImageView *imagen01;
@property (weak, nonatomic) IBOutlet UIView *vistaFondo11;
@property (weak, nonatomic) IBOutlet UIImageView *imagen11;

@property (weak, nonatomic) IBOutlet UIView *vistaNumeroDeMinas;
@property (nonatomic) IRGDisplaySieteSegmentosViewController * numeroDeMinas7S;
@property (weak, nonatomic) IBOutlet UIStepper *stepperNumeroDeMinas;


@property (weak, nonatomic) IBOutlet UIView *vistaTiempoDeAyuda;
@property (nonatomic) IRGDisplaySieteSegmentosViewController * tiempoDeAyuda7S;
@property (weak, nonatomic) IBOutlet UIStepper *stepperTiempoDeAyuda;

@property (nonatomic) UIImage * fondoElegidoTemporal;
@end

#pragma mark -
@implementation IRGSettingsViewController

#pragma mark - Inicializadores
-(instancetype) init{
    self = [super init];
    return self;
}

#pragma mark - Overrides

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    
    [self borrarIndicadorDeFondoElegido];

    [self comprobarPulsacion:touch enFondo:self.vistaFondo00 conImagen:self.imagen00];

    [self comprobarPulsacion:touch enFondo:self.vistaFondo10 conImagen:self.imagen10];
    
    [self comprobarPulsacion:touch enFondo:self.vistaFondo01 conImagen:self.imagen01];

    [self comprobarPulsacion:touch enFondo:self.vistaFondo11 conImagen:self.imagen11];

}

-(void) borrarIndicadorDeFondoElegido{
    self.vistaFondo00.backgroundColor = [UIColor clearColor];
    self.vistaFondo01.backgroundColor = [UIColor clearColor];
    self.vistaFondo10.backgroundColor = [UIColor clearColor];
    self.vistaFondo11.backgroundColor = [UIColor clearColor];
}

- (void) comprobarPulsacion:(UITouch *) pulsacion
                    enFondo:(UIView *) vista
                         conImagen:(UIImageView *) imagen{
    if (CGRectContainsPoint(vista.frame, [pulsacion locationInView:self.vistaDeLosFondos]) ){
        vista.backgroundColor = [UIColor greenColor];
        self.senderViewController.vistaImagenDeFondo.image = imagen.image;
        self.fondoElegidoTemporal =imagen.image;
    }
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self inicializadorDeNumeroDeMinas];
    [self inicializadorTiempoDeAyuda];

    if ([IRGSettings sharedSettings].activarAyuda){
        self.activarAyuda.selectedSegmentIndex = 0;
    }
    else {
        self.activarAyuda.selectedSegmentIndex =1;
    }
    self.nivelDeDificultad.selectedSegmentIndex =[IRGSettings sharedSettings].dificultad-1;
    self.porcentajeDeTransparenciaDeLasCeldas.value = 1-[IRGSettings sharedSettings].porcerntajeDeTransparenciaDeLasCeldas;
    if ([IRGSettings sharedSettings].tapPoneBandera){
        self.accionTap.selectedSegmentIndex=0;
    }
    else {
        self.accionTap.selectedSegmentIndex =1;
    }
    self.sensibilidadDelTap.value = [IRGSettings sharedSettings].sensibilidadDelTap;
    self.porcentajeDeTransparenciaDelMenu.value =1-[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu;
    
    self.stepperGrupoDeImagenDeLosBotones.value = [IRGSettings sharedSettings].grupoDeImagenesDeLosBotones;
    UIImage *imagenDeIncrementoDeGrupoDeBotones = [UIImage imageNamed:@"stepper_derecha"];
    UIImage *imagenDeDecrementoDeGrupoDeBotones = [UIImage imageNamed:@"stepper_izquierda"];
    
    [self.stepperGrupoDeImagenDeLosBotones setIncrementImage:imagenDeIncrementoDeGrupoDeBotones forState:UIControlStateNormal];
   [self.stepperGrupoDeImagenDeLosBotones setDecrementImage:imagenDeDecrementoDeGrupoDeBotones forState:UIControlStateNormal];
    self.stepperGrupoDeImagenDeLosBotones.maximumValue =7;
    self.vistaDatos.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaDatos.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    self.vistaDatos.layer.cornerRadius = REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA;
    self.vistaDatos.layer.masksToBounds = YES;
    
    
    [self.nivelDeDificultad addTarget:self
                         action:@selector(actualizarMinasYTiempoDeAyudaSegunElNivelDeDificultad)
               forControlEvents:UIControlEventValueChanged];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation


-(void) deviceOrientationDidChange:(NSNotification *)sender{
    
}

- (IBAction)guardarResultados:(UIButton *)sender {
    [IRGSettings sharedSettings].numeroDeMinas = self.stepperNumeroDeMinas.value;
    [IRGSettings sharedSettings].tiempoDeAyuda = self.stepperTiempoDeAyuda.value;
    if (self.activarAyuda.selectedSegmentIndex == 0){
    [IRGSettings sharedSettings].activarAyuda  = true ;
    }
    else {
        [IRGSettings sharedSettings].activarAyuda  = false ;
    }
    [IRGSettings sharedSettings].dificultad = self.nivelDeDificultad.selectedSegmentIndex+1;
    [IRGSettings sharedSettings].porcerntajeDeTransparenciaDeLasCeldas = 1-self.porcentajeDeTransparenciaDeLasCeldas.value;
    [IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu = 1-self.porcentajeDeTransparenciaDelMenu.value;
    if (self.accionTap.selectedSegmentIndex==0){
        [IRGSettings sharedSettings].tapPoneBandera=true;
    }
    else {
        [IRGSettings sharedSettings].tapPoneBandera=false;
    }
    [IRGSettings sharedSettings].sensibilidadDelTap = self.sensibilidadDelTap.value;
    [IRGSettings sharedSettings].grupoDeImagenesDeLosBotones = self.stepperGrupoDeImagenDeLosBotones.value;
    [self.senderViewController establecerImagenesDeLosBotones];
    [IRGMetodosComunes guardarImagen:self.fondoElegidoTemporal
                           conNombre:ARCHIVO_IMAGEN_DEL_FONDO];
    
    [[IRGSettings sharedSettings] guardarSettings];
    
    [self.senderViewController.gestorDeEstados establecerEstado:self.senderViewController.gestorDeEstados.estadoDelJuegoEnJuego];
    
    [self.senderViewController iniciarJuego];
    
    [self.view removeFromSuperview];
    
}
- (IBAction)cancelar:(UIButton *)sender {
    [self.senderViewController restaurarEstado];
    [self restablecerTransparenciaDeLasCeldas];
    [self restaurarTransparenciaDelMenu];
    [self.view removeFromSuperview];

}

-(void) actualizarMinasYTiempoDeAyudaSegunElNivelDeDificultad{
    self.stepperNumeroDeMinas.value = [[IRGSettings sharedSettings] numeroDeMInasPorDefectoDelNivel:self.nivelDeDificultad.selectedSegmentIndex+1];
    [self.numeroDeMinas7S dibujarNumero:self.stepperNumeroDeMinas.value];
    
    self.stepperTiempoDeAyuda.value = [[IRGSettings sharedSettings] tiempoDeAyudaPorDefectoDelNivel:self.nivelDeDificultad.selectedSegmentIndex+1];
    [self.tiempoDeAyuda7S dibujarNumero:self.stepperTiempoDeAyuda.value];

}

- (IBAction)cambiarTransparenciaDeLasCeldas:(UISlider *)sender {
    for (IRGCeldaViewController *celdaViewController in [IRGDatos sharedDatos].todasLasCeldas){
        if (celdaViewController.estado == procesado){
            celdaViewController.view.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaCeldaProcesada colorWithAlphaComponent:1-sender.value] ;
        }
    }
}
- (IBAction)cambiarTransparenciaDelMenu:(UISlider *)sender {
    [self.senderViewController cambiarTransparenciaDelMenu:1-sender.value];
}



#pragma mark - Auxiliares

- (BOOL) iPadVertical{
    
    UIInterfaceOrientation newOrientation =  [UIApplication sharedApplication].statusBarOrientation;
    if ((newOrientation == UIInterfaceOrientationLandscapeLeft || newOrientation == UIInterfaceOrientationLandscapeRight)){
        return false;
    }
    else {
        return true;
    }
}

- (void) restablecerTransparenciaDeLasCeldas{
    for (IRGCeldaViewController *celdaViewController in [IRGDatos sharedDatos].todasLasCeldas){
        if (celdaViewController.estado == procesado){
            celdaViewController.view.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaCeldaProcesada colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDeLasCeldas];
        }
    }
}

-(void) restaurarTransparenciaDelMenu{
    [self.senderViewController cambiarTransparenciaDelMenu:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];

}
- (IBAction)cambiarGrupoDeImagenDelMenu:(id)sender {
    [IRGSettings sharedSettings].grupoDeImagenesDeLosBotones = self.stepperGrupoDeImagenDeLosBotones.value;
    [self.senderViewController establecerImagenesDeLosBotones];
}

- (void) inicializadorDeNumeroDeMinas{
    self.stepperNumeroDeMinas.value = [IRGSettings sharedSettings].numeroDeMinas;
    [self crear7SDeNumeroDeMinas];
}


-(void) crear7SDeNumeroDeMinas{
    CGRect frameDelNumeroDeMinas7S  = CGRectMake(0,0,
                                                self.vistaNumeroDeMinas.frame.size.width,
                                                self.vistaNumeroDeMinas.frame.size.height);
    
    self.numeroDeMinas7S = [[IRGDisplaySieteSegmentosViewController alloc]
                            initWithNibName:nil
                            bundle:nil
                            withFrame:frameDelNumeroDeMinas7S
                            withRedondeoDeLasEsquinas:0
                            cantidadDeCeldas7S:2];
    [self.vistaNumeroDeMinas addSubview:self.numeroDeMinas7S.view];
    
    [self.numeroDeMinas7S establecerVentanaConTransparencia:0
                                               colorDeFondo:[UIColor whiteColor]];
    
    [self.numeroDeMinas7S  establecerSegmentoConGrosorDelTrazo:1
                                             grosorDelSegmento:3
                                      separacionEntreSegmentos:0
                     separacionHorizontalDelSegmentoConLaVista:2
                       separacionVerticalDelSegmentoConLaVista:3
                                         colorDelTrazoDelBorde:[UIColor blackColor]
                                               colorDelRelleno:[UIColor redColor]
                                       transparenciaDelRelleno:1];
    
    [self.numeroDeMinas7S dibujarNumero:[IRGSettings sharedSettings].numeroDeMinas];
    
}
- (IBAction)cambiarNumeroDeMinas:(UIStepper *)sender {
    [self.numeroDeMinas7S dibujarNumero:sender.value];
}


- (void) inicializadorTiempoDeAyuda{
    self.stepperTiempoDeAyuda.value = [IRGSettings sharedSettings].tiempoDeAyuda;
    [self crear7SDeTiempoDeAyuda];
}
-(void) crear7SDeTiempoDeAyuda{
    CGRect frameDelTiempoDeAyuda7S  = CGRectMake(0,0,
                                                 self.vistaTiempoDeAyuda.frame.size.width,
                                                 self.vistaTiempoDeAyuda.frame.size.height);
    
    self.tiempoDeAyuda7S = [[IRGDisplaySieteSegmentosViewController alloc]
                            initWithNibName:nil
                            bundle:nil
                            withFrame:frameDelTiempoDeAyuda7S
                            withRedondeoDeLasEsquinas:0
                            cantidadDeCeldas7S:2];
    
    [self.vistaTiempoDeAyuda addSubview:self.tiempoDeAyuda7S.view];
    
    [self.tiempoDeAyuda7S establecerVentanaConTransparencia:0
                                               colorDeFondo:[UIColor whiteColor]];
    
    [self.tiempoDeAyuda7S  establecerSegmentoConGrosorDelTrazo:1
                                             grosorDelSegmento:3
                                      separacionEntreSegmentos:0
                     separacionHorizontalDelSegmentoConLaVista:2
                       separacionVerticalDelSegmentoConLaVista:3
                                         colorDelTrazoDelBorde:[UIColor blackColor]
                                               colorDelRelleno:[UIColor blueColor]
                                       transparenciaDelRelleno:1];
    
    [self.tiempoDeAyuda7S dibujarNumero:[IRGSettings sharedSettings].tiempoDeAyuda];
    
}
- (IBAction)cambiarTiempoDeAyuda:(UIStepper *)sender {
    [self.tiempoDeAyuda7S dibujarNumero:sender.value];
}


@end
