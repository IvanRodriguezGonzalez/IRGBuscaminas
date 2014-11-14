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
@property (nonatomic) IRGSieteSegmentos *vistaSieteSegmentos;
@property (nonatomic) CGRect frameDeLaVista;

@end

@implementation IRGNUmeroSieteSegmentosViewController

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
           withNumeroDedisplays:(NSInteger)numeroDeDisplays{
    
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
                       withFrame:[UIApplication sharedApplication].keyWindow.frame
            withNumeroDedisplays:1];
    
};


#pragma mark Overrides
-(void)loadView{
    UIView *vistaPrincipal =[[UIView alloc]initWithFrame:self.frameDeLaVista];
    self.view = vistaPrincipal;
    
        CGRect frameDelDisplay =CGRectMake((0 )
                                           , 0
                                           , self.frameDeLaVista.size.width
                                           , self.frameDeLaVista.size.height);
        
        IRGSieteSegmentos * display = [[IRGSieteSegmentos alloc]initWithFrame:frameDelDisplay];
        [self.view addSubview:display];
    
    self.vistaSieteSegmentos = display;

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
                            colorDelRelleno:(UIColor *)colorDelRelleno{
    self.vistaSieteSegmentos.grosorDelTrazo = grosorDelTrazo;
    self.vistaSieteSegmentos.grosorDelSegmento = grosorDelSegmento;
    self.vistaSieteSegmentos.separacionEntreSegmentos = separacionEntreSegmentos;
    self.vistaSieteSegmentos.separacionHorizontalDeLosSegmentosConLaVista = separacionHorizontalDelSegmentoConLaVista;
    self.vistaSieteSegmentos.separacionVerticalDeLosSegmentosConLaVista = separacionVerticalDelSegmentoConLaVista;
    self.vistaSieteSegmentos.colorDelTrazoDelBorde = colorDelTrazoDelBorde;
    self.vistaSieteSegmentos.colorDelRellenoDelSegmento = colorDelRelleno;
    [self.vistaSieteSegmentos calcularPuntosDeDibujo];
}

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo{
    self.view.alpha = porcentajeDeTransparencia;
    self.vistaSieteSegmentos.colorDeFondo = colorDeFondo;
}

@end
