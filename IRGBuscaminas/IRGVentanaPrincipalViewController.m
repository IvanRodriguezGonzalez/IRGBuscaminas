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
#import "IRGSettings.h"
#import "IRGLienzo.h"
#import "IRGCeldaViewController.h"
#import "IRGDatos.h"
#import "IRGCelda.h"
#import "IRGMejoresTiemposViewController.h"
#import "IRGMejoresTiempos.h"
#import "IRGPreguntarNombreViewController.h"
#import "IRGGestionarBotonera.h"
#import "IRGSettingsViewController.h"
#import "IRGSettings.h"
#import "IRGHoraYMinutosSieteSegmentosViewController.h"
#import "IRGDisplaySieteSegmentosViewController.h"
#import "IRGGestorDeEstados.h"
#import "IRGMetodosComunes.h"

#define REDONDEO_DE_LAS_ESQUINAS_DEL_RELOJ 0
#define COLOR_DEL_FONDO_DE_LA_VENTANA_DEL_RELOJ [UIColor clearColor]
#define TRANSPARENCIA_DEL_COLOR_DE_FONDO_DE_LA_VENTANA_DEL_RELOJ .0
#define TRANSPARENCIA_DEL_COLOR_DE_RELLENO_DE_LOS_SEGMENTOS 1
#define COLOR_DE_RELENO_DE_LOS_SEGMENTOS_DEL_RELOJ  [UIColor blueColor]
#define COLOR_DEL_BORDE_DE_LOS_SEGMENTOS_DEL_RELOJ [UIColor blackColor]
#define GROSOR_DE_LOS_SEGMENTOS_DEL_RELOJ 5
#define SEPARACION_ENTRE_SEGMENTOS 0
#define SEPARACION_HORIZONTAL_DE_LOS_SEGMENTOS_CON_LA_VISTA_CONTENEDORA 5
#define SEPARACION_VERTICAL_DE_LOS_SEGMENTOS_CON_LA_VISTA_CONTENEDORA 5

#define COLOR_DE_RELENO_DE_LOS_SEGMENTOS_DE_LAS_MINAS [UIColor redColor]
#define COLOR_DEL_FONDO_DE_LA_VENTANA_DE_LAS_MINAS [UIColor clearColor]
#define TRANSPARENCIA_DEL_COLOR_DE_FONDO_DE_LA_VENTANA_DE_LAS_MINAS .0


#define REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA 10
#define COLOR_DEL_BORDE_DE_LA_VENTANA [UIColor grayColor]
#define GROSOR_DEL_BORDER_DE_LA_VENTANA 0

@interface IRGVentanaPrincipalViewController ()
@property (nonatomic)  NSInteger numeroDeFilas;
@property (nonatomic)  NSInteger numeroDeColumnas;
@property (nonatomic) int tiempoDeJuegoEnSegundos;

@property (nonatomic) UIImageView *vistaDeBloqueo;

@property (weak, nonatomic) IBOutlet UITextField *tiempoDeJuegoTextField;

@property (nonatomic) IRGDisplaySieteSegmentosViewController * minas7SViewController;

@property (nonatomic) IRGHoraYMinutosSieteSegmentosViewController * tiempoDeJuego7SViewController;

@property (nonatomic) IRGSettingsViewController * vistaDeConfiguracion;

@end

@implementation IRGVentanaPrincipalViewController

#pragma mark - Overrides
- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self iniciarGestionarBotonera];
    [self iniciarGestorDeEstados];
    [self iniciarTotalMinasSieteSegmentos];
    [self iniciarTiempoDeJuegoSieteSegmentos];
    [self establecerImagenesDeLosBotones];
    [self establecerParallax];
    
    [IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones = [self.vistaBarraDeBotonesVertical.backgroundColor colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];
    
    self.vistaBarraDeBotones.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];
    
    
    self.vistaBarraDeBotonesVertical.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];;
    
    self.vistaBarraDeBotonesVertical.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaBarraDeBotonesVertical.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    self.vistaBarraDeBotonesVertical.layer.cornerRadius = REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA;
    self.vistaBarraDeBotonesVertical.layer.masksToBounds = YES;
    
    self.vistaBarraDeBotones.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaBarraDeBotones.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    self.vistaBarraDeBotones.layer.cornerRadius = REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA;
    self.vistaBarraDeBotones.layer.masksToBounds = YES;
    
    self.vistaTiempoYMinas.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaTiempoYMinas.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    
    self.vistaImagenDeFondo.image = [IRGMetodosComunes leerImagenConNombre:ARCHIVO_IMAGEN_DEL_FONDO];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void) touchesBegan:(NSSet *)touches
            withEvent:(UIEvent *)event{
    [self.gestorDeEstados mostrarYOcultarBotones];
}

#pragma mark - Navigation primer nivel

-(void) deviceOrientationDidChange:(NSNotification *)sender{
    
    [self establecerFrameDelCanvasDeLasCeldas];
    
    if ((self.vistaBarraDeBotones.hidden == NO) || (self.vistaBarraDeBotonesVertical.hidden == NO)){
        [self.gestionarBotonera  mostrarBarraDeBotones];
    }
}



- (IBAction)mostrarConfiguracion:(UIButton *)sender {
    [self.gestorDeEstados accionConfigurar];
}


- (IBAction)accionJugar:(UIButton *)sender {
    [self.gestorDeEstados accionJugar];
}


- (IBAction)accionMostrarMinas:(UIButton *)sender {
    [self.gestorDeEstados accionMostrarMinas];
}

- (IBAction)accionMostarMejoresTiempos:(UIButton *)sender {
    [self crearVistaDeMejoresTiempos];
}

-(IBAction)accionPausar:(UIButton *)sender{
    [self.gestorDeEstados accionPausar];
}

# pragma mark Navigation segundo nivel

-(void) mostrarMinas{
    [self mostrarTodasLasMinas];
}

-(void) ocultarMinas{
    [self ocultarTodasLasMinas];
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

- (void) despejarCelda:(IRGCeldaViewController *)celda{
    [self.gestorDeEstados despejarCelda:celda];
}

- (void) ponerBandera:(IRGCeldaViewController *)celda{
    [self.gestorDeEstados ponerBandera:celda];
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
                if (celdeViewControllerTmp.estado !=procesado){
                    [self propagaTouch:celdeViewControllerTmp];
                }
            }
        }
        else {
            [celdaViewController mostrarNumeroDeMinas];
        }
    }
}

-(void) actualizaMinasPendientes{
    [self.minas7SViewController dibujarNumero:[IRGSettings sharedSettings].numeroDeMinas-self.banderasPuestas];
}

#pragma mark - Auxiliares primer nivel

-(void) iniciarTiempoDeJuegoSieteSegmentos{
    
    
    
    
    CGRect frameTiempoDeJuego7S = CGRectMake(0, 0,
                                              self.tiempoDeJuegoTextField.frame.size.width,
                                              self.tiempoDeJuegoTextField.frame.size.height);
    
    self.tiempoDeJuego7SViewController = [[IRGHoraYMinutosSieteSegmentosViewController alloc]
                                          initWithNibName:nil
                                          bundle:nil
                                          withFrame:frameTiempoDeJuego7S
                                          withRedondeoDeLasEsquinas:REDONDEO_DE_LAS_ESQUINAS_DEL_RELOJ];
                                          
    [self.tiempoDeJuegoTextField addSubview:self.tiempoDeJuego7SViewController.view];

    [self.tiempoDeJuego7SViewController establecerVentanaConTransparencia:TRANSPARENCIA_DEL_COLOR_DE_FONDO_DE_LA_VENTANA_DEL_RELOJ
                                              colorDeFondo:COLOR_DEL_FONDO_DE_LA_VENTANA_DEL_RELOJ];
    
    [self.tiempoDeJuego7SViewController  establecerSegmentoConGrosorDelTrazo:1
                                            grosorDelSegmento:GROSOR_DE_LOS_SEGMENTOS_DEL_RELOJ
                                     separacionEntreSegmentos:SEPARACION_ENTRE_SEGMENTOS
                    separacionHorizontalDelSegmentoConLaVista:SEPARACION_HORIZONTAL_DE_LOS_SEGMENTOS_CON_LA_VISTA_CONTENEDORA
                      separacionVerticalDelSegmentoConLaVista:SEPARACION_VERTICAL_DE_LOS_SEGMENTOS_CON_LA_VISTA_CONTENEDORA
                                        colorDelTrazoDelBorde:COLOR_DEL_BORDE_DE_LOS_SEGMENTOS_DEL_RELOJ
                                              colorDelRelleno:COLOR_DE_RELENO_DE_LOS_SEGMENTOS_DEL_RELOJ
                                      transparenciaDelRelleno:TRANSPARENCIA_DEL_COLOR_DE_RELLENO_DE_LOS_SEGMENTOS];

    [self.tiempoDeJuego7SViewController mostrarHoraYMinutos: 0];
}

-(void) iniciarTotalMinasSieteSegmentos {
    
    CGRect frameMinas7S = CGRectMake(0,0,self.totalMinas.frame.size.width,self.totalMinas.frame.size.height);
    
    self.minas7SViewController = [[IRGDisplaySieteSegmentosViewController alloc] initWithNibName:nil
                                                                               bundle:nil
                                                                            withFrame:frameMinas7S
                                                            withRedondeoDeLasEsquinas:REDONDEO_DE_LAS_ESQUINAS_DEL_RELOJ
                                                                              cantidadDeCeldas7S:2];
    [self.totalMinas addSubview:self.minas7SViewController.view];
    
    [self.minas7SViewController establecerVentanaConTransparencia:TRANSPARENCIA_DEL_COLOR_DE_FONDO_DE_LA_VENTANA_DE_LAS_MINAS
                                           colorDeFondo:COLOR_DEL_FONDO_DE_LA_VENTANA_DE_LAS_MINAS];
    
    [self.minas7SViewController  establecerSegmentoConGrosorDelTrazo:1
                                                   grosorDelSegmento:GROSOR_DE_LOS_SEGMENTOS_DEL_RELOJ
                                            separacionEntreSegmentos:SEPARACION_ENTRE_SEGMENTOS
                           separacionHorizontalDelSegmentoConLaVista:SEPARACION_HORIZONTAL_DE_LOS_SEGMENTOS_CON_LA_VISTA_CONTENEDORA
                             separacionVerticalDelSegmentoConLaVista:SEPARACION_VERTICAL_DE_LOS_SEGMENTOS_CON_LA_VISTA_CONTENEDORA
                                               colorDelTrazoDelBorde:COLOR_DEL_BORDE_DE_LOS_SEGMENTOS_DEL_RELOJ
                                                     colorDelRelleno:COLOR_DE_RELENO_DE_LOS_SEGMENTOS_DE_LAS_MINAS
                                             transparenciaDelRelleno:TRANSPARENCIA_DEL_COLOR_DE_RELLENO_DE_LOS_SEGMENTOS];
}


-(void) iniciarGestionarBotonera{
    self.gestionarBotonera = [[IRGGestionarBotonera alloc]initConSender:self];
}

- (void) iniciarGestorDeEstados{
    self.gestorDeEstados = [[IRGGestorDeEstados alloc]initConSender:self];
}

- (void) iniciarJuego{
    
    self.banderasPuestas=0;
    [[IRGDatos sharedDatos] borrarJuego];
    [self borrarCanvas];
    [self generarCanvas];
    [self generarMinas];
    
    [self actualizaMinasPendientes];
    [self inicializarTiempoDeJuego];
    [self iniciarReloj];

}

-(void) acabarJuegoConError{
    [self mostrarTodasLasMinas];
    [self detenerRelor];
}

- (void) acabarJuegoSinErrorSinAyuda{
    [self detenerRelor];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGSettings sharedSettings].numeroDeMinas
                          conAyuda:FALSE];
}

- (void) acabarJuegoSinErrorConAyuda{
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
                                                                          conAyuda:conAyuda
                                                                                 dificultad:[IRGSettings sharedSettings].dificultad];
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
    
    [self establecerFrameDelCanvasDeLasCeldas];
    [self generarLasCeldasDelCanvas];
    
  }

- (void) establecerFrameDelCanvasDeLasCeldas{
    /*
    NSInteger anchoDelCanvasDeLasCeldas = [IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].anchoCelda;
    NSInteger altoDelCanvasDeLasCeldas = [IRGLienzo sharedLienzo].columnasDelLienzo*[IRGLienzo sharedLienzo].altoCelda;
    */
    NSInteger anchoDelCanvasDeLasCeldas = 700;
    NSInteger altoDelCanvasDeLasCeldas = 600;
    NSInteger anchoDelBordeDelCanvasDeLasCeldas = anchoDelCanvasDeLasCeldas+20;
    NSInteger altoDelBordeDelCanvasDeLasCeldas = altoDelCanvasDeLasCeldas+20;
    
    NSInteger margenX;
    NSInteger margenY;
    
    if ([self iPadVertical]){
        margenX =(self.canvas.frame.size.width -anchoDelBordeDelCanvasDeLasCeldas)/2;
        if ((self.vistaBarraDeBotones.hidden == FALSE) || (self.vistaBarraDeBotonesVertical.hidden == FALSE)){
            margenY = (self.vistaBarraDeBotones.frame.origin.y -altoDelBordeDelCanvasDeLasCeldas)/2;
        }
        else {
            margenY = (self.canvas.frame.size.height - altoDelBordeDelCanvasDeLasCeldas)/2;
        }
    }
    else {
        margenY = (self.canvas.frame.size.height - altoDelBordeDelCanvasDeLasCeldas)/2;
        if ((self.vistaBarraDeBotones.hidden == FALSE) || (self.vistaBarraDeBotonesVertical.hidden == FALSE)){
            margenX = (self.canvas.frame.size.width-self.vistaBarraDeBotonesVertical.frame.origin.x-self.vistaBarraDeBotonesVertical.frame.size.width-anchoDelBordeDelCanvasDeLasCeldas)/2+self.vistaBarraDeBotonesVertical.frame.origin.x+self.vistaBarraDeBotonesVertical.frame.size.width;
        }
        else {
            margenX = (self.canvas.frame.size.width-anchoDelBordeDelCanvasDeLasCeldas)/2;
        }
    }
    
    CGRect frameDelBorderDelCanvasDeLasCeldas = CGRectMake(margenX, margenY, anchoDelBordeDelCanvasDeLasCeldas, altoDelBordeDelCanvasDeLasCeldas);
    
    CGRect frameCanvasDeLasCeldas = CGRectMake(0 , 0, anchoDelCanvasDeLasCeldas, altoDelCanvasDeLasCeldas);
    
    self.vistaBordeDeLasCeldas.frame = frameDelBorderDelCanvasDeLasCeldas;

    self.vistaCanvasDeLasCeldas.frame = frameCanvasDeLasCeldas;
    self.vistaCanvasDeLasCeldas.center = CGPointMake(self.vistaBordeDeLasCeldas.frame.size.width/2,self.vistaBordeDeLasCeldas.frame.size.height/2);

    [self.vistaCanvasDeLasCeldas setNeedsDisplay];
    [self.vistaBordeDeLasCeldas setNeedsDisplay];
}

- (void) generarLasCeldasDelCanvas {
    
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
    for (UIView * vistaDelCanvas in self.vistaCanvasDeLasCeldas.subviews){
        if (vistaDelCanvas.class == [IRGCelda class]){
            [vistaDelCanvas removeFromSuperview];
        }
    }
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

- (NSInteger) calcularPorcentajeDeProgreso{
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
    return porcentajeDeAvance;
}


# pragma mark - Auxiliares tercer nivel

- (IRGCeldaViewController *) crearCeldaViewControllerConFila:(NSInteger)fila
                                                  conColumna:(NSInteger)columna{
    IRGCeldaViewController *celdaViewController = [[IRGCeldaViewController alloc]initConNumeroDeFila:fila numeroDeColumna:columna conDelegado:self];
    return celdaViewController;
}

- (void) anadirAlCanvasElCeldaViewController:(IRGCeldaViewController *)celdaViewController{
    [self.vistaCanvasDeLasCeldas addSubview:celdaViewController.view];
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
    [self.tiempoDeJuego7SViewController mostrarHoraYMinutos:self.tiempoDeJuegoEnSegundos];
}

- (void) mostrarImagenDeBloqueo:(NSString *)imagen {
    self.vistaCanvasDeLasCeldas.hidden = YES;
}

-(void) eliminarImagenDeBloqueo{
    self.vistaCanvasDeLasCeldas.hidden = NO;
}

#pragma mark - Activacion y Desactivacion de botones y barras

-(void) mostrarBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:false animated:FALSE];
}
-(void) ocultarrBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:true animated:false];
}

- (BOOL) iPadVertical{
    
    UIInterfaceOrientation newOrientation =  [UIApplication sharedApplication].statusBarOrientation;
    if ((newOrientation == UIInterfaceOrientationLandscapeLeft || newOrientation == UIInterfaceOrientationLandscapeRight)){
        return false;
    }
    else {
        return true;
    }
}

- (void)cambiarTransparenciaDelMenu:(float) porcentajeDeTransparencia{
    self.vistaBarraDeBotones.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones colorWithAlphaComponent:porcentajeDeTransparencia ];
    
    self.vistaBarraDeBotonesVertical.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones colorWithAlphaComponent:porcentajeDeTransparencia];
}

-(void) mostrarVentanaDeConfiguracion{
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoConfiguracion];
    self.vistaDeConfiguracion =[[IRGSettingsViewController alloc]init];
    self.vistaDeConfiguracion.view.center = CGPointMake(self.self.vistaCanvasDeLasCeldas.frame.size.width/2,
                                                                 self.self.vistaCanvasDeLasCeldas.frame.size.height/2);
    self.vistaDeConfiguracion.senderViewController = self;
    [self.self.vistaCanvasDeLasCeldas addSubview:self.vistaDeConfiguracion.view];

}

- (void) restaurarEstado{
    [self.gestorDeEstados establecerEstado:[self.gestorDeEstados estadoDelJuegoAnterior]];
}

-(void) establecerImagenesDeLosBotones{;
    
    NSInteger grupo_imagenes_de_boton = [IRGSettings sharedSettings].grupoDeImagenesDeLosBotones;
    
    UIImage *imagenBotonMostrarMinas = [UIImage imageNamed:[NSString stringWithFormat:@"boton_mostrar_minas_%d",grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonMostrarHistorial = [UIImage imageNamed:[NSString stringWithFormat:@"boton_historial_%d",grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonJugar = [UIImage imageNamed:[NSString stringWithFormat:@"boton_play_%d",grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonPausar = [UIImage imageNamed:[NSString stringWithFormat:@"boton_pausa_%d",grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonSettings = [UIImage imageNamed:[NSString stringWithFormat:@"boton_settings_%d",grupo_imagenes_de_boton]];
    
    [self establecerImagen:imagenBotonMostrarMinas
                  delBoton:self.botonMostrarMinas];
    [self establecerImagen:imagenBotonMostrarMinas
                  delBoton:self.botonMostrarMinasVertical];
    
    [self establecerImagen:imagenBotonMostrarHistorial
                  delBoton:self.botonMostrarMejoresTiempos];
    [self establecerImagen:imagenBotonMostrarHistorial
                  delBoton:self.botonMostrarMejoresTiempoVertical];
    
    [self establecerImagen:imagenBotonJugar
                  delBoton:self.botonJugarSecundario];
    [self establecerImagen:imagenBotonJugar
                  delBoton:self.botonJugarSecundarioVertical];
    
    [self establecerImagen:imagenBotonPausar
                  delBoton:self.botonPausar];
    [self establecerImagen:imagenBotonPausar
                  delBoton:self.botonPausarVertical];
    
    [self establecerImagen:imagenBotonSettings
                  delBoton:self.botonSettings];
    [self establecerImagen:imagenBotonSettings
                  delBoton:self.botonSettingsVertical];

}

- (void) establecerImagen: (UIImage *)imagen
                 delBoton:(UIButton *)boton{
    [boton setImage:imagen
           forState:UIControlStateNormal];
}

- (void) establecerParallax{
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-20);
    verticalMotionEffect.maximumRelativeValue = @(20);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-20);
    horizontalMotionEffect.maximumRelativeValue = @(20);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    // Add both effects to your view
    [self.vistaImagenDeFondo addMotionEffect:group];
}

@end
