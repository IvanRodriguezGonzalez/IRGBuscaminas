//
//  IRGNUmeroSieteSegmentosViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGNUmeroSieteSegmentosViewController.h"
#import "IRGSieteSegmentos.h"

@interface IRGNUmeroSieteSegmentosViewController ()
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
    CGRect frameDelDisplay =self.frameDeLaVista;
    
    IRGSieteSegmentos * display = [[IRGSieteSegmentos alloc]initWithFrame:frameDelDisplay];
    self.view = display;
    self.vistaSieteSegmentos = display;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.layer.cornerRadius = 40;
        self.view.layer.masksToBounds = YES;
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


#pragma mark - Auxiliares nivel uno

-(void) establecerEfecto3ConColorDelTrazoDelBordeConLuz:(UIColor *)colorDelTrazoDelBordeConLuz
                     conColortDelTrazoDelBordeConSombra:(UIColor *)colorDelTrazoDelBordeConSombra{
    self.vistaSieteSegmentos.efecto3D = true;
    self.vistaSieteSegmentos.colorDelTrazoDelBordeConLuz =colorDelTrazoDelBordeConLuz;
    self.vistaSieteSegmentos.colorDelTrazoDelBordeConSombra = colorDelTrazoDelBordeConSombra;
}

-(void) establecerSegmentoConGrosorDelTrazo:(NSInteger)grosorDelTrazo
                          grosorDelSegmento:(NSInteger)grosorDelSegmento
                   separacionEntreSegmentos:(NSInteger)separacionEntreSegmentos
  separacionHorizontalDelSegmentoConLaVista:(NSInteger)separacionHorizontalDelSegmentoConLaVista
    separacionVerticalDelSegmentoConLaVista:(NSInteger)separacionVerticalDelSegmentoConLaVista
                      colorDelTrazoDelBorde:(UIColor *)colorDelTrazoDelBorde
                            colorDelRelleno:(UIColor *)colorDelRelleno
                    transparenciaDelRelleno:(float)transparenciaDelRelleno{
    self.vistaSieteSegmentos.grosorDelTrazo = grosorDelTrazo;
    self.vistaSieteSegmentos.grosorDelSegmento = grosorDelSegmento;
    self.vistaSieteSegmentos.separacionEntreSegmentos = separacionEntreSegmentos+grosorDelTrazo;
    self.vistaSieteSegmentos.separacionHorizontalDeLosSegmentosConLaVista = separacionHorizontalDelSegmentoConLaVista;
    self.vistaSieteSegmentos.separacionVerticalDeLosSegmentosConLaVista = separacionVerticalDelSegmentoConLaVista;
    self.vistaSieteSegmentos.colorDelTrazoDelBorde = colorDelTrazoDelBorde;
    self.vistaSieteSegmentos.colorDelRellenoDelSegmento = [colorDelRelleno colorWithAlphaComponent:transparenciaDelRelleno];
    [self.vistaSieteSegmentos calcularPuntosDeDibujo];
}

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo{
    
    self.vistaSieteSegmentos.opaque= true;
    self.vistaSieteSegmentos.backgroundColor = [colorDeFondo colorWithAlphaComponent:porcentajeDeTransparencia];

}

@end
