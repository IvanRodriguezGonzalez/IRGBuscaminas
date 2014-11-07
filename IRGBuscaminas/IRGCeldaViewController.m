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
    return [self initConNumeroDeFila:0 numeroDeColumna:0];
}

//designated initializer
- (instancetype) initConNumeroDeFila:(NSInteger)numeroDeFila
                     numeroDeColumna:(NSInteger)numeroDeColumna{
    self = [super init];
    if (self){
        _numeroDeFila = numeroDeFila;
        _numeroDeColumna = numeroDeColumna;
        
        NSInteger posicionX = numeroDeColumna*[IRGLienzo sharedLienzo].anchoCelda;
        NSInteger posicionY = numeroDeFila*[IRGLienzo sharedLienzo].altoCelda;
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
    UILongPressGestureRecognizer  *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                                              action:@selector(longPressGestureRecognizer:)];
    [self.view addGestureRecognizer:longPressGestureRecognizer];
    
    UITapGestureRecognizer  *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                              action:@selector(tapGestureRecognizer:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Overrides

- (void) setEstado:(IRGEstados)estado{

    _estado = estado;
    [self dibujaEstado];
    
}

#pragma mark - Navigation

-(void) tapGestureRecognizer : (UITapGestureRecognizer *) gesture{
    if(gesture.state == UIGestureRecognizerStateRecognized){
        [self.delegado celdaPulsada:self];

    }
}
-(void) longPressGestureRecognizer: (UILongPressGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        switch (self.estado)
        {
            case libre:
                self.estado = conBandera;
                break;
            case conBandera:
                self.estado = conDuda;
                break;
            case conDuda:
                self.estado = libre ;
                break;
            default:
                NSLog (@"Integer out of range");
                break;
        }
    }
}


# pragma mark - Publicos

- (void) mostrarNumeroDeMinas{
    
    NSInteger numeroDeMinasAlrededor = [[IRGDatos sharedDatos] numeroDeMinasAlrededor:self];
    self.celda.numeroDeMinasAlrededor.text = [NSString stringWithFormat:@"%ld",(long)numeroDeMinasAlrededor];
    
    self.celda.numeroDeMinasAlrededor.textColor = [IRGPincel sharedPincel].colorDelNumeroDeMInas;
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
        UIImage *imagenConBandera = [UIImage imageNamed:@"bandera"];
        self.celda.imagenDeMina.image= imagenConBandera;
    }
}

- (void) ocultarMina {
    if (self.tieneMina){
        self.celda.backgroundColor = [IRGLienzo sharedLienzo].colorDelRellenoDeLaCeldaSinPintar;
    }
}

- (void) dibujarComoCeldaVacia{
    self.celda.backgroundColor = [[IRGPincel sharedPincel] colorDeRellenoDeLaCeldaVacia];
}


# pragma mark - Auxiliares

- (void) crearCeldaComoVista{
    
    IRGCelda *celdaTemporal;
     celdaTemporal = [[IRGCelda alloc]initWithFrame:self.frameCelda
                                 colorDelBorde:[IRGLienzo sharedLienzo].colorDelTrazoDeLaCeldaSinPintar
                                grosorDelTrazo:[IRGLienzo sharedLienzo].grosoDelTrazoDeLaCeldaSinPintar];
    self.view = celdaTemporal;
    self.celda = celdaTemporal;;
    self.celda.backgroundColor = [IRGLienzo sharedLienzo].colorDelRellenoDeLaCeldaSinPintar;
}

-(void) dibujaEstado{
    UIImage *imagenConBandera = [UIImage imageNamed:@"bandera"];
    UIImage *imagenConDuda = [UIImage imageNamed:@"duda"];
    switch (self.estado)
    {
        case libre:
            self.celda.imagenDeMina.image = nil;
            break;
        case conBandera:
            self.celda.imagenDeMina.image= imagenConBandera;
            break;
        case conDuda:
            self.celda.imagenDeMina.image= imagenConDuda;
            break;
    }
}


@end
