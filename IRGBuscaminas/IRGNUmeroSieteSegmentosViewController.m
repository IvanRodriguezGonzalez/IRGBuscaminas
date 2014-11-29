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
    #pragma mark - Propiedades privadas
    @property (nonatomic) IRGSieteSegmentos *vistaSieteSegmentos;
    @property (nonatomic) CGRect frameDeLaVista;
    @property (nonatomic) NSInteger redondeoDeLasEsquinas;
@end

#pragma mark -

@implementation IRGNUmeroSieteSegmentosViewController

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
      withRedondeoDeLasEsquinas:(NSInteger)redondeoDeLasEsquinas {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _frameDeLaVista = frame;
        _redondeoDeLasEsquinas = redondeoDeLasEsquinas;
    }
    return self;
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil{
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
};


#pragma mark - Overrides
-(void)loadView{
    CGRect frameDelDisplay =self.frameDeLaVista;
    IRGSieteSegmentos * display = [[IRGSieteSegmentos alloc]initWithFrame:frameDelDisplay];
    self.view = display;
    self.vistaSieteSegmentos = display;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = self.redondeoDeLasEsquinas;;
    self.view.layer.masksToBounds = YES;
}

#pragma mark - Metodos Publicos

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo{
    self.vistaSieteSegmentos.backgroundColor = [colorDeFondo colorWithAlphaComponent:porcentajeDeTransparencia];
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
}

-(void) dibujarNumero:(NSInteger) numero{
    [self.vistaSieteSegmentos dibujarNumero:numero];
}

@end
