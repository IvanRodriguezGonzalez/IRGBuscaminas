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
#import "IRGPincel.h"
#import "IRGVentanaPrincipalViewController.h"



@interface IRGCeldaViewController ()

@property (nonatomic) CGRect frameCelda;
@property (nonatomic) IRGCelda * celda;

@end

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self crearCeldaComoVista];
    
    [self.view setMultipleTouchEnabled:YES];
    
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(doubleTap:)];
    doubleTapRecognizer.numberOfTapsRequired= 2;
    doubleTapRecognizer.delaysTouchesBegan = YES;
    
    
   
    UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                              action:@selector(tapGestureRecognizer:)];
    [tapGestureRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
    [self.view addGestureRecognizer:doubleTapRecognizer];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(void) doubleTap:(UITapGestureRecognizer *)gesture{
    [self.delegado celdaDoblePulsada:self];
}

-(void) tapGestureRecognizer : (UITapGestureRecognizer *) gesture{
    [self.delegado celdaPulsada:self];
}



# pragma mark - Publicos

- (void) setEstado:(IRGEstados)estado{
    
    _estado = estado;
    [self dibujarEstado];
}

- (void) mostrarNumeroDeMinas{
    
    NSInteger numeroDeMinasAlrededor = [[IRGDatos sharedDatos] numeroDeMinasAlrededor:self];
    self.celda.numeroDeMinasAlrededor.text = [NSString stringWithFormat:@"%ld",(long)numeroDeMinasAlrededor];
    
    self.celda.numeroDeMinasAlrededor.textColor = [IRGPincel sharedPincel].colorDelNumeroDeMInas;
    
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
    }
}

- (void) ocultarMina {
    if ((self.tieneMina) & (self.estado == libre)){
        self.celda.imagenDeMina.image= nil;
    }
    else {
        if (self.estado == conBandera){
            self.celda.imagenDeMina.image =[UIImage imageNamed:@"bandera"];
        }
    }
}


# pragma mark - Auxiliares

- (void) crearCeldaComoVista{
    
    IRGCelda *celdaTemporal;
     celdaTemporal = [[IRGCelda alloc]initWithFrame:self.frameCelda
                                      colorDelBorde:[IRGPincel sharedPincel].colorDeTrazoDelPincel
                                      grosorDelTrazo:[IRGPincel sharedPincel].grosorDelTrazoDelPincel];
    self.view = celdaTemporal;
    self.celda = celdaTemporal;;
    [self dibujarEstado];
}

-(void) dibujarEstado{
    UIImage *imagenConBandera = [UIImage imageNamed:@"bandera"];
    UIImage *imagenConDuda = [UIImage imageNamed:@"duda"];
    switch (self.estado)
    {
        case libre:
            self.celda.imagenDeMina.image = nil;
            self.celda.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDeLaCeldaVacia;
            [self.celda setNeedsDisplay];
            break;
        case conBandera:
            self.celda.imagenDeMina.image= imagenConBandera;
            [self.celda setBackgroundColor:[IRGPincel sharedPincel].colorDeRellenoDeLaCeldaVacia];
            [self.celda setNeedsDisplay];
            break;
        case conDuda:
            self.celda.imagenDeMina.image= imagenConDuda;
            self.celda.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDeLaCeldaVacia;
            [self.celda setNeedsDisplay];
            break;
        case procesado:
            self.celda.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDelPincel;
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

@end
