//
//  IRGVentanaPrincipalViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#define NUMERO_DE_FILAS_POR_DEFECTO 10
#define NUMERO_DE_COLUMNAS_POR_DEFECTO 10

#import "IRGVentanaPrincipalViewController.h"
#import "IRGMetodosComunes.h"
#import "IRGPincel.h"
#import "IRGLienzo.h"
#import "IRGCeldaViewController.h"
#import "IRGDatos.h"
#import "IRGCelda.h"
#import "IRGMejoresTiemposViewController.h"
#import "IRGMejoresTiempos.h"
#import "IRGPreguntarNombreViewController.h"


@interface IRGVentanaPrincipalViewController ()
@property (nonatomic)  NSInteger numeroDeFilas;
@property (nonatomic)  NSInteger numeroDeColumnas;
@property (nonatomic) BOOL mostrarMinas;
@property (nonatomic) BOOL juegoAcabado;
@property (nonatomic) BOOL ayudaActivada;
@property (nonatomic) BOOL mostrandoAyuda;
@property (nonatomic) int tiempoDeJuegoEnSegundos;
@property (nonatomic,weak) NSTimer *reloj;

@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (weak, nonatomic) IBOutlet UITextField *totalMinas;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaTextFieldTotalMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonPrincipal;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonPrincipal;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMinas;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonMostrarMinas;

@property (weak, nonatomic) IBOutlet UIButton *botonMostrarMejoresTiempos;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaBotonMostrarMejoresTiempos;
@property (weak, nonatomic) IBOutlet UIProgressView *barraDeProgreso;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeJuego;


@end

@implementation IRGVentanaPrincipalViewController

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self ocultarrBarraDeNavegacion];
}



#pragma mark - Navigation primer nivel

- (IBAction)accionJugar:(UIButton *)sender {
    [self.totalMinas resignFirstResponder];
    [self iniciarJuego];
}


- (IBAction)accionMostrarMinas:(UIButton *)sender {
   
    if (!self.mostrarMinas){
        [self mostrarTodasLasMinas];
        [self activarModoAyuda];
        [self activarMostrandoAyuda];
        [self establecerFondoDeAyuda];
        [self actualizarBotonConProgreso:0];
        [self establecerBotonYEtiquetaBotonMostrarMinasModoMostrandoAyuda];
        [self desactivarBotonPrincipal];
    }
    else {
        [self ocultarTodasLasMinas];
        [self desactivarMostrandoAyuda];
        [self establecerFondoNeutro];
        [self establecerBotonYEtiquetaBotonMostrarMinasModoNormal];
        [self activarBotonPrincipal];
    }
    self.mostrarMinas = !self.mostrarMinas;
}

- (IBAction)accionMostarMejoresTiempos:(UIButton *)sender {
   // [self mostrarBarraDeNavegacion];
    [self crearVistaDeMejoresTiempos];
    
}

# pragma mark Navigation segundo nivel

-(void) mostrarTodasLasMinas{
    
    for (IRGCeldaViewController * celdaViewController in [[IRGDatos sharedDatos] todasLasCeldas]){
        [celdaViewController mostrarMina];
    }
}

-(void) ocultarTodasLasMinas{
    
    for (IRGCeldaViewController * celdaViewController in [[IRGDatos sharedDatos] todasLasCeldas]){
        [celdaViewController ocultarMina];
    }
}
- (void) crearVistaDeMejoresTiempos{
    
    NSBundle * bundle = [NSBundle mainBundle];
    IRGMejoresTiemposViewController *mejoresTiemposViewController = [[IRGMejoresTiemposViewController alloc] initWithNibName:@"IRGMejoresTiemposViewController" bundle:bundle];
    mejoresTiemposViewController.modalPresentationStyle =UIModalPresentationFormSheet;
    [self presentViewController:mejoresTiemposViewController animated:TRUE completion:nil];
}

#pragma mark - Delegado primer nivel

- (void) celdaDoblePulsada:(IRGCeldaViewController *)celdaPulsada{
    if ((!self.mostrandoAyuda)&(!self.juegoAcabado)){
        if (celdaPulsada.estado == libre){
            if ((celdaPulsada.tieneMina) ){
                [self acabarJuegoConError];
            }
            else {
                [self propagaTouch:celdaPulsada];
                [self actualizarBotonYBarraDeProgreso];
            }
        }
    }
}

- (void) celdaPulsada:(IRGCeldaViewController *)celdaDoblePulsada{
    if ((!self.mostrandoAyuda)&(!self.juegoAcabado)){
        switch (celdaDoblePulsada.estado)
        {
            case libre:
                celdaDoblePulsada.estado = conBandera;
                break;
            case conBandera:
                celdaDoblePulsada.estado = conDuda;
                break;
            case conDuda:
                celdaDoblePulsada.estado = libre ;
                break;
            default:
                NSLog (@"Estdo de celda no esperado");
                break;
        }
        [self actualizaMinasPendientes];
    }
}

# pragma mark Delegado segundo nivel

-(void) propagaTouch:(IRGCeldaViewController *)celdaViewController{
    if (!celdaViewController.estado == procesado){
        
        celdaViewController.estado = procesado;
        [celdaViewController dibujarComoCeldaVacia];
        
        if ([[IRGDatos sharedDatos] tieneMinasAlrededor:celdaViewController]){
            NSArray * celdasSinMinasAlrededorAPropagar= [[NSMutableArray alloc]init];
            celdasSinMinasAlrededorAPropagar =[[IRGDatos sharedDatos] celdasSinMinasAlrededorDe:celdaViewController incluyendoEsquinas:true];
            for (IRGCeldaViewController * celdeViewControllerTmp in celdasSinMinasAlrededorAPropagar ){
                [self propagaTouch:celdeViewControllerTmp];
            }
        }
        else {
            [celdaViewController mostrarNumeroDeMinas];
        }
    }
}

-(void) actualizaMinasPendientes{
    int banderasPuestas=0;
    for (IRGCeldaViewController *celdaViewController in [IRGDatos sharedDatos].todasLasCeldas){
        if (celdaViewController.estado == conBandera){
            banderasPuestas++;
        }
    }
    int banderasPendientes = [IRGDatos sharedDatos].numeroDeMinas;
    banderasPendientes = banderasPendientes-banderasPuestas;
    self.totalMinas.text = [NSString stringWithFormat:@"%d",banderasPendientes];
}
#pragma mark - Auxiliares primer nivel


- (void) iniciarJuego{
    self.juegoAcabado = false;
    [[IRGDatos sharedDatos] borrarJuego];
    [self borrarCanvas];
    [self generarCanvas];
    [self actualizarNumeroDeMinas];
    [self generarMinas];

    [self desactivarModoAyuda];
    [self desactivarMostrandoAyuda];
    [self activarBotonMostrarMinas];
    [self desactivarBotonMejoresTiempos];
    [self desactivarTextFieldNumeroDeMinas];

    [self actualizarBotonYBarraDeProgreso];
    [self iniciarBarraDeProgreso];
    [self establecerFondoNeutro];
    [self inicializarTiempoDeJuego];
    [self iniciarReloj];

}

-(void) acabarJuegoConError{
    [self mostrarTodasLasMinas];
    self.juegoAcabado = true;
    [self establecerImagenDelBotonPrincipal:@"error"];
    [self desactivarBotonMostrarMinas];
    [self activarBotonMejoresTiempos];
    [self activarTextFieldNumeroDeMinas];
    [self establecerFondoDeError];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
}

- (void) acabarJuegoSinErrorSinAyuda{
    self.juegoAcabado = true;
    [self activarTextFieldNumeroDeMinas];
    [self establecerFondoDeVictoria];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
    [self desactivarBotonMostrarMinas];
    [self activarBotonMejoresTiempos];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGDatos sharedDatos].numeroDeMinas
                          conAyuda:FALSE];
}

- (void) acabarJuegoSinErrorConAyuda{
    self.juegoAcabado = true;
    [self activarTextFieldNumeroDeMinas];
    [self establecerFondoDeVictoria];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
    [self desactivarBotonMostrarMinas];
    [self activarBotonMejoresTiempos];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGDatos sharedDatos].numeroDeMinas
                          conAyuda:true];

   }



# pragma mark - Auxiliares segundo nivel

-(NSString *) preguntarNombreConTiempo:(NSInteger)tiempo
                          Nombre:(NSString *)nombre
                  numeroDeCeldas:(NSInteger)numeroDeCeldas
                   numeroDeMinas:(NSInteger)numeroDeMinas
                        conAyuda:(bool)conAyuda{
    
    NSBundle *bunlde = [NSBundle mainBundle];
    
    IRGPreguntarNombreViewController * vistaPreguntarModalViewController = [[IRGPreguntarNombreViewController alloc]initWithNibName:@"IRGPreguntarNombreViewController" bundle:bunlde];
    vistaPreguntarModalViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    IRGDatoDelMejorTiempo *datoDelMejorTiempo = [[IRGDatoDelMejorTiempo alloc]initConTiempo:tiempo
                                                                                     nombre:nombre
                                                                             numeroDeCeldas:numeroDeCeldas
                                                                              numeroDeMinas:numeroDeMinas
                                                                          conAyuda:conAyuda];
    vistaPreguntarModalViewController.datoDelMejorTiempo = datoDelMejorTiempo;
    [self presentViewController:vistaPreguntarModalViewController animated:TRUE completion:nil];

    return datoDelMejorTiempo.nombre;
    
}



-(void) iniciarReloj{
    if (!self.reloj){
        self.reloj = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(actualizarTiempoDeJuego:)
                                                    userInfo:nil
                                                     repeats:true];
    }
    else {
        [self inicializarTiempoDeJuego];
    }
}

-(void) detenerRelor{
    [self.reloj invalidate];
};

- (void) actualizarTiempoDeJuego:(NSTimer *)timer{
    self.tiempoDeJuegoEnSegundos = self.tiempoDeJuegoEnSegundos+1;
    [self actualizarTiempoDeJuego];
    
}
- (void) generarCanvas{
    for (NSInteger fila = 0;fila < [IRGLienzo sharedLienzo].filasDelLienzo;fila++){
        for (NSInteger columna = 0; columna< [IRGLienzo sharedLienzo].columnasDelLienzo;columna++){
            
            IRGCeldaViewController *celdaViewController;
            celdaViewController= [self crearCeldaViewControllerConFila:fila
                                                            conColumna:columna];
            [self anadirAlCanvasElCeldaViewController:celdaViewController];
            [[IRGDatos sharedDatos] anadirCeldaViewController:celdaViewController];
        }
    }
}

- (void) borrarCanvas{
    for (UIView * vistaDelCanvas in self.canvas.subviews){
        if (vistaDelCanvas.class == [IRGCelda class]){
            [vistaDelCanvas removeFromSuperview];
        }
    }
}
-(void) establecerFondoNeutro{
    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaNormal;
}

- (void) establecerFondoDeError{

    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaDeError;
}

- (void) establecerFondoDeVictoria {
    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaDeVictoria;
}

-(void) establecerFondoDeAyuda{
    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaDeModoAyuda;
}

-(void) actualizarNumeroDeMinas{
    [IRGDatos sharedDatos].numeroDeMinas = [self.totalMinas.text intValue];
}

- (void) generarMinas{
    for (int numeroDeMinas = 0;numeroDeMinas < [IRGDatos sharedDatos].numeroDeMinas;numeroDeMinas++){
        NSInteger celdaConMina = [self generarNumeroAleatorioEntre:0
                                                                 Y:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo];
        
        IRGCeldaViewController * celdaViewController = [IRGDatos sharedDatos].todasLasCeldas[celdaConMina];
        
        if (!celdaViewController.tieneMina){
            celdaViewController.tieneMina = true;
        }
        else {
            numeroDeMinas --;
        }
    }
    self.mostrarMinas = false;
}

- (void) recuperarNumeroDeMinasPendietes{
    self.totalMinas.text = [NSString stringWithFormat:@"%d",[[IRGDatos sharedDatos] numeroDeMinas]];
}

-(void) actualizarBotonYBarraDeProgreso{
    NSArray *todasLasCeldas = [IRGDatos sharedDatos].todasLasCeldas;
    Float32 totalCeldas = [todasLasCeldas count];
    totalCeldas = totalCeldas - [IRGDatos sharedDatos].numeroDeMinas;
    
    Float32 totalCeldasProcesadas = 0;
    for (IRGCeldaViewController * celdaViewController in todasLasCeldas){
        if (celdaViewController.estado == procesado){
            totalCeldasProcesadas++;
        }
    }
    Float32 porcentajeDeAvance = (totalCeldasProcesadas/totalCeldas);
    [self actualizarBotonConProgreso:porcentajeDeAvance];
    [self actualizarBarraDeProgresoConProgreso:porcentajeDeAvance];
}


-(void) iniciarBarraDeProgreso{
    [self.barraDeProgreso setProgress:0 animated:true];
}



# pragma mark - Auxiliares tercer nivel

-(void) actualizarBotonConProgreso:(float)porcentajeDeAvance{
    
    if (self.ayudaActivada){
        [self establecerImagenDelBotonPrincipal:@"modoAyuda"];
        if (porcentajeDeAvance == 1){
            [self acabarJuegoSinErrorConAyuda];
        }
    }
    else {
        if (porcentajeDeAvance == 1) {
            [self establecerImagenDelBotonPrincipal:@"igualA100"];
            [self acabarJuegoSinErrorSinAyuda];
        }
        if (porcentajeDeAvance < 1) {
            [self establecerImagenDelBotonPrincipal:@"menorDe100"];
        }
        if (porcentajeDeAvance < .8) {
            [self establecerImagenDelBotonPrincipal:@"menorDe80"];
        }
        if (porcentajeDeAvance < .60) {
            [self establecerImagenDelBotonPrincipal:@"menorDe60"];
        }
        if (porcentajeDeAvance < .40) {
            [self establecerImagenDelBotonPrincipal:@"menorDe40"];
        }
        
        if (porcentajeDeAvance < .20) {
            [self establecerImagenDelBotonPrincipal:@"menorDe20"];
        }
    }
    
}

- (void) actualizarBarraDeProgresoConProgreso:(float)porcentajeDeAvance{
    [self.barraDeProgreso setProgress:porcentajeDeAvance animated:true];
}


- (void) establecerImagenDelBotonPrincipal:(NSString *)imagenNueva{
    [self.botonPrincipal setImage:[UIImage imageNamed:imagenNueva] forState:(normal) ];
}

- (IRGCeldaViewController *) crearCeldaViewControllerConFila:(NSInteger)fila
                                                  conColumna:(NSInteger)columna{
    IRGCeldaViewController *celdaViewController = [[IRGCeldaViewController alloc]initConNumeroDeFila:fila numeroDeColumna:columna conDelegado:self];
    return celdaViewController;
}

- (void) anadirAlCanvasElCeldaViewController:(IRGCeldaViewController *)celdaViewController{
    [self.canvas addSubview:celdaViewController.view];
}


- (NSInteger) generarNumeroAleatorioEntre:(NSInteger)numeroInferior
                                        Y:(NSInteger) numeroSuperior{
    NSInteger numeroAleatorio =numeroInferior+random()%numeroSuperior;
    return numeroAleatorio;
}

-(NSInteger) altoDelCanvas{
    return self.canvas.frame.size.height;
}

-(void) inicializarTiempoDeJuego{
    self.tiempoDeJuegoEnSegundos = 0;
    self.tiempoDeJuego.text =     @"00:00";
}
- (void) actualizarTiempoDeJuego{
  
    self.tiempoDeJuego.text = [IRGMetodosComunes formatearTiempoDeJuegoEnSegundos:self.tiempoDeJuegoEnSegundos];;
}

#pragma mark - Activacion y Desactivacion de botones y barras

-(void) activarBotonPrincipal{
    self.botonPrincipal.enabled = true;
    self.etiquetaBotonPrincipal.enabled = true;
}

-(void) desactivarBotonPrincipal{
    self.botonPrincipal.enabled  = false;
    self.etiquetaBotonPrincipal.enabled = false;
}

-(void) mostrarBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:false animated:FALSE];
}
-(void) ocultarrBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:true animated:false];
}

- (void) activarBotonMejoresTiempos{
    self.botonMostrarMejoresTiempos.enabled = true;
    self.etiquetaBotonMostrarMejoresTiempos.enabled = true;
}

- (void) desactivarBotonMejoresTiempos{
    self.botonMostrarMejoresTiempos.enabled = false;
    self.etiquetaBotonMostrarMejoresTiempos.enabled = false;
}

- (void) activarBotonMostrarMinas{
    self.botonMostrarMinas.enabled = TRUE;
    self.etiquetaBotonMostrarMinas.enabled = true;
}

- (void) desactivarBotonMostrarMinas{
    self.botonMostrarMinas.enabled = false;
    self.etiquetaBotonMostrarMinas.enabled = false;
}

- (void) activarTextFieldNumeroDeMinas{
    self.totalMinas.enabled = true;
    self.etiquetaTextFieldTotalMinas.enabled = true;
}

- (void) desactivarTextFieldNumeroDeMinas{
    self.totalMinas.enabled = false;
    self.etiquetaTextFieldTotalMinas.enabled = false;}

- (void) establecerBotonYEtiquetaBotonMostrarMinasModoMostrandoAyuda{
    self.etiquetaBotonMostrarMinas.textColor = [IRGPincel sharedPincel].colorEtiquetaDeBotonSeleccionado;
}

-(void) establecerBotonYEtiquetaBotonMostrarMinasModoNormal{
    self.etiquetaBotonMostrarMinas.textColor = [IRGPincel sharedPincel].colorEtiquetaDeBotonNormal;
}

# pragma mark - Activar y Desactivar estados

- (void) activarMostrandoAyuda{
    self.mostrandoAyuda = true;
}

- (void) desactivarMostrandoAyuda{
    self.mostrandoAyuda = false;
}


-(void) activarModoAyuda{
    self.ayudaActivada = true;
}

- (void) desactivarModoAyuda{
    self.ayudaActivada = false;
}

@end
