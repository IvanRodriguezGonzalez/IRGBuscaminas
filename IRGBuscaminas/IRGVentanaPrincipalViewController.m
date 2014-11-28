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
#import "IRGSettings.h"
#import "IRGNUmeroSieteSegmentosViewController.h"


@interface IRGVentanaPrincipalViewController ()
@property (nonatomic)  NSInteger numeroDeFilas;
@property (nonatomic)  NSInteger numeroDeColumnas;
@property (nonatomic) int tiempoDeJuegoEnSegundos;

@property (nonatomic) IRGGestorDeEstados *gestorDeEstados;

@property (weak, nonatomic) IBOutlet UIProgressView *barraDeProgreso;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeJuegoSegundos;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeJuegoMinutos;
@property (weak, nonatomic) IBOutlet UIImageView *imagenDeBloqueo;

@property (nonatomic) IRGSettingsViewController * vistaDeConfiguracion;

@property (nonatomic) IRGNUmeroSieteSegmentosViewController * unidadMinas;
@property (nonatomic) IRGNUmeroSieteSegmentosViewController * decenaMinas;

@property (nonatomic) IRGNUmeroSieteSegmentosViewController * unidadSegundos;
@property (nonatomic) IRGNUmeroSieteSegmentosViewController * decenasSegundos;
@property (nonatomic) IRGNUmeroSieteSegmentosViewController * unidadMinutos;
@property (nonatomic) IRGNUmeroSieteSegmentosViewController * decenasMinutos;

@property (weak, nonatomic) IBOutlet UITextField *separadorMinutosDeSegundos;



@end

@implementation IRGVentanaPrincipalViewController

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    [self iniciarGestionarBotonera];
    [self iniciarGestorDeEstados];
    [self iniciarTotalMinasSieteSegmentos];
    [self iniciarTiempoDeJuegoSieteSegmentos];
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
    
    /*
    [self.canvas addSubview:self.vistaDeConfiguracion.view];
    
    float posicionX =(self.canvas.frame.size.width-self.vistaDeConfiguracion.view.frame.size.width)/2;
    float posicionY = (self.canvas.frame.size.height-self.vistaDeConfiguracion.view.frame.size.height)/2;
    float ancho = self.vistaDeConfiguracion.view.frame.size.width;
    float alto = self.vistaDeConfiguracion.view.frame.size.height;
    CGRect settingsFrame = CGRectMake(posicionX, posicionY, ancho, alto);
//    self.vistaDeConfiguracion.view.frame = settingsFrame;

    [self.gestionarBotonera desactivarSettings];
*/
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
    NSInteger banderasPendientes = [IRGSettings sharedSettings].numeroDeMinas;
    banderasPendientes = banderasPendientes-banderasPuestas;
    
    self.decenaMinas.valorADibujar = banderasPendientes/10;
    self.unidadMinas.valorADibujar = banderasPendientes%10;
}
#pragma mark - Auxiliares primer nivel

-(void) iniciarTiempoDeJuegoSieteSegmentos{

    CGRect unidadSegundosFrame = CGRectMake(self.tiempoDeJuegoSegundos.frame.size.width/2,0,self.tiempoDeJuegoSegundos.frame.size.width/2,self.tiempoDeJuegoSegundos.frame.size.height);
    
    CGRect decenasSegundposFrame = CGRectMake(0,0,self.tiempoDeJuegoSegundos.frame.size.width/2,self.tiempoDeJuegoSegundos.frame.size.height);
    self.unidadSegundos = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                               bundle:nil
                                                                            withFrame:unidadSegundosFrame
                                                            withRedondeoDeLasEsquinas:0];
    
    self.decenasSegundos = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                               bundle:nil
                                                                            withFrame:decenasSegundposFrame
                                                            withRedondeoDeLasEsquinas:0];
    
    [self.tiempoDeJuegoSegundos addSubview:self.unidadSegundos.view];
    [self.tiempoDeJuegoSegundos addSubview:self.decenasSegundos.view];
    
    [self.unidadSegundos establecerVentanaConTransparencia:.5
                                           colorDeFondo:[UIColor lightGrayColor]];
    [self.decenasSegundos establecerVentanaConTransparencia:.5
                                           colorDeFondo:[UIColor lightGrayColor]];
    
    [self.unidadSegundos  establecerSegmentoConGrosorDelTrazo:1
                                         grosorDelSegmento:10
                                  separacionEntreSegmentos:0
                 separacionHorizontalDelSegmentoConLaVista:5
                   separacionVerticalDelSegmentoConLaVista:5
                                     colorDelTrazoDelBorde:[UIColor blackColor]
                                           colorDelRelleno:[UIColor blueColor]
                                   transparenciaDelRelleno:1];
    
    [self.decenasSegundos  establecerSegmentoConGrosorDelTrazo:1
                                         grosorDelSegmento:10
                                  separacionEntreSegmentos:0
                 separacionHorizontalDelSegmentoConLaVista:5
                   separacionVerticalDelSegmentoConLaVista:5
                                     colorDelTrazoDelBorde:[UIColor blackColor]
                                           colorDelRelleno:[UIColor blueColor]
                                   transparenciaDelRelleno:1];
    
    self.unidadSegundos.valorADibujar = 0;
    self.decenasSegundos.valorADibujar = 0;
    
    
    
    CGRect unidadMinutosFrame = CGRectMake(self.tiempoDeJuegoMinutos.frame.size.width/2,0,self.tiempoDeJuegoMinutos.frame.size.width/2,self.tiempoDeJuegoMinutos.frame.size.height);
    
    CGRect decenasMinutosFrame = CGRectMake(0,0,self.tiempoDeJuegoMinutos.frame.size.width/2,self.tiempoDeJuegoMinutos.frame.size.height);
    self.unidadMinutos = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                                  bundle:nil
                                                                               withFrame:unidadMinutosFrame
                                                               withRedondeoDeLasEsquinas:0];
    
    self.decenasMinutos = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                                   bundle:nil
                                                                                withFrame:decenasMinutosFrame
                                                                withRedondeoDeLasEsquinas:0];
    
    [self.tiempoDeJuegoMinutos addSubview:self.unidadMinutos.view];
    [self.tiempoDeJuegoMinutos addSubview:self.decenasMinutos.view];
    
    [self.unidadMinutos establecerVentanaConTransparencia:.5
                                              colorDeFondo:[UIColor lightGrayColor]];
    [self.decenasMinutos establecerVentanaConTransparencia:.5
                                               colorDeFondo:[UIColor lightGrayColor]];
    
    [self.unidadMinutos  establecerSegmentoConGrosorDelTrazo:1
                                            grosorDelSegmento:8
                                     separacionEntreSegmentos:0
                    separacionHorizontalDelSegmentoConLaVista:5
                      separacionVerticalDelSegmentoConLaVista:5
                                        colorDelTrazoDelBorde:[UIColor blackColor]
                                              colorDelRelleno:[UIColor blueColor]
                                      transparenciaDelRelleno:1];
    
    [self.decenasMinutos  establecerSegmentoConGrosorDelTrazo:1
                                             grosorDelSegmento:8
                                      separacionEntreSegmentos:0
                     separacionHorizontalDelSegmentoConLaVista:5
                       separacionVerticalDelSegmentoConLaVista:5
                                         colorDelTrazoDelBorde:[UIColor blackColor]
                                               colorDelRelleno:[UIColor blueColor]
                                       transparenciaDelRelleno:1];
    
    self.unidadMinutos.valorADibujar = 0;
    self.decenasMinutos.valorADibujar = 0;
    
    self.separadorMinutosDeSegundos.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.5];
    self.separadorMinutosDeSegundos.textColor = [UIColor blueColor];
    
}

-(void) iniciarTotalMinasSieteSegmentos {
    
    CGRect unidadMinas = CGRectMake(self.totalMinas.frame.size.width/2,0,self.totalMinas.frame.size.width/2,self.totalMinas.frame.size.height);
    CGRect decenaMinas = CGRectMake(0,0,self.totalMinas.frame.size.width/2,self.totalMinas.frame.size.height);
    self.unidadMinas = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                               bundle:nil
                                                                            withFrame:unidadMinas
                                                            withRedondeoDeLasEsquinas:0];
    
    self.decenaMinas = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                               bundle:nil
                                                                            withFrame:decenaMinas
                                                            withRedondeoDeLasEsquinas:0];
    
    [self.totalMinas addSubview:self.unidadMinas.view];
    [self.totalMinas addSubview:self.decenaMinas.view];
    
    [self.unidadMinas establecerVentanaConTransparencia:.5
                                           colorDeFondo:[UIColor lightGrayColor]];
    [self.decenaMinas establecerVentanaConTransparencia:.5
                                           colorDeFondo:[UIColor lightGrayColor]];
    
    [self.unidadMinas  establecerSegmentoConGrosorDelTrazo:1
                                         grosorDelSegmento:8
                                  separacionEntreSegmentos:0
                 separacionHorizontalDelSegmentoConLaVista:5
                   separacionVerticalDelSegmentoConLaVista:5
                                     colorDelTrazoDelBorde:[UIColor blackColor]
                                           colorDelRelleno:[UIColor redColor]
                                   transparenciaDelRelleno:1];
    
    [self.decenaMinas  establecerSegmentoConGrosorDelTrazo:1
                                         grosorDelSegmento:8
                                  separacionEntreSegmentos:0
                 separacionHorizontalDelSegmentoConLaVista:5
                   separacionVerticalDelSegmentoConLaVista:5
                                     colorDelTrazoDelBorde:[UIColor blackColor]
                                           colorDelRelleno:[UIColor redColor]
                                   transparenciaDelRelleno:1];

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
    [self actualizaMinasPendientes];
    [self iniciarBarraDeProgreso];
    [self establecerFondoNeutro];
    [self inicializarTiempoDeJuego];
    [self iniciarReloj];
}

-(void) acabarJuegoConError{
    [self mostrarTodasLasMinas];
    [self establecerImagenDelBotonPrincipal:@"minaApagada"];
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
                     numeroDeMinas:[IRGSettings sharedSettings].numeroDeMinas
                          conAyuda:FALSE];
}

- (void) acabarJuegoSinErrorConAyuda{
    [self establecerFondoDeVictoria];
    [self recuperarNumeroDeMinasPendietes];
    [self detenerRelor];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGSettings sharedSettings].numeroDeMinas
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
    
    
    self.decenaMinas.valorADibujar = [IRGSettings sharedSettings].numeroDeMinas/10;
    self.unidadMinas.valorADibujar = [IRGSettings sharedSettings].numeroDeMinas%10;
}

- (NSInteger) actualizarBotonYBarraDeProgreso{
    NSArray *todasLasCeldas = [IRGDatos sharedDatos].todasLasCeldas;
    Float32 totalCeldas = [todasLasCeldas count];
    totalCeldas = totalCeldas - [IRGSettings sharedSettings].numeroDeMinas;
    
    Float32 totalCeldasProcesadas = 0;
    for (IRGCeldaViewController * celdaViewController in todasLasCeldas){
        if (celdaViewController.estado == procesado){
            totalCeldasProcesadas++;
        }
    }
    Float32 porcentajeDeAvance = (totalCeldasProcesadas/totalCeldas);
    
    [self actualizarBotonConProgreso:porcentajeDeAvance];
    [self actualizarBarraDeProgresoConProgreso:porcentajeDeAvance];
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
    [self actualizarTiempoDeJuego];
}

- (void) actualizarTiempoDeJuego{
    
    if (self.tiempoDeJuegoEnSegundos > ((59*60)+59)){
        self.tiempoDeJuegoEnSegundos = 59*60+59;
    }
    int segundosEnJuego = self.tiempoDeJuegoEnSegundos % 60;
    
    self.unidadSegundos.valorADibujar = segundosEnJuego %10;
    self.decenasSegundos.valorADibujar = segundosEnJuego /10;
    
    int minutosEnJuego =(self.tiempoDeJuegoEnSegundos /60) % 60;
    
    self.unidadMinutos.valorADibujar = minutosEnJuego %10;
    self.decenasMinutos.valorADibujar = minutosEnJuego /10;
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
