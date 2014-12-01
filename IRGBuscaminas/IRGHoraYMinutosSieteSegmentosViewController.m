//
//  IRGHoraYMinutosSieteSegmentosViewController.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 1/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGHoraYMinutosSieteSegmentosViewController.h"
#import "IRGDisplaySieteSegmentosViewController.h"
#import "IRGSeparador.h"

#pragma mark Constantes
#define TAMANO_DEL_SEPARADOR self.frameDeLaHoraYMinutos.size.width*.09

#pragma mark -
@interface IRGHoraYMinutosSieteSegmentosViewController ()
#pragma mark Propiedades privadas
    @property (nonatomic) CGRect frameDeLaHoraYMinutos;
    @property (nonatomic) NSInteger redondeoDeLasEsquinas;
    @property (nonatomic) IRGDisplaySieteSegmentosViewController * hora7SViewController;
    @property (nonatomic) IRGDisplaySieteSegmentosViewController * minuto7SViewController;
    @property (nonatomic) IRGSeparador * separador;
@end

#pragma mark -
@implementation IRGHoraYMinutosSieteSegmentosViewController


#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
      withRedondeoDeLasEsquinas:(NSInteger)redondeoDeLasEsquinas{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _frameDeLaHoraYMinutos = frame;
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
-(void) loadView{
    
    self.view = [[UIView alloc]initWithFrame:self.frameDeLaHoraYMinutos];
    
    CGRect frameDeLaHora7s = CGRectMake(0,0,
                                        (self.frameDeLaHoraYMinutos.size.width-TAMANO_DEL_SEPARADOR)/2,
                                        self.frameDeLaHoraYMinutos.size.height);
    
    self.hora7SViewController = [[IRGDisplaySieteSegmentosViewController alloc] initWithNibName:nil
                                                                                         bundle:nil
                                                                                      withFrame:frameDeLaHora7s
                                                                      withRedondeoDeLasEsquinas:self.redondeoDeLasEsquinas
                                                                               cantidadDeCeldas7S:2];
    [self.view addSubview:self.hora7SViewController.view];
    
    CGRect frameDelSeparador= CGRectMake(frameDeLaHora7s.size.width, 0,
                                         TAMANO_DEL_SEPARADOR,
                                         frameDeLaHora7s.size.height);
    
    self.separador = [[IRGSeparador alloc] initWithFrame:frameDelSeparador];
    [self.view addSubview:self.separador];
    
    CGRect frameDelMinuto7s = CGRectMake(frameDeLaHora7s.size.width+TAMANO_DEL_SEPARADOR,
                                         0,
                                         frameDeLaHora7s.size.width,
                                         frameDeLaHora7s.size.height);
    
    self.minuto7SViewController = [[IRGDisplaySieteSegmentosViewController alloc] initWithNibName:nil
                                                                                         bundle:nil
                                                                                      withFrame:frameDelMinuto7s
                                                                      withRedondeoDeLasEsquinas:self.redondeoDeLasEsquinas
                                                                             cantidadDeCeldas7S:2];
    [self.view addSubview:self.minuto7SViewController.view];
}

#pragma mark - Metodos publicos

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo{
    [self.hora7SViewController establecerVentanaConTransparencia:porcentajeDeTransparencia
                                  colorDeFondo:colorDeFondo];
    [self.minuto7SViewController establecerVentanaConTransparencia:porcentajeDeTransparencia
                                                      colorDeFondo:colorDeFondo];
    self.separador.backgroundColor = [colorDeFondo colorWithAlphaComponent:porcentajeDeTransparencia];
}

-(void) establecerSegmentoConGrosorDelTrazo:(NSInteger)grosorDelTrazo
                          grosorDelSegmento:(NSInteger)grosorDelSegmento
                   separacionEntreSegmentos:(NSInteger)separacionEntreSegmentos
  separacionHorizontalDelSegmentoConLaVista:(NSInteger)separacionHorizontalDelSegmentoConLaVista
    separacionVerticalDelSegmentoConLaVista:(NSInteger)separacionVerticalDelSegmentoConLaVista
                      colorDelTrazoDelBorde:(UIColor *)colorDelTrazoDelBorde
                            colorDelRelleno:(UIColor *)colorDelRelleno
                    transparenciaDelRelleno:(float)transparenciaDelRelleno{
    
    [self.hora7SViewController  establecerSegmentoConGrosorDelTrazo:grosorDelTrazo
                                grosorDelSegmento:grosorDelSegmento
                         separacionEntreSegmentos:separacionEntreSegmentos
        separacionHorizontalDelSegmentoConLaVista:separacionHorizontalDelSegmentoConLaVista
          separacionVerticalDelSegmentoConLaVista:separacionVerticalDelSegmentoConLaVista
                            colorDelTrazoDelBorde:colorDelTrazoDelBorde
                                  colorDelRelleno:colorDelRelleno
                          transparenciaDelRelleno:transparenciaDelRelleno];


    [self.minuto7SViewController  establecerSegmentoConGrosorDelTrazo:grosorDelTrazo
                                grosorDelSegmento:grosorDelSegmento
                         separacionEntreSegmentos:separacionEntreSegmentos
        separacionHorizontalDelSegmentoConLaVista:separacionHorizontalDelSegmentoConLaVista
          separacionVerticalDelSegmentoConLaVista:separacionVerticalDelSegmentoConLaVista
                            colorDelTrazoDelBorde:colorDelTrazoDelBorde
                                  colorDelRelleno:colorDelRelleno
                          transparenciaDelRelleno:transparenciaDelRelleno];
    self.separador.colorDelBordeDelSeparador = colorDelTrazoDelBorde;
    self.separador.colorDeRellenoDelSeparador = colorDelRelleno;
    self.separador.grosorDelBorde = grosorDelTrazo;
}

-(void) mostrarHoraYMinutos:(NSInteger) totalSegundos{
    
    [self.hora7SViewController dibujarNumero:(totalSegundos/60)%60];
    [self.minuto7SViewController dibujarNumero:totalSegundos%60];
}


@end
