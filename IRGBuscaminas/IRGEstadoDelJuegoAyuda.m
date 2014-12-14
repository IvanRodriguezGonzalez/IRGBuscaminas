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

@interface IRGEstadoDelJuegoAyuda()
    #pragma mark - Propiedades privadas
    @property (nonatomic,strong) IRGVentanaPrincipalViewController *delegado;
    @property (nonatomic,strong) IRGGestorDeEstados * gestorDeEstados;
    @property (nonatomic)  NSTimer * relojDeEspera;
    @property (nonatomic) NSInteger contador;
    @property (nonatomic) IRGDisplaySieteSegmentosViewController *sieteSegmentosViewController;
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
    [self.delegado.gestionarBotonera desactivarBotonMostrarMinas];
    [self.delegado.gestionarBotonera desactivarBotonMejoresTiempos];
    [self.delegado.gestionarBotonera desactivarBotonJugarSecundario];
    [self.delegado.gestionarBotonera desactivarBotonPausar];
    [self.delegado.gestionarBotonera desactivarSettings];

    [self anadirVistaSieteSegmentos];
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
#pragma mark auxiliares primer nivel

- (void) anadirVistaSieteSegmentos{
    UIView * destino = self.delegado.vistaCanvasDeLasCeldas;
    [destino addSubview:self.sieteSegmentosViewController.view];
    self.sieteSegmentosViewController.view.center = CGPointMake(destino.frame.size.width/2, destino.frame.size.height/2);
    
    [self.sieteSegmentosViewController establecerVentanaConTransparencia:.5
                                                            colorDeFondo:[UIColor redColor]];

    [self.sieteSegmentosViewController establecerSegmentoConGrosorDelTrazo:1
                                                         grosorDelSegmento:20
                                                  separacionEntreSegmentos:0
                                 separacionHorizontalDelSegmentoConLaVista:20
                                   separacionVerticalDelSegmentoConLaVista:20
                                                     colorDelTrazoDelBorde:[UIColor blackColor]
                                                           colorDelRelleno:[UIColor whiteColor]transparenciaDelRelleno:.8];
    self.contador =[IRGSettings sharedSettings].tiempoDeAyuda;;
    [self.sieteSegmentosViewController dibujarNumero : self.contador ];
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
        self.sieteSegmentosViewController = nil;
        self.contador = [IRGSettings sharedSettings].tiempoDeAyuda;
    }
    else {
        [self.sieteSegmentosViewController dibujarNumero : self.contador ];
    }
}

-(void) ocultarAyuda{
    [self.gestorDeEstados establecerEstado:self.gestorDeEstados.estadoDelJuegoEnJuegoConAyuda];
    [self.delegado ocultarMinas];
}

-(void) mostrarYOcultarBotones{
    
};

-(void) accionConfigurar{
    [NSException exceptionWithName:@"accion incorrecta" reason:@"El estado no la soporta" userInfo:nil];
}

@end
