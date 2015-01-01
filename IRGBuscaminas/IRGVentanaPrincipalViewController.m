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

@property (nonatomic) int tiempoDeJuegoEnSegundos;
@property (weak, nonatomic) IBOutlet UIButton *botonMostrarVentanaDeAyuda;

@property (weak, nonatomic) IBOutlet UITextField *tiempoDeJuegoTextField;

@property (nonatomic) IRGDisplaySieteSegmentosViewController * minas7SViewController;

@property (nonatomic) IRGHoraYMinutosSieteSegmentosViewController * tiempoDeJuego7SViewController;

@property (nonatomic) IRGSettingsViewController * vistaDeConfiguracion;


@end

@implementation IRGVentanaPrincipalViewController

#pragma mark - 1 Overrides

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self iniciarGestorDeBarraDeBotones];
    [self iniciarGestorDeEstados];
    [self iniciarTotalMinasSieteSegmentos];
    [self iniciarTiempoDeJuegoSieteSegmentos];
    [self establecerImagenesDeLosBotones];
    [self establecerParallaxDelFondo];
    [self iniciarColorDeFondoDeLaBarraDeBotones];
    [self iniciarConfiguracionDeLasBarrasDeBotones];
    [self iniciarConfiguracionBarraDelTitulo];
    [self establecerImagenDelFondo];
    [self registrarElCambioDeOrientacion];
    [self iniciarBotonDeMostrarLaPantallaDeAyuda];
}

- (void) touchesBegan:(NSSet *)touches
            withEvent:(UIEvent *)event{
    [self.gestorDeEstados mostrarYOcultarBotones];
}

#pragma mark 1.1 Overrides auxiliares primer nivel

- (void) iniciarGestorDeBarraDeBotones{
    self.gestionarBotonera = [[IRGGestionarBotonera alloc]initConSender:self];
}

- (void) iniciarGestorDeEstados{
    self.gestorDeEstados = [[IRGGestorDeEstados alloc]initConSender:self];
}

- (void) iniciarTotalMinasSieteSegmentos {
    
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

- (void) iniciarTiempoDeJuegoSieteSegmentos{
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

- (void) establecerImagenesDeLosBotones{
    
    NSInteger grupo_imagenes_de_boton = [IRGSettings sharedSettings].grupoDeImagenesDeLosBotones;
    
    UIImage *imagenBotonMostrarMinas = [UIImage imageNamed:[NSString stringWithFormat:@"boton_mostrar_minas_%ld",(long)grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonMostrarHistorial = [UIImage imageNamed:[NSString stringWithFormat:@"boton_historial_%ld",(long)grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonJugar = [UIImage imageNamed:[NSString stringWithFormat:@"boton_play_%ld",(long)grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonPausar = [UIImage imageNamed:[NSString stringWithFormat:@"boton_pausa_%ld",(long)grupo_imagenes_de_boton]];
    
    UIImage *imagenBotonSettings = [UIImage imageNamed:[NSString stringWithFormat:@"boton_settings_%ld",(long)grupo_imagenes_de_boton]];
    
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

- (void) establecerParallaxDelFondo{
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

- (void) iniciarColorDeFondoDeLaBarraDeBotones{
    [IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones = [self.vistaBarraDeBotonesVertical.backgroundColor colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];
}

- (void) iniciarConfiguracionDeLasBarrasDeBotones{
    self.vistaBarraDeBotones.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];
    
    
    self.vistaBarraDeBotonesVertical.backgroundColor = [[IRGSettings sharedSettings].colorDeRellenoDeLaBarraDeBotones colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDelMenu];;
    
    self.vistaBarraDeBotonesVertical.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaBarraDeBotonesVertical.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    self.vistaBarraDeBotonesVertical.layer.cornerRadius = REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA;
    self.vistaBarraDeBotonesVertical.layer.masksToBounds= YES;
    
    self.vistaBarraDeBotones.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaBarraDeBotones.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    self.vistaBarraDeBotones.layer.cornerRadius = REDONDEO_DE_LAS_ESQUINAS_DE_LA_VENTANA;
    self.vistaBarraDeBotones.layer.masksToBounds = YES;
}

- (void) iniciarConfiguracionBarraDelTitulo{
    self.vistaTiempoYMinas.layer.borderWidth = GROSOR_DEL_BORDER_DE_LA_VENTANA;
    self.vistaTiempoYMinas.layer.borderColor = COLOR_DEL_BORDE_DE_LA_VENTANA.CGColor;
    
}

- (void) establecerImagenDelFondo{
    self.vistaImagenDeFondo.image = [IRGMetodosComunes leerImagenConNombre:ARCHIVO_IMAGEN_DEL_FONDO];
    
}

- (void) registrarElCambioDeOrientacion{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void) iniciarBotonDeMostrarLaPantallaDeAyuda{
    if ([IRGSettings sharedSettings].mostrarPantallaDeAyuda){
        [self mostrarBotonVentanaDeAyuda];
    }
    else {
        [self ocultarBotonVentanaDeAyuda];
    }
}

#pragma mark 1.2 Overrides auxiliares segundo nivel

- (void) deviceOrientationDidChange:(NSNotification *)sender{
    
    [self establecerFrameDelCanvasDeLasCeldas];
    if ((self.vistaBarraDeBotones.hidden == NO) || (self.vistaBarraDeBotonesVertical.hidden == NO)){
        [self.gestionarBotonera  mostrarBarraDeBotones];
    }
    [self.gestorDeEstados accionRotarPantalla];
}

- (void) mostrarBotonVentanaDeAyuda{
    self.botonMostrarVentanaDeAyuda.hidden = NO;
}

- (void) ocultarBotonVentanaDeAyuda{
    self.botonMostrarVentanaDeAyuda.hidden = YES;
}

- (void) establecerImagen: (UIImage *)imagen
                 delBoton:(UIButton *)boton{
    [boton setImage:imagen
           forState:UIControlStateNormal];
}

#pragma mark 1.3 Overrides auxiliares tercer nivel

- (void) establecerFrameDelCanvasDeLasCeldas{
    
    CGSize tamanoPantallaDelDispositivo = [self screenSize];
    float anchoDelCanvasDeLasCeldas =tamanoPantallaDelDispositivo.width-80;
    NSInteger anchoDeLaCelda = anchoDelCanvasDeLasCeldas/[IRGLienzo sharedLienzo].columnasDelLienzo;
    NSInteger anchoAjustadoDelCanvasDeLasCeldas = anchoDeLaCelda*[IRGLienzo sharedLienzo].columnasDelLienzo;
    anchoDelCanvasDeLasCeldas = anchoAjustadoDelCanvasDeLasCeldas;
    float altoDelCanvasDeLasCeldas = anchoDelCanvasDeLasCeldas;
    float margenX;
    float margenY;
    
    if ([self iPadVertical]){
        margenX =(tamanoPantallaDelDispositivo.width -anchoDelCanvasDeLasCeldas)/2;
        if ((self.vistaBarraDeBotones.hidden == FALSE) || (self.vistaBarraDeBotonesVertical.hidden == FALSE)){
            margenY = (self.vistaBarraDeBotones.frame.origin.y -altoDelCanvasDeLasCeldas)/2;
        }
        else {
            margenY = (self.canvas.frame.size.height - altoDelCanvasDeLasCeldas)/2;
        }
    }
    else {
        margenY = (self.canvas.frame.size.height - altoDelCanvasDeLasCeldas)/2;
        if ((self.vistaBarraDeBotones.hidden == FALSE) || (self.vistaBarraDeBotonesVertical.hidden == FALSE)){
            margenX = (self.canvas.frame.size.width-self.vistaBarraDeBotonesVertical.frame.origin.x-self.vistaBarraDeBotonesVertical.frame.size.width-anchoDelCanvasDeLasCeldas)/2+self.vistaBarraDeBotonesVertical.frame.origin.x+self.vistaBarraDeBotonesVertical.frame.size.width;
        }
        else {
            margenX = (self.canvas.frame.size.width-anchoDelCanvasDeLasCeldas)/2;
        }
    }
    CGRect frameCanvasDeLasCeldas = CGRectMake(margenX,margenY, anchoDelCanvasDeLasCeldas, altoDelCanvasDeLasCeldas);
    self.vistaCanvasDeLasCeldas.frame = frameCanvasDeLasCeldas;
}

#pragma mark 1.4 Overrides auxiliares cuarto nivel

- (NSInteger) altoDelCanvas{
    return self.canvas.frame.size.height;
}

- (CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

#pragma mark - 2 Botones primer nivel

- (IBAction)mostrarVentanaDeAyuda:(UIButton *)sender {
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoMostrandoAyuda];
    [self.gestorDeEstados accionMostrarVentanaDeAyuda];
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

- (IBAction)accionPausar:(UIButton *)sender{
    [self.gestorDeEstados accionPausar];
}


#pragma mark 2.1 Botones segundoNivel
- (void) crearVistaDeMejoresTiempos{
    
    NSBundle * bundle = [NSBundle mainBundle];
    
    IRGMejoresTiemposViewController *mejoresTiemposNivelFacilViewController = [[IRGMejoresTiemposViewController alloc] initWithNibName:@"IRGMejoresTiemposViewController" bundle:bundle nivel:1];
    mejoresTiemposNivelFacilViewController.tabBarItem.title = @"Facil";
    UIImage *imagenMejoresTiemposNivelFacilViewController = [UIImage imageNamed:@"dificultad_facil.png"];
    mejoresTiemposNivelFacilViewController.tabBarItem.image = imagenMejoresTiemposNivelFacilViewController;
    
    
    IRGMejoresTiemposViewController *mejoresTiemposNivelMedioViewController = [[IRGMejoresTiemposViewController alloc] initWithNibName:@"IRGMejoresTiemposViewController" bundle:bundle nivel:2];
    mejoresTiemposNivelMedioViewController.tabBarItem.title= @"Medio";
    UIImage *imagenMejoresTiemposNivelMedioViewController = [UIImage imageNamed:@"dificultad_media.png"];
    mejoresTiemposNivelMedioViewController.tabBarItem.image = imagenMejoresTiemposNivelMedioViewController;
    
    IRGMejoresTiemposViewController *mejoresTiemposNivelDificilViewController = [[IRGMejoresTiemposViewController alloc] initWithNibName:@"IRGMejoresTiemposViewController" bundle:bundle nivel:3];
    mejoresTiemposNivelDificilViewController.tabBarItem.title= @"Dificil";
    UIImage *imagenMejoresTiemposNivelDificilViewController = [UIImage imageNamed:@"dificultad_dificil.png"];
    mejoresTiemposNivelDificilViewController.tabBarItem.image = imagenMejoresTiemposNivelDificilViewController;
    
    
    UITabBarController * tbv = [[UITabBarController alloc]init];
    tbv.viewControllers = @[mejoresTiemposNivelFacilViewController,mejoresTiemposNivelMedioViewController,mejoresTiemposNivelDificilViewController ];
    tbv.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:tbv animated:TRUE completion:nil];
    
}


#pragma mark - 3 Delegados de estados del juego

#pragma mark - 3.1 Accion Jugar

- (void) iniciarJuego{
    [self iniciarBanderasPuestas];
    [self borrarDatosDelJuego];
    [self borrarCanvas];
    [self generarCanvas];
    [self generarMinas];
    [self actualizaMinasPendientes];
    [self inicializarTiempoDeJuego];
    [self iniciarReloj];
}

#pragma mark 3.1.1 Accion Jugar auxiliares primer nivel

- (void) iniciarBanderasPuestas{
    self.banderasPuestas=0;
}

- (void) borrarDatosDelJuego{
    [[IRGDatos sharedDatos] borrarJuego];
}

- (void) borrarCanvas{
    for (UIView * vistaDelCanvas in self.vistaCanvasDeLasCeldas.subviews){
        if (vistaDelCanvas.class == [IRGCelda class]){
            [vistaDelCanvas removeFromSuperview];
        }
    }
}

- (void) generarCanvas{
    [self establecerFrameDelCanvasDeLasCeldas];
    [self generarLasCeldasDelCanvas];
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

- (void) actualizaMinasPendientes{
    [self.minas7SViewController dibujarNumero:[IRGSettings sharedSettings].numeroDeMinas-self.banderasPuestas];
}

#pragma mark 3.1.2 Accion Jugar auxiliares segundo nivel

- (void) generarLasCeldasDelCanvas {
    
    self.vistaCanvasDeLasCeldas.backgroundColor = [UIColor clearColor];
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


- (NSInteger) generarNumeroAleatorioEntre:(NSInteger)numeroInferior
                                        Y:(NSInteger) numeroSuperior{
    NSInteger numeroAleatorio =numeroInferior+random()%numeroSuperior;
    return numeroAleatorio;
}

#pragma mark 3.1.2 Accion Jugar auxiliares tercer nivel

- (IRGCeldaViewController *) crearCeldaViewControllerConFila:(NSInteger)fila
                                                  conColumna:(NSInteger)columna{
    IRGCeldaViewController *celdaViewController = [[IRGCeldaViewController alloc]initConNumeroDeFila:fila numeroDeColumna:columna conDelegado:self];
    return celdaViewController;
}

- (void) anadirAlCanvasElCeldaViewController:(IRGCeldaViewController *)celdaViewController{
    [self.vistaCanvasDeLasCeldas addSubview:celdaViewController.view];
}

#pragma mark - 3.2 Accion Mostrar minas

- (void) delegadoMostrarMinas{
    [self detenerRelor];
    [self inicializarTiempoDeJuego];
    [self mostrarTodasLasMinas];
}

#pragma mark 3.2.1 Accion Mostrar minas auxiliares primer nivel

-(void) detenerRelor{
    [self.reloj invalidate];
};

# pragma mark - 3.3 Accion Pausar juego

- (void) delegadoPausarJuego{
    [self.reloj invalidate];
    [self ocultarTableroDeJuego];
}

- (void) delegadoReanudarJuego{
    [self iniciarReloj];
    [self mostrarTableroDeJuego];
}

# pragma mark 3.3.1 Accion Pausar juego auxiliares primer nivel

- (void) ocultarTableroDeJuego{
    self.vistaCanvasDeLasCeldas.hidden = YES;
}

- (void) mostrarTableroDeJuego{
    self.vistaCanvasDeLasCeldas.hidden = NO;
}

#pragma mark - 3.4 Accion Configurar

- (void) delegadoMostrarVentanaDeConfiguracion{
    self.vistaDeConfiguracion =[[IRGSettingsViewController alloc]init];
    self.vistaDeConfiguracion.view.center = CGPointMake(self.self.vistaCanvasDeLasCeldas.frame.size.width/2,
                                                        self.self.vistaCanvasDeLasCeldas.frame.size.height/2);
    self.vistaDeConfiguracion.senderViewController = self;
    [self.vistaCanvasDeLasCeldas addSubview:self.vistaDeConfiguracion.view];
}

#pragma mark - 3.5 propagar Touch

- (void) propagaTouch:(IRGCeldaViewController *)celdaViewController{
    if (!celdaViewController.estado == procesado){
        
        celdaViewController.estado = procesado;
        [celdaViewController dibujarEstado];
        
        if ([[IRGDatos sharedDatos] tieneMinasAlrededor:celdaViewController]){
            NSArray * celdasSinMinasAlrededorAPropagar;
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

#pragma mark - 3.6 acabar juego con error

- (void) acabarJuegoConError{
    [self mostrarTodasLasMinas];
    [self detenerRelor];
}

#pragma mark - 3.7 acabar juego sin error

- (void) acabarJuegoSinErrorSinAyuda{
    [self detenerRelor];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGSettings sharedSettings].numeroDeMinas
                          conAyuda:FALSE
                        dificultad:[IRGSettings sharedSettings].dificultad];
}

#pragma mark - 3.8 acabar juego sin error con ayuda

- (void) acabarJuegoSinErrorConAyuda{
    [self detenerRelor];
    [self preguntarNombreConTiempo:self.tiempoDeJuegoEnSegundos
                            Nombre:nil
                    numeroDeCeldas:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo
                     numeroDeMinas:[IRGSettings sharedSettings].numeroDeMinas
                          conAyuda:true
                        dificultad:[IRGSettings sharedSettings].dificultad];
}


#pragma mark - 3.09 mostrar ventana de ayuda



#pragma mark - 3.10 Delegados comunes

- (void) iniciarReloj{
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

- (void) inicializarTiempoDeJuego{
    self.tiempoDeJuegoEnSegundos = 0;
    [self mostrarTiempoDeJuego];
}

- (void) mostrarTodasLasMinas{
    for (IRGCeldaViewController * celdaViewController in [[IRGDatos sharedDatos] todasLasCeldas]){
        [celdaViewController mostrarMina];
    }
}

- (void) ocultarTodasLasMinas{
    for (IRGCeldaViewController * celdaViewController in [[IRGDatos sharedDatos] todasLasCeldas]){
        [celdaViewController dibujarEstado];
    }
}

- (void) mostrarTiempoDeJuego{
    if (self.tiempoDeJuegoEnSegundos > ((59*60)+59)){
        self.tiempoDeJuegoEnSegundos = 59*60+59;
    }
    [self.tiempoDeJuego7SViewController mostrarHoraYMinutos:self.tiempoDeJuegoEnSegundos];
}

- (NSString *) preguntarNombreConTiempo:(NSInteger)tiempo
                                 Nombre:(NSString *)nombre
                         numeroDeCeldas:(NSInteger)numeroDeCeldas
                          numeroDeMinas:(NSInteger)numeroDeMinas
                               conAyuda:(bool)conAyuda
                             dificultad:(NSInteger)dificultad
{
    
    NSBundle *bunlde = [NSBundle mainBundle];
    
    IRGPreguntarNombreViewController * vistaPreguntarModalViewController = [[IRGPreguntarNombreViewController alloc]initWithNibName:@"IRGPreguntarNombreViewController" bundle:bunlde];
    vistaPreguntarModalViewController.sender = self;
    vistaPreguntarModalViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    IRGDatoDelMejorTiempo *datoDelMejorTiempo = [[IRGDatoDelMejorTiempo alloc]initConTiempo:tiempo
                                                                                     nombre:nombre
                                                                             numeroDeCeldas:numeroDeCeldas
                                                                              numeroDeMinas:numeroDeMinas
                                                                                   conAyuda:conAyuda
                                                                                 dificultad:dificultad
                                                                           imagenDelJugador:nil];
    vistaPreguntarModalViewController.datoDelMejorTiempo = datoDelMejorTiempo;
    [self presentViewController:vistaPreguntarModalViewController animated:TRUE completion:nil];
    
    return datoDelMejorTiempo.nombre;
    
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

# pragma mark  3.9.1 Delegados comunes segundo nivel

- (void) actualizarTiempoDeJuego:(NSTimer *)timer{
    self.tiempoDeJuegoEnSegundos = self.tiempoDeJuegoEnSegundos+1;
    [self mostrarTiempoDeJuego];
    
}


# pragma mark - 4 Delegado de la Celdas

#pragma mark - 4.1 accion despejar Celda

- (void) despejarCelda:(IRGCeldaViewController *)celda{
    [self.gestorDeEstados despejarCelda:celda];
}

#pragma mark - 4.2 accion poner bandera

- (void) ponerBandera:(IRGCeldaViewController *)celda{
    [self.gestorDeEstados ponerBandera:celda];
}


#pragma mark - 5 metodos delegados generales

- (void) mostrarBarraDeNavegacion{
    [self.navigationController setNavigationBarHidden:false animated:FALSE];
}

- (void) ocultarrBarraDeNavegacion{
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

- (void) restaurarEstado{
    [self.gestorDeEstados establecerEstado:[self.gestorDeEstados estadoDelJuegoAnterior]];
}

@end
