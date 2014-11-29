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
@property (nonatomic) CGRect frameDeLaVista;
@property (nonatomic) NSInteger redondeoDeLasEsquinas;
@property (nonatomic) NSInteger numeroDeDisplays;
@property (nonatomic) NSMutableArray * listaDeSegmentos;
@end

@implementation IRGDisplaySieteSegmentosViewController

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
      withRedondeoDeLasEsquinas:(NSInteger)redondeoDeLasEsquinas
               numeroDeDisplays:(NSInteger) numeroDeDisplays;
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _frameDeLaVista = frame;
        _redondeoDeLasEsquinas = redondeoDeLasEsquinas;
        _numeroDeDisplays = numeroDeDisplays;
        _listaDeSegmentos = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil{
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
};


#pragma mark Overrides

-(void)loadView{
    CGRect frameDelDisplay =self.frameDeLaVista;
    UIView * displaySieteSegmentos = [[UIView alloc]initWithFrame:frameDelDisplay];
    self.view = displaySieteSegmentos;
    
    IRGNUmeroSieteSegmentosViewController *numeroSieteSegmentosViewController;
    float anchoDeCadaNumero = self.frameDeLaVista.size.width/self.numeroDeDisplays;
    
    for (int numeroDeSieteSegmentos = 0;numeroDeSieteSegmentos< self.numeroDeDisplays;numeroDeSieteSegmentos++){
        
        
        CGRect frameDelDisplaySieteSegmengos = CGRectMake(numeroDeSieteSegmentos*anchoDeCadaNumero
                                                          , 0
                                                          , anchoDeCadaNumero
                                                          , self.frameDeLaVista.size.height);
        
        numeroSieteSegmentosViewController = [[IRGNUmeroSieteSegmentosViewController alloc] initWithNibName:nil
                                                                                                      bundle:nil
                                                                                                   withFrame:frameDelDisplaySieteSegmengos
                                                                                   withRedondeoDeLasEsquinas:self.redondeoDeLasEsquinas];
        [self.listaDeSegmentos addObject:numeroSieteSegmentosViewController];
        [self.view addSubview:numeroSieteSegmentosViewController.view];
    }
    
}
    


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos publicos

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo{
    
    for (IRGNUmeroSieteSegmentosViewController * numeroSieteSegmentos in self.listaDeSegmentos){
        [numeroSieteSegmentos establecerVentanaConTransparencia:porcentajeDeTransparencia
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
    
    for (IRGNUmeroSieteSegmentosViewController * numeroSieteSegmentos in self.listaDeSegmentos){
        [numeroSieteSegmentos  establecerSegmentoConGrosorDelTrazo:grosorDelTrazo
                                                grosorDelSegmento:grosorDelSegmento
                                         separacionEntreSegmentos:separacionEntreSegmentos
                        separacionHorizontalDelSegmentoConLaVista:separacionHorizontalDelSegmentoConLaVista
                          separacionVerticalDelSegmentoConLaVista:separacionVerticalDelSegmentoConLaVista
                                            colorDelTrazoDelBorde:colorDelTrazoDelBorde
                                                  colorDelRelleno:colorDelRelleno
                                          transparenciaDelRelleno:transparenciaDelRelleno];
    }
}

-(void) dibujarNumero:(NSInteger) numero{
    for (IRGNUmeroSieteSegmentosViewController * numeroSieteSegmentos in self.listaDeSegmentos){
        [numeroSieteSegmentos dibujarNumero: 8];
    }
    [self.view setNeedsDisplay];
}



@end
