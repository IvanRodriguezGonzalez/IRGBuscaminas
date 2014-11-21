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
#import "IRGGestorDeEstados.h"
#import "IRGGestionarBotonera.h"
#import "IRGSettingsViewController.h"
#import "IRGVistaPorcentajeDeAvanceViewController.h"
#import "IRGSettings.h"


@interface IRGVentanaPrincipalViewController ()
@property (nonatomic)  NSInteger numeroDeFilas;
@property (nonatomic)  NSInteger numeroDeColumnas;
@property (nonatomic) int tiempoDeJuegoEnSegundos;

@property (nonatomic) IRGGestorDeEstados *gestorDeEstados;

@property (weak, nonatomic) IBOutlet UIProgressView *barraDeProgreso;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeJuego;
@property (weak, nonatomic) IBOutlet UIImageView *imagenDeBloqueo;
@property(nonatomic) IRGVistaPorcentajeDeAvanceViewController *vistaConPorcentajeDeAvanceViewController;

@property (nonatomic) IRGSettingsViewController * vistaDeConfiguracion;


@end

@implementation IRGVentanaPrincipalViewController

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    [self iniciarGestionarBotonera];
    [self iniciarVistaConPorcentajeDeAvance];
    [self iniciarGestorDeEstados];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self ocultarrBarraDeNavegacion];
}


#pragma mark - Navigation primer nivel

- (IBAction)mostrarConfiguracion:(UIButton *)sender {
    self.vistaDeConfiguracion =[[IRGSettingsViewController alloc]init];
    [self.canvas addSubview:self.vistaDeConfiguracion.view];
    
    
}


- (IBAction)mostrarMenu:(UIButton *)sender {
    CGRect frame = CGRectMake(0,0,100,self.view.frame.size.height);
    UIView * vista =[[UIView alloc]initWithFrame:frame];
    vista.backgroundColor = [UIColor redColor];
    [self.view addSubview:vista];
    [self.view sendSubviewToBack:vista];
    [self.view bringSubviewToFront:vista];
}


- (IBAction)accionJugar:(UIButton *)sender {
    [self.gestorDeEstados accionJugar];
}


- (IBAction)accionMostrarMinas:(UIButton *)sender {
    [self.gestorDeEstados accionMostrarMinas];
}

- (IBAction)accionMostarMejoresTiempos:(UIButton *)sender {
   // [self mostrarBarraDeNavegacion];
    [self crearVistaDeMejoresTiempos];
    
}

-(IBAction)accionPausar:(UIButton *)sender{
    [self.gestorDeEstados accionPausar];
}

# pragma mark Navigation segundo nivel

-(void) mostrarMinas{
    [self mostrarTodasLasMinas];
    [self establecerFondoDeAyuda];
    [self actualizarBotonConProgreso:0];
    [self establecerBotonYEtiquetaBotonMostrarMinasModoMostrandoAyuda];
}

-(void) ocultarMinas{
    [self ocultarTodasLasMinas];
    [self establecerFondoNeutro];
    [self.gestionarBotonera establecerBotonYEtiquetaBotonMostrarMinasModoNormal];
}

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
    [self.gestorDeEstados celdaDoblePulsada:celdaPulsada];
}

- (void) celdaPulsada:(IRGCeldaViewController *)celdaDoblePulsada{
    [self.gestorDeEstados celdaPulsada:celdaDoblePulsada];
}

# pragma mark Delegado segundo nivel

-(void) propagaTouch:(IRGCeldaViewController *)celdaViewController{
    if (!celdaViewController.estado == procesado){
        
        celdaViewController.estado = procesado;
        [celdaViewController dibujarEstado];
        
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

-(void) iniciarVistaConPorcentajeDeAvance{
    IRGVistaPorcentajeDeAvanceViewController *vistaConPorcentajeDeAvanceViewController = [[IRGVistaPorcentajeDeAvanceViewController alloc]initConFrame:self.botonPrincipal.frame];
    [self.barraBotonera addSubview:vistaConPorcentajeDeAvanceViewController.view];
    self.vistaConPorcentajeDeAvanceViewController = vistaConPorcentajeDeAvanceViewController;
    
}

-(void) iniciarGestionarBotonera{
    self.gestionarBotonera = [[IRGGestionarBotonera alloc]initConSender:self];
}

- (void) iniciarGestorDeEstados{
    self.gestorDeEstados = [[IRGGestorDeEstados alloc]initConDelegado:self];
}

- (void) iniciarJuego{
    
    [self.totalMinas resignFirstResponder];
    [[IRGDatos sharedDatos] borrarJuego];
    [self borrarCanvas];
    [self generarCanvas];
    [self generarMinas];
    
    [self actualizarBotonYBarraDeProgreso];
    [self iniciarBarraDeProgreso];
    [self establecerFondoNeutro];
    [self inicializarTiempoDeJuego];
    [self iniciarReloj];
}

-(void) acabarJuegoConError{
    [self mostrarTodasLasMinas];
    [self establecerImagenDelBotonPrincipal:@"error"];
    [self establecerFondoDeError];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
}

- (void) acabarJuegoSinErrorSinAyuda{
    [self establecerFondoDeVictoria];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGDatos sharedDatos].numeroDeMinas
                          conAyuda:FALSE];
}

- (void) acabarJuegoSinErrorConAyuda{
    [self establecerFondoDeVictoria];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
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


- (void) generarMinas{
    for (int numeroDeMinas = 0;numeroDeMinas < [IRGSettings sharedSettings].numeroDeMinas;numeroDeMinas++){
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
}

- (void) recuperarNumeroDeMinasPendietes{
    self.totalMinas.text = [NSString stringWithFormat:@"%d",[[IRGDatos sharedDatos] numeroDeMinas]];
}

- (NSInteger) actualizarBotonYBarraDeProgreso{
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
    [self.vistaConPorcentajeDeAvanceViewController dibujarAvance:porcentajeDeAvance];
    return porcentajeDeAvance;
}

-(void) iniciarBarraDeProgreso{
    [self.barraDeProgreso setProgress:0 animated:true];
}


# pragma mark - Auxiliares tercer nivel

-(void) actualizarBotonConProgreso:(float)porcentajeDeAvance{
    
    //      [self establecerImagenDelBotonPrincipal:@"modoAyuda"];
     
    if (porcentajeDeAvance == 1) {
        [self establecerImagenDelBotonPrincipal:@"igualA100"];
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

- (void) mostrarImagenSobreElCanvas:(NSString *)imagen {
    self.imagenDeBloqueo.image = [UIImage imageNamed:imagen];
    self.imagenDeBloqueo.backgroundColor = [UIColor lightGrayColor];
    [self.canvas bringSubviewToFront:self.imagenDeBloqueo];
}

-(void) eliminarImagenSobreElCanvas{
    [self.canvas sendSubviewToBack:self.imagenDeBloqueo];
    self.imagenDeBloqueo.backgroundColor = [UIColor clearColor];
    self.imagenDeBloqueo.image = nil;
}

#pragma mark - Activacion y Desactivacion de botones y barras

-(void) mostrarBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:false animated:FALSE];
}
-(void) ocultarrBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:true animated:false];
}
- (void) establecerBotonYEtiquetaBotonMostrarMinasModoMostrandoAyuda{
    self.etiquetaBotonMostrarMinas.textColor = [IRGPincel sharedPincel].colorEtiquetaDeBotonSeleccionado;
}


@end
