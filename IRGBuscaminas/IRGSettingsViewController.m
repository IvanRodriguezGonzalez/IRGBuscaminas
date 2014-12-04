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

#pragma mark - Constantes
#define REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA 20
#define COLOR_DEL_BORDE_DE_LA_VENTANA [UIColor lightGrayColor]
#define GROSOR_DEL_BORDER_DE_LA_VENTANA 1

#pragma mark -
@interface IRGSettingsViewController ()
#pragma mark - Propiedades privadas

@property (weak, nonatomic) IBOutlet UITextField *numeroDeMinas;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeAyuda;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activarAyuda;
@property (weak, nonatomic) IBOutlet UISegmentedControl *nivelDeDificultad;
@property (weak, nonatomic) IBOutlet UISlider *porcentajeDeTransparenciaDeLasCeldas;

@property (weak, nonatomic) IBOutlet UISlider *porcentajeDeTransparenciaDelMenu;

@property (nonatomic) UIViewController * controllerPrincipal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accionTap;
@property (weak, nonatomic) IBOutlet UISlider *sensibilidadDelTap;

@end

#pragma mark -
@implementation IRGSettingsViewController

#pragma mark - Inicializadores
-(instancetype) init{
    self = [super init];
    self.view.frame = [[UIScreen mainScreen] applicationFrame];

    return self;
}

#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numeroDeMinas.text = [NSString stringWithFormat:@"%d",[IRGSettings sharedSettings].numeroDeMinas];
    self.tiempoDeAyuda.text = [NSString stringWithFormat:@"%d",[IRGSettings sharedSettings].tiempoDeAyuda];
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
    
    self.vistaDatos.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaDatos.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    self.vistaDatos.layer.cornerRadius = REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA;
    self.vistaDatos.layer.masksToBounds = YES;
    
  
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self.view];

    [self.nivelDeDificultad addTarget:self
                         action:@selector(actualizarMinasSegunElNivelDeDificultad)
               forControlEvents:UIControlEventValueChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
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
    
    if ([self iPadVertical]){
        self.vistaDatos.center = CGPointMake([UIApplication sharedApplication].keyWindow.frame.size.width/2,
                                       [UIApplication sharedApplication].keyWindow.frame.size.height /2);
    }
    else {
        self.vistaDatos.center = CGPointMake([UIApplication sharedApplication].keyWindow.frame.size.width/2+[IRGSettings sharedSettings].desplazamientoXDelCanvasEnModoHorizontal,
                                       [UIApplication sharedApplication].keyWindow.frame.size.height /2);
    }
    
}

- (IBAction)guardarResultados:(UIButton *)sender {
    [IRGSettings sharedSettings].numeroDeMinas = self.numeroDeMinas.text.integerValue;
    [IRGSettings sharedSettings].tiempoDeAyuda = self.tiempoDeAyuda.text.integerValue;
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
    [[IRGSettings sharedSettings] guardarSettings];
    [self.view removeFromSuperview];
}

-(void) actualizarMinasSegunElNivelDeDificultad{
    self.numeroDeMinas.text = [NSString stringWithFormat: @"%d",[[IRGSettings sharedSettings] numeroDeMInasPorDefectoDelNivel:self.nivelDeDificultad.selectedSegmentIndex+1]];
    self.tiempoDeAyuda.text = [NSString stringWithFormat: @"%d",[[IRGSettings sharedSettings] tiempoDeAyudaPorDefectoDelNivel:self.nivelDeDificultad.selectedSegmentIndex+1]];
}

- (IBAction)cambiarTransparenciaDeLasCeldas:(UISlider *)sender {
    for (IRGCeldaViewController *celdaViewController in [IRGDatos sharedDatos].todasLasCeldas){
        if (celdaViewController.estado == procesado){
            celdaViewController.view.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaCeldaProcesada colorWithAlphaComponent:1-sender.value] ;
        }
    }
}
- (IBAction)cambiarTransparenciaDelMenu:(UISlider *)sender {
    [self.senderViewController cambiarTransparenciaDelMenu:sender.value];
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
@end
