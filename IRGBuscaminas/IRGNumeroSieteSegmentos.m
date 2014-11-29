//
//  IRGNumeroSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGNumeroSieteSegmentos.h"

#pragma mark  Constantes de la clase
#define GROSOR_POR_DEFECTO_DEL_TRAZO    2
#define GROSOR_POR_DEFECTO_DEL_SEGMENTO self.bounds.size.width/10

#define SEPARACION_POR_DEFECTO_ENTRE_SEGMENTOS                      0
#define SEPARACION_POR_DEFECTO_HORIZONTAL_DEL_SEGMENTO_CON_LA_VISTA self.bounds.size.width/10
#define SEPARACION_POR_DEFECTO_VERTICAL_DEL_SEGMENTO_CON_LA_VISTA   self.bounds.size.height/10

#define COLOR_POR_DEFECTO_DE_RELLENO_DE_LA_VENTANA  [UIColor grayColor]
#define COLOR_POR_DEFECTO_DEL_BORDE_DEL_SEGMENTO    [UIColor blackColor]
#define COLOR_POR_DEFECTO_DE_RELLENO_DEL_SEGMENTO   [UIColor redColor]

#pragma mark -

@interface IRGNumeroSieteSegmentos ()
    #pragma mark - Propiedades privadas
    @property (nonatomic) NSInteger valor;

@end

#pragma mark -

@implementation IRGNumeroSieteSegmentos

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        _grosorDelSegmento =    GROSOR_POR_DEFECTO_DEL_SEGMENTO;
        _grosorDelTrazo =       GROSOR_POR_DEFECTO_DEL_TRAZO;

        
        _separacionEntreSegmentos =                     SEPARACION_POR_DEFECTO_ENTRE_SEGMENTOS;
        _separacionHorizontalDeLosSegmentosConLaVista = SEPARACION_POR_DEFECTO_HORIZONTAL_DEL_SEGMENTO_CON_LA_VISTA;
        _separacionVerticalDeLosSegmentosConLaVista =   SEPARACION_POR_DEFECTO_HORIZONTAL_DEL_SEGMENTO_CON_LA_VISTA;
        
        _colorDelTrazoDelBorde =        COLOR_POR_DEFECTO_DEL_BORDE_DEL_SEGMENTO;
        _colorDelRellenoDelSegmento =   COLOR_POR_DEFECTO_DE_RELLENO_DEL_SEGMENTO;
        self.backgroundColor =          COLOR_POR_DEFECTO_DE_RELLENO_DE_LA_VENTANA;
        
        
    }
    return self;
}

#pragma mark - Overrides

- (void)drawRect:(CGRect)rect {
    switch (self.valor) {
        case 0:
            [self dibujarElNumeroCero];
            break;
        case 1:
            [self dibujarElNumeroUno];
            break;
        case 2:
            [self dibujarElNumeroDos];
            break;
        case 3:
            [self dibujarElNumeroTres];
            break;
        case 4:
            [self dibujarElNumeroCuatro];
            break;
        case 5:
            [self dibujarElNumeroCinco];
            break;
        case 6:
            [self dibujarElNumeroSeis];
            break;
        case 7:
            [self dibujarElNumeroSiete];
            break;
        case 8:
            [self dibujarElNumeroOcho];
            break;
        case 9:
            [self dibujarElNumeroNueve];
            break;
        default:
            break;
    }
}


#pragma mark - Metodos publicos

-(void) dibujarNumero:(NSInteger)valor{
    self.valor = valor;
   [self setNeedsDisplay];
}



#pragma mark - Auxiliares de primer nivel
-(void) dibujarElNumeroCero{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}

-(void) dibujarElNumeroUno{
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoDerechoInferior];
}
-(void) dibujarElNumeroDos{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDown];
}

-(void) dibujarElNumeroTres{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}

-(void) dibujarElNumeroCuatro{
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    
}
-(void) dibujarElNumeroCinco{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}
-(void) dibujarElNumeroSeis{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}
-(void) dibujarElNumeroSiete{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoDerechoInferior];
}
-(void) dibujarElNumeroOcho{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
    }
-(void) dibujarElNumeroNueve{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    }

#pragma mark - Auxiliares de segundo nivel


-(void) dibujaSegmentoTop{
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.separacionEntreSegmentos,
                                                 self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.separacionEntreSegmentos,
                                               self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos,
                                               self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos,
                                                 self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento);
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];

    [self pintarSegmento:path];
}
-(void) dibujaSegmentoCentral{
    CGPoint puntoCentralIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento/2+self.separacionEntreSegmentos,
                                                self.frame.size.height/2);
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos,
                                                 self.frame.size.height/2-self.grosorDelSegmento/2);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos,
                                                 self.frame.size.height/2+self.grosorDelSegmento/2);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos,
                                               self.frame.size.height /2-self.grosorDelSegmento/2);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos,
                                               self.frame.size.height/2+self.grosorDelSegmento/2);
    
    CGPoint puntoCentralDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento/2 - self.separacionEntreSegmentos,
                                              self.frame.size.height/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoCentralIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoCentralDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoCentralIzquierdo];
    
    [self pintarSegmento:path];
}

- (void) dibujaSegmentoDown{
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.separacionEntreSegmentos,
                                                 self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos,
                                                 self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista-self.grosorDelSegmento);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos,
                                               self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista-self.grosorDelSegmento);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.separacionEntreSegmentos,
                                               self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    
    [self pintarSegmento:path];
}

-(void) dibujaSegmentoIzquierdoSuperior{
    
    CGPoint puntoSuperioIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista,
                                                self.separacionVerticalDeLosSegmentosConLaVista+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperioDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento,
                                              self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista,
                                                 self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento,
                                               self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorCentral = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento/2,
                                               self.frame.size.height/2-self.separacionEntreSegmentos);
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperioIzquierdo];
    [path addLineToPoint:puntoSuperioDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorCentral];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperioIzquierdo];
    
    [self pintarSegmento:path];
}

-(void) dibujaSegmentoIzquierdoInferior{
   
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista,
                                                 self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperioDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento,
                                              self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperiorCentral = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento/2,
                                               self.frame.size.height/2+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorIzquierdo  = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista,
                                                  self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista -self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento,
                                               self.frame.size.height-self.grosorDelSegmento-self.separacionEntreSegmentos-self.separacionVerticalDeLosSegmentosConLaVista);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorCentral];
    [path addLineToPoint:puntoSuperioDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    
    [self pintarSegmento:path];

    
}


-(void) dibujaSegmentoDerechoInferior{
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,
                                                 self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperiorCentral = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento/2,
                                               self.frame.size.height/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista,
                                               self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista,
                                               self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,
                                                 self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorCentral];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    
    [self pintarSegmento:path];

}

-(void) dibujaSegmentoDerechoSuperior{
    
    CGPoint puntoSuperioIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,
                                                self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperioDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista,
                                              self.separacionVerticalDeLosSegmentosConLaVista+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,
                                                 self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista,
                                               self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorCentral = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento/2,
                                               self.frame.size.height/2-self.separacionEntreSegmentos);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
 
    [path moveToPoint:puntoSuperioIzquierdo];
    [path addLineToPoint:puntoSuperioDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorCentral];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperioIzquierdo];

    [self pintarSegmento:path];
}



#pragma mark - Auxiliares de tercer nivel

-(void) pintarSegmento:(UIBezierPath *)path{
    
    [self.colorDelTrazoDelBorde setStroke];
    [self.colorDelRellenoDelSegmento setFill];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [path fill];
}


@end