//
//  IRGHoraYMinutosSieteSegmentosViewController.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 1/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRGHoraYMinutosSieteSegmentosViewController : UIViewController
#pragma mark - Inicializadores
//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame
      withRedondeoDeLasEsquinas:(NSInteger)redondeoDeLasEsquinas;
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

-(void) mostrarHoraYMinutos:(NSInteger) totalSegundos;

@end
