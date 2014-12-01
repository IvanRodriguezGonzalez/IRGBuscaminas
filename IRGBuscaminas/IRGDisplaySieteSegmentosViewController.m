//
//  IRGDisplaySieteSegmentosViewController.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 29/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGDisplaySieteSegmentosViewController.h"
#import "IRGNUmeroSieteSegmentosViewController.h"

@interface IRGDisplaySieteSegmentosViewController ()
    #pragma mark - Propiedades privadas
    @property (nonatomic) CGRect frameDelDisplay7S;
    @property (nonatomic) NSInteger redondeoDeLasEsquinas;
    @property (nonatomic) NSInteger cantidadDeCeldas7S;
    @property (nonatomic) NSMutableArray * listaDeCeldas7S;
@end

#pragma mark -
@implementation IRGDisplaySieteSegmentosViewController

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
      withRedondeoDeLasEsquinas:(NSInteger)redondeoDeLasEsquinas
             cantidadDeCeldas7S:(NSInteger) cantidadDeCeldas7S;
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _frameDelDisplay7S = frame;
        _redondeoDeLasEsquinas = redondeoDeLasEsquinas;
        _cantidadDeCeldas7S = cantidadDeCeldas7S;
        _listaDeCeldas7S = [[NSMutableArray alloc] init];
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
    
    self.view = [[UIView alloc]initWithFrame:self.frameDelDisplay7S];
    
    IRGNUmeroSieteSegmentosViewController *celda7SViewController;
    float anchoDeLaCelda7S = self.frameDelDisplay7S.size.width/self.cantidadDeCeldas7S;
    
    for (int  numeroDeCelda7S= 0;numeroDeCelda7S< self.cantidadDeCeldas7S;numeroDeCelda7S++){
        CGRect frameDeLaCeldaDeNumero7S = CGRectMake(numeroDeCelda7S*anchoDeLaCelda7S
                                                          , 0
                                                          , anchoDeLaCelda7S
                                                          , self.frameDelDisplay7S.size.height);
        
        celda7SViewController = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                                                      bundle:nil
                                                                                                   withFrame:frameDeLaCeldaDeNumero7S
                                                                                   withRedondeoDeLasEsquinas:self.redondeoDeLasEsquinas];
        [self.listaDeCeldas7S insertObject:celda7SViewController atIndex:0];
        [self.view addSubview:celda7SViewController.view];
    }
}

#pragma mark - Metodos publicos

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo{
    
    for (IRGNUmeroSieteSegmentosViewController * celda7S in self.listaDeCeldas7S){
        [celda7S establecerVentanaConTransparencia:porcentajeDeTransparencia
                                                   colorDeFondo:colorDeFondo];
    }
}

-(void) establecerSegmentoConGrosorDelTrazo:(NSInteger)grosorDelTrazo
                          grosorDelSegmento:(NSInteger)grosorDelSegmento
                   separacionEntreSegmentos:(NSInteger)separacionEntreSegmentos
  separacionHorizontalDelSegmentoConLaVista:(NSInteger)separacionHorizontalDelSegmentoConLaVista
    separacionVerticalDelSegmentoConLaVista:(NSInteger)separacionVerticalDelSegmentoConLaVista
                      colorDelTrazoDelBorde:(UIColor *)colorDelTrazoDelBorde
                            colorDelRelleno:(UIColor *)colorDelRelleno
                    transparenciaDelRelleno:(float)transparenciaDelRelleno{
    
    for (IRGNUmeroSieteSegmentosViewController * celda7S in self.listaDeCeldas7S){
        [celda7S  establecerSegmentoConGrosorDelTrazo:grosorDelTrazo
                                                grosorDelSegmento:grosorDelSegmento
                                         separacionEntreSegmentos:separacionEntreSegmentos
                        separacionHorizontalDelSegmentoConLaVista:separacionHorizontalDelSegmentoConLaVista
                          separacionVerticalDelSegmentoConLaVista:separacionVerticalDelSegmentoConLaVista
                                            colorDelTrazoDelBorde:colorDelTrazoDelBorde
                                                  colorDelRelleno:colorDelRelleno
                                          transparenciaDelRelleno:transparenciaDelRelleno];
    }
}

-(void) dibujarNumero:(NSInteger) valorAMostrar{
    for (int numeroDeCelda7S = 0;numeroDeCelda7S<self.listaDeCeldas7S.count;numeroDeCelda7S++){
        [self.listaDeCeldas7S[numeroDeCelda7S] dibujarNumero:(valorAMostrar % 10)];
        valorAMostrar  = valorAMostrar/10;
    }
}

@end
