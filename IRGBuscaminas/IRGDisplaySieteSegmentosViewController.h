//
//  IRGDisplaySieteSegmentosViewController.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 29/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRGDisplaySieteSegmentosViewController : UIViewController

#pragma mark - Inicializadores
//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
      withRedondeoDeLasEsquinas:(NSInteger)redondeoDeLasEsquinas
               numeroDeDisplays:(NSInteger) numeroDeDisplays;

#pragma mark - Metodos publicos

- (void) establecerVentanaConTransparencia:(float)porcentajeDeTransparencia
                              colorDeFondo:(UIColor *)colorDeFondo;

-(void) establecerSegmentoConGrosorDelTrazo:(NSInteger)grosorDelTrazo
                          grosorDelSegmento:(NSInteger)grosorDelSegmento
                   separacionEntreSegmentos:(NSInteger)separacionEntreSegmentos
  separacionHorizontalDelSegmentoConLaVista:(NSInteger)separacionHorizontalDelSegmentoConLaVista
    separacionVerticalDelSegmentoConLaVista:(NSInteger)separacionVerticalDelSegmentoConLaVista
                      colorDelTrazoDelBorde:(UIColor *)colorDelTrazoDelBorde
                            colorDelRelleno:(UIColor *)colorDelRelleno
                    transparenciaDelRelleno:(float)transparenciaDelRelleno;

-(void) dibujarNumero:(NSInteger) numero;

@end
