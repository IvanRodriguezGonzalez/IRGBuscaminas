//
//  IRGCeldaViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "IRGCeldaViewController.h"
#import "IRGCelda.h"
#import "IRGLienzo.h"
#import "IRGDatos.h"
#import "IRGSettings.h"
#import "IRGVentanaPrincipalViewController.h"
#import "IRGSettings.h"


@interface IRGCeldaViewController ()
#pragma mark - Propiedades privadas
@property (nonatomic) CGRect frameCelda;
@property (nonatomic) IRGCelda * celda;
@property (nonatomic) NSTimeInterval tiempoInicio;
@property (nonatomic) NSTimer *temporizador;
@property (nonatomic) UIColor *colorDeFondoAntiguo;

@end

#pragma mark -
@implementation IRGCeldaViewController

#pragma mark - Inicializadores

-(instancetype)init{
    return [self initConNumeroDeFila:0 numeroDeColumna:0 conDelegado:nil];
}

//designated initializer
- (instancetype) initConNumeroDeFila:(NSInteger)numeroDeFila
                     numeroDeColumna:(NSInteger)numeroDeColumna
                         conDelegado:(IRGVentanaPrincipalViewController*)delegado{
    self = [super init];
    if (self){
        _delegado = delegado;
        _numeroDeFila = numeroDeFila;
        _numeroDeColumna = numeroDeColumna;
        
        NSInteger tamanoXDelJuego = [IRGLienzo sharedLienzo].anchoCelda*[IRGLienzo sharedLienzo].columnasDelLienzo;
        NSInteger margenX = ([UIApplication sharedApplication].keyWindow.frame.size.width -tamanoXDelJuego)/2;
        
        NSInteger tamanoYDelJuego = [IRGLienzo sharedLienzo].altoCelda*[IRGLienzo sharedLienzo].filasDelLienzo;
        NSInteger margenY = (self.delegado.altoDelCanvas-tamanoYDelJuego)/2;
        
        NSInteger posicionX = margenX+numeroDeColumna*[IRGLienzo sharedLienzo].anchoCelda;
        NSInteger posicionY = margenY+numeroDeFila*[IRGLienzo sharedLienzo].altoCelda;
        NSInteger anchoCelda = [IRGLienzo sharedLienzo].anchoCelda;
        NSInteger altoCelda = [IRGLienzo sharedLienzo].altoCelda;
        
        _frameCelda = CGRectMake(posicionX, posicionY, anchoCelda, altoCelda);
        _estado = libre;
    
    }
    return self;
}

#pragma mark - overrides

- (void) loadView{
    [self crearCeldaComoVista];
}

#pragma mark - Navigation

- (void) touchesBegan:(NSSet *)touches
            withEvent:(UIEvent *)event{
    if (self.estado != procesado){
        UITouch *objeto = touches.anyObject;
        self.tiempoInicio = objeto.timestamp;

        self.temporizador = [NSTimer scheduledTimerWithTimeInterval:[IRGSettings sharedSettings].sensibilidadDelTap
                                                              target:self
                                                            selector:@selector(pulsacionLarga)
                                                            userInfo:nil
                                                            repeats:false];
    }
}

-(void) pulsacionLarga{
    [self.celda setProcesada:true];
    self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaProcesada;
    [self.celda setNeedsDisplay];
}

-(void) touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event{
    if (self.estado != procesado){
        UITouch *objeto = touches.anyObject;
        CGFloat posicionXDelTouch = [objeto locationInView:self.celda].x;
        CGFloat posicionYDelTouch = [objeto locationInView:self.celda].y;
    
        if ((posicionXDelTouch< self.celda.frame.size.width) &
            (posicionYDelTouch<self.celda.frame.size.height) &
            (posicionXDelTouch >0) &
            (posicionYDelTouch >0)){
            self.celda.procesada = true;
            self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaProcesada;
        }
        else {
            self.celda.procesada = false;
            self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaNoProcesada;
        }
        [self.celda setNeedsDisplay];
    }
}

- (void) touchesEnded:(NSSet *)touches
            withEvent:(UIEvent *)event{
    [self.temporizador invalidate];
    if (self.estado != procesado){
        
        self.celda.procesada = false;
        self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaNoProcesada;
        [self.celda setNeedsDisplay];
        
        UITouch *objeto = touches.anyObject;
        CGFloat posicionXDelTouch = [objeto locationInView:self.celda].x;
        CGFloat posicionYDelTouch = [objeto locationInView:self.celda].y;
    
        if ((posicionXDelTouch< self.celda.frame.size.width) &
            (posicionYDelTouch<self.celda.frame.size.height) &
            (posicionXDelTouch >0) &
            (posicionYDelTouch >0)){
        
            NSTimeInterval duracion;
            duracion = objeto.timestamp-self.tiempoInicio;
            bool esUnTap;
            if (duracion < [IRGSettings sharedSettings].sensibilidadDelTap){
                esUnTap = true;
            }
            else {
                esUnTap = false;
            }
            if ((esUnTap & [IRGSettings sharedSettings].tapPoneBandera)  || (!esUnTap & ![IRGSettings sharedSettings].tapPoneBandera)){
                [self.delegado ponerBandera:self];
            }
            else {
              [self.delegado despejarCelda:self];
            }
        }
        else {
        }
    }
}

# pragma mark - Accesors

- (void) setEstado:(IRGEstados)estado{
    
    _estado = estado;
    if (_estado==procesado){
        self.celda.procesada = true;
    }
    else {
        self.celda.procesada = false;
    }
    [self dibujarEstado];
}
# pragma mark - Metodos publicos

- (void) mostrarNumeroDeMinas{
    
    NSInteger numeroDeMinasAlrededor = [[IRGDatos sharedDatos] numeroDeMinasAlrededor:self];
    self.celda.numeroDeMinasAlrededor.text = [NSString stringWithFormat:@"%ld",(long)numeroDeMinasAlrededor];
    
    self.celda.numeroDeMinasAlrededor.textColor = [IRGSettings sharedSettings].colorPorDefectoDelNumeroDeMinasAlrededorDeUnaCelda;
    
    if (numeroDeMinasAlrededor==0){
        self.celda.numeroDeMinasAlrededor.text = @"";
    }
    if (numeroDeMinasAlrededor ==1){
        self.celda.numeroDeMinasAlrededor.textColor = [UIColor blueColor];
    }
    if (numeroDeMinasAlrededor ==2){
        self.celda.numeroDeMinasAlrededor.textColor = [UIColor greenColor];
    }
    if (numeroDeMinasAlrededor ==3){
        self.celda.numeroDeMinasAlrededor.textColor = [UIColor yellowColor];
    }
    if (numeroDeMinasAlrededor ==4){
        self.celda.numeroDeMinasAlrededor.textColor = [UIColor orangeColor];
    }
    if (numeroDeMinasAlrededor ==5){
        self.celda.numeroDeMinasAlrededor.textColor = [UIColor redColor];
    }
}

- (void) mostrarMina{
    if (self.tieneMina){
        self.celda.imagenDeMina.image= [UIImage imageNamed:@"mina"];
    }
    else{
        if(self.estado == conBandera){
            self.celda.imagenDeMina.image =[UIImage imageNamed:@"banderaErronea"];
        }
        if (self.estado == conDuda){
            self.celda.imagenDeMina.image = [UIImage imageNamed:@"dudaConError"];
        }
    }
}

- (void) ocultarMina {
    [self  dibujarEstado];
}


-(void) dibujarEstado{
    UIImage *imagenConBandera = [UIImage imageNamed:@"bandera"];
    UIImage *imagenConDuda = [UIImage imageNamed:@"duda"];
    switch (self.estado)
    {
        case libre:
            self.celda.imagenDeMina.image = nil;
            self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaNoProcesada;
            [self.celda setNeedsDisplay];
            break;
        case conBandera:
            self.celda.imagenDeMina.image= imagenConBandera;
            [self.celda setBackgroundColor:[IRGSettings sharedSettings].colorDeRellenoDeLaCeldaNoProcesada];
            [self.celda setNeedsDisplay];
            break;
        case conDuda:
            self.celda.imagenDeMina.image= imagenConDuda;
            self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaNoProcesada;
            [self.celda setNeedsDisplay];
            break;
        case procesado:
            self.celda.backgroundColor = [IRGSettings sharedSettings].colorDeRellenoDeLaCeldaProcesada;
            [self mostrarNumeroDeMinas];
            [self.celda setNeedsDisplay];
            break;
    }
}

-(void) ocultarCelda{
    self.celda.backgroundColor = [UIColor greenColor];
    self.celda.numeroDeMinasAlrededor.text = @"";
    self.celda.imagenDeMina.image = [UIImage imageNamed:@"candado"];
    [self.celda setNeedsDisplay];
}


# pragma mark - Auxiliares

- (void) crearCeldaComoVista{
    
    IRGCelda *celdaTemporal;
     celdaTemporal = [[IRGCelda alloc]initWithFrame:self.frameCelda
                                          procesada:false];
    self.view = celdaTemporal;
    self.celda = celdaTemporal;;
    [self dibujarEstado];
}

@end
