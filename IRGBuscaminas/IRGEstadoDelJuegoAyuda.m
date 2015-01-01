//
//  IRGEstadoDelJuegoAyuda.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 10/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGEstadoDelJuegoAyuda.h"
#import "IRGGestorDeEstados.h"
#import "IRGDisplaySieteSegmentosViewController.h"
#import "IRGSettings.h"
#define TAMANO_X_VENTANA_DISPLAY_SIETE_SEGMENTOS 300
#define TAMANO_Y_VENTANA_DISPLAY_SIETE_SEGMENTOS 225
#define TRANSPARENCIA_DISPLAY_SIETE_SEGMENTOS .5
#define COLOR_FONDO_DISPLAY_SIETE_SEGMENTOS [UIColor redColor]
#define COLOR_DISPLAY_SIETE_SEGMENTOS [UIColor whiteColor]



#define TAMANO_X_VENTANA_LABEL_TIEMPO_DE_AYUDA 300
#define TAMANO_Y_VENTANA_LABEL_TIEMPO_DE_AYUDA 225
#define TRANSPARENCIA_LABEL_TIEMPO_DE_AYUDA .5
#define COLOR_FONDO_LABEL_TIEMPO_DE_AYUDA [UIColor redColor]
#define COLOR_LABEL_TIEMPO_DE_AYUDA [UIColor whiteColor]

#define MOSTRAR_TIEMPO_DE_AYUDA_EN_7S FALSE

@interface IRGEstadoDelJuegoAyuda()
    #pragma mark - Propiedades privadas
    @property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
    @property (nonatomic)  NSTimer * relojDeEspera;
    @property (nonatomic) NSInteger contador;
    @property (nonatomic)UIView *vistaDelFondo;
    @property (nonatomic) IRGDisplaySieteSegmentosViewController *sieteSegmentosViewController;
    @property (nonatomic) UILabel * labelContador;

@end

#pragma mark -
@implementation IRGEstadoDelJuegoAyuda
#pragma mark - Inicializadores

//designated initizalizer

-(instancetype) initConGestorDeEstados: (IRGGestorDeEstados *)gestorDeEstados
                                delegado:(IRGVentanaPrincipalViewController *)sender{
    self = [super init];
    if (self) {
        _delegado = sender;
        _gestorDeEstados = gestorDeEstados;
        _contador = [IRGSettings sharedSettings].tiempoDeAyuda;
    }
    return self;
}

-(instancetype)init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Use initConSender" userInfo:nil];
    return false;
}

#pragma mark Accesors

-(IRGDisplaySieteSegmentosViewController *) sieteSegmentosViewController{
    
    if (!_sieteSegmentosViewController ){
        CGRect frame = CGRectMake(0,0,
                                  TAMANO_X_VENTANA_DISPLAY_SIETE_SEGMENTOS,
                                  TAMANO_Y_VENTANA_DISPLAY_SIETE_SEGMENTOS);
        _sieteSegmentosViewController = [[IRGDisplaySieteSegmentosViewController alloc]
                                         initWithNibName:nil
                                         bundle:nil
                                         withFrame:frame
                                         withRedondeoDeLasEsquinas:0
                                                    cantidadDeCeldas7S:2];
    }
    return  _sieteSegmentosViewController;
}

#pragma mark - Overrides
-(NSString *) description{
    return @"Ayuda!";
}

#pragma mark - Metodos del protocolo

- (void) establecerBotones{
    self.delegado.labelEstadoDelJuego.text=@"mostrado minas";

    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera desactivarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera desactivarBotonJugarSecundario];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self.delegado.gestionarBotonera desactivarSettings];
    if (MOSTRAR_TIEMPO_DE_AYUDA_EN_7S){
        [self anadirVistaSieteSegmentos];
    }
    else {
        [self anadirLabelDelContador];
    }
    [self incializarElContador];
    [self iniciarReloj];
}


- (void) accionJugar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) accionMostrarMinas{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

-(void) ponerBandera:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}

- (void) despejarCelda:(IRGCeldaViewController *)celdaViewController{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
    
}
-(void) accionPausar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}
- (void) accionMostrarVentanaDeAyuda{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}


-(void) ocultarAyuda{
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoEnJuegoConAyuda];
    [self.delegado ocultarTodasLasMinas];
}

-(void) mostrarYOcultarBotones{
    
};

-(void) accionConfigurar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}


-(void) accionOcultarVentanaDeAyuda{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
};

-(void) accionRotarPantalla{
}

#pragma mark auxiliares primer nivel

-(void) incializarElContador{
    self.contador =[IRGSettings sharedSettings].tiempoDeAyuda;;
    [self.sieteSegmentosViewController dibujarNumero : self.contador ];
    self.labelContador.text = [NSString stringWithFormat:@"%ld",(long)self.contador];
    
    
}

- (void) anadirLabelDelContador{
    
    
    UIView * destino = [UIApplication sharedApplication].keyWindow;
    self.vistaDelFondo = [[UIView alloc]initWithFrame:destino.frame];
    self.vistaDelFondo.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0];
    [destino addSubview:self.vistaDelFondo];
    

    CGRect frame = CGRectMake(0,0,
                              TAMANO_X_VENTANA_LABEL_TIEMPO_DE_AYUDA,
                              TAMANO_Y_VENTANA_LABEL_TIEMPO_DE_AYUDA);

    self.labelContador = [[UILabel alloc] initWithFrame:frame];
    [self.delegado.vistaCanvasDeLasCeldas addSubview:self.labelContador];
    self.labelContador.center = CGPointMake(self.delegado.vistaCanvasDeLasCeldas.frame.size.width/2,
                                       self.delegado.vistaCanvasDeLasCeldas .frame.size.height/2);
    self.labelContador.textAlignment = NSTextAlignmentCenter;
    self.labelContador.font = [UIFont fontWithName:@"Bradley Hand" size:TAMANO_Y_VENTANA_LABEL_TIEMPO_DE_AYUDA];
    self.labelContador.alpha = TRANSPARENCIA_LABEL_TIEMPO_DE_AYUDA;
    self.labelContador.textColor = COLOR_LABEL_TIEMPO_DE_AYUDA;
    self.labelContador.backgroundColor = COLOR_FONDO_LABEL_TIEMPO_DE_AYUDA;

}

- (void) anadirVistaSieteSegmentos{
    UIView * destino = [UIApplication sharedApplication].keyWindow;
    self.vistaDelFondo = [[UIView alloc]initWithFrame:destino.frame];
    self.vistaDelFondo.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0];
    [destino addSubview:self.vistaDelFondo];
    
    [self.delegado.vistaCanvasDeLasCeldas addSubview:self.sieteSegmentosViewController.view];
    self.sieteSegmentosViewController.view.center = CGPointMake(self.delegado.vistaCanvasDeLasCeldas.frame.size.width/2,
                                                                self.delegado.vistaCanvasDeLasCeldas.frame.size.height/2);
    
    [self.sieteSegmentosViewController establecerVentanaConTransparencia:TRANSPARENCIA_DISPLAY_SIETE_SEGMENTOS
                                                            colorDeFondo:COLOR_FONDO_DISPLAY_SIETE_SEGMENTOS];

    [self.sieteSegmentosViewController establecerSegmentoConGrosorDelTrazo:1
                                                         grosorDelSegmento:20
                                                  separacionEntreSegmentos:0
                                 separacionHorizontalDelSegmentoConLaVista:20
                                   separacionVerticalDelSegmentoConLaVista:20
                                                     colorDelTrazoDelBorde:[UIColor blackColor]
                                                           colorDelRelleno:COLOR_DISPLAY_SIETE_SEGMENTOS
                                                   transparenciaDelRelleno:TRANSPARENCIA_DISPLAY_SIETE_SEGMENTOS];
}

-(void) iniciarReloj{
    self.relojDeEspera = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(descontarContador)
                                                    userInfo:nil
                                                     repeats:TRUE];
}

- (void) descontarContador{
    self.contador = self.contador-1;
    if (self.contador ==-1){
        [self.relojDeEspera invalidate];
        [self ocultarAyuda];
        [self.sieteSegmentosViewController.view removeFromSuperview];
        [self.labelContador removeFromSuperview];
        [self.vistaDelFondo removeFromSuperview];
        self.sieteSegmentosViewController = nil;
        self.labelContador = nil;
        self.contador = [IRGSettings sharedSettings].tiempoDeAyuda;
    }
    else {
        [self.sieteSegmentosViewController dibujarNumero : self.contador ];
        self.labelContador.text = [NSString stringWithFormat:@"%ld",(long)self.contador];

    }
}



@end
