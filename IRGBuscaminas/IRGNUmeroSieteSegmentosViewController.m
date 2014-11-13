//
//  IRGNUmeroSieteSegmentosViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGNUmeroSieteSegmentosViewController.h"
#import "IRGSieteSegmentos.h"
#define COLOR_DE_LA_VENTANA grayColor

@interface IRGNUmeroSieteSegmentosViewController ()
@property (nonatomic) NSInteger anchoDelSegmento;
@property (nonatomic) IRGSieteSegmentos *vistaSieteSegmentos;
@property (nonatomic) CGRect frameDeLaVista;

@end

@implementation IRGNUmeroSieteSegmentosViewController

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame{
    
    self = [super initWithNibName:nibNameOrNil
                            bundle:nibBundleOrNil];
    if (self){
        _frameDeLaVista = frame;
    }
    return self;
}


-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil{
    
    return [self initWithNibName:nibNameOrNil
                          bundle:nibBundleOrNil
                       withFrame:[UIApplication sharedApplication].keyWindow.frame];
};


#pragma mark Overrides
-(void)loadView{
    
    IRGSieteSegmentos * vista = [[IRGSieteSegmentos alloc]initWithFrame:self.frameDeLaVista];
    vista.backgroundColor =[UIColor COLOR_DE_LA_VENTANA];
    vista.alpha = self.porcentajeDetTansparencia;
    vista.alpha = .5;
    
    self.view = vista;
    self.vistaSieteSegmentos = vista;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Accesors

-(void) setValorADibujar:(NSInteger)valorADibujar{
    _valorADibujar = valorADibujar;
    [self.vistaSieteSegmentos dibujarNumero:valorADibujar];
}


#pragma mark -accesosr
-(void) setPorcentajeDetTansparencia:(NSInteger)porcentajeDetTansparencia{
    self.vistaSieteSegmentos.porcentajeDetTansparencia =porcentajeDetTansparencia;
    self.vistaSieteSegmentos.alpha = self.vistaSieteSegmentos.porcentajeDetTansparencia;
}

-(void) setConEfecto3D:(bool)conEfecto3D{
    self.vista.efecto3D = conEfecto3D;
}

-(NSInteger)porcentajeDetTansparencia{
    return self.vistaSieteSegmentos.porcentajeDetTansparencia;
}
@end
