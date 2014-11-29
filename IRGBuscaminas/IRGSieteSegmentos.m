//
//  IRGSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSieteSegmentos.h"
#define COLOR_DE_RELLENO_DE_LA_VENTANA_POR_DEFECTO grayColor

@interface IRGSieteSegmentos ()
@property (nonatomic) NSInteger valor;


@end

@implementation IRGSieteSegmentos


#pragma mark - Inicializadores

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        
    }
    return self;
}

#pragma mark - Overrides


    - (void)drawRect:(CGRect)rect {
    switch (self.valor) {
        case 0:
            [self cero];
            break;
        case 1:
            [self uno];
            break;
        case 2:
            [self dos];
            break;
        case 3:
            [self tres];
            break;
        case 4:
            [self cuatro];
            break;
        case 5:
            [self cinco];
            break;
        case 6:
            [self seis];
            break;
        case 7:
            [self siete];
            break;
        case 8:
            [self ocho];
            break;
        case 9:
            [self nueve];
            break;


        default:
            break;
    }
}


#pragma mmark - Auxiliares de primer nivel

-(void) dibujarNumero:(NSInteger)valor{
    self.valor = valor;
   [self setNeedsDisplay];
}



#pragma mark - Auxiliares de segundo nivel
-(void) cero{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}

-(void) uno{
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoDerechoInferior];
}
-(void) dos{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDown];
}

-(void) tres{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}

-(void) cuatro{
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    
}
-(void) cinco{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}
-(void) seis{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
}
-(void) siete{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoDerechoInferior];
}
-(void) ocho{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoIzquierdoInferior];
    [self dibujaSegmentoDerechoInferior];
    [self dibujaSegmentoDown];
    }
-(void) nueve{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
    [self dibujaSegmentoCentral];
    [self dibujaSegmentoDerechoInferior];
    }

#pragma mark - Auxiliares de tercer nivel


-(void) dibujaSegmentoTop{
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.separacionEntreSegmentos, self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.separacionEntreSegmentos, self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos, self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos, self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento);
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
}
-(void) dibujaSegmentoCentral{
    CGPoint puntoCentralIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento/2+self.separacionEntreSegmentos, self.frame.size.height/2);
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos, self.frame.size.height/2-self.grosorDelSegmento/2);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos, self.frame.size.height/2+self.grosorDelSegmento/2);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos, self.frame.size.height /2-self.grosorDelSegmento/2);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos, self.frame.size.height/2+self.grosorDelSegmento/2);
    
    CGPoint puntoCentralDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento/2 - self.separacionEntreSegmentos, self.frame.size.height/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoCentralIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoCentralDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoCentralIzquierdo];
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
}

- (void) dibujaSegmentoDown{
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.separacionEntreSegmentos, self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos, self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista-self.grosorDelSegmento);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos,self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista-self.grosorDelSegmento);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.separacionEntreSegmentos, self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
 
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];

}

-(void) dibujaSegmentoIzquierdoSuperior{
    
    CGPoint puntoSuperioIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista, self.separacionVerticalDeLosSegmentosConLaVista+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperioDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento, self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento, self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorCentral = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento/2, self.frame.size.height/2-self.separacionEntreSegmentos);
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperioIzquierdo];
    [path addLineToPoint:puntoSuperioDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorCentral];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperioIzquierdo];
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
   
}

-(void) dibujaSegmentoIzquierdoInferior{
   
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperioDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento, self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperiorCentral = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento/2, self.frame.size.height/2+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorIzquierdo  = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista -self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.separacionHorizontalDeLosSegmentosConLaVista+self.grosorDelSegmento, self.frame.size.height-self.grosorDelSegmento-self.separacionEntreSegmentos-self.separacionVerticalDeLosSegmentosConLaVista);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorCentral];
    [path addLineToPoint:puntoSuperioDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];

    
}


-(void) dibujaSegmentoDerechoInferior{
    
    CGPoint puntoSuperiorIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento, self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperiorCentral = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento/2, self.frame.size.height/2+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height/2+self.grosorDelSegmento/2+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,self.frame.size.height-self.separacionVerticalDeLosSegmentosConLaVista-self.grosorDelSegmento-self.separacionEntreSegmentos);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoSuperiorIzquierdo];
    [path addLineToPoint:puntoSuperiorCentral];
    [path addLineToPoint:puntoSuperiorDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperiorIzquierdo];
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];

}

-(void) dibujaSegmentoDerechoSuperior{
    
    CGPoint puntoSuperioIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,self.separacionVerticalDeLosSegmentosConLaVista+self.grosorDelSegmento+self.separacionEntreSegmentos);
    
    CGPoint puntoSuperioDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista,self.separacionVerticalDeLosSegmentosConLaVista+self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorIzquierdo = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento,self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorDerecho = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista,self.frame.size.height/2-self.grosorDelSegmento/2-self.separacionEntreSegmentos);
    
    CGPoint puntoInferiorCentral = CGPointMake(self.frame.size.width-self.separacionHorizontalDeLosSegmentosConLaVista-self.grosorDelSegmento/2,self.frame.size.height/2-self.separacionEntreSegmentos);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
 
    [path moveToPoint:puntoSuperioIzquierdo];
    [path addLineToPoint:puntoSuperioDerecho];
    [path addLineToPoint:puntoInferiorDerecho];
    [path addLineToPoint:puntoInferiorCentral];
    [path addLineToPoint:puntoInferiorIzquierdo];
    [path addLineToPoint:puntoSuperioIzquierdo];
    
    [self.colorDelTrazoDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
   }



#pragma mark - Auxiliares de cuarto nivel


#pragma mark - Accesors

@synthesize colorDeFondo = _colorDeFondo;

-(NSInteger) grosorDelSegmento{
    if (_grosorDelSegmento==0) {
        _grosorDelSegmento = self.bounds.size.width/10;
    }
    return _grosorDelSegmento;
}
-(NSInteger) separacionEntreSegmentos{
    if (_separacionEntreSegmentos==0) {
        _separacionEntreSegmentos = 0;
    }
    return _separacionEntreSegmentos;
}
-(NSInteger) separacionVerticalDeLosSegmentosConLaVista{
    if (_separacionVerticalDeLosSegmentosConLaVista==0) {
        _separacionVerticalDeLosSegmentosConLaVista = self.bounds.size.width/10;
    }
    return _separacionVerticalDeLosSegmentosConLaVista;
}

-(NSInteger) separacionHorizontalDeLosSegmentosConLaVista{
    if (_separacionHorizontalDeLosSegmentosConLaVista==0) {
        _separacionHorizontalDeLosSegmentosConLaVista = self.bounds.size.width/10;
    }
    return _separacionHorizontalDeLosSegmentosConLaVista;
}

-(UIColor *) colorDelTrazoDelBorde{
    if (!_colorDelTrazoDelBorde ) {
        _colorDelTrazoDelBorde = [UIColor blackColor];
    }
    return _colorDelTrazoDelBorde;
}
-(UIColor *) colorDelTrazoDelBordeConLuz{
    if (!_colorDelTrazoDelBordeConLuz ) {
        _colorDelTrazoDelBordeConLuz = [UIColor whiteColor];
    }
    return _colorDelTrazoDelBordeConLuz;
}
-(UIColor *) colorDelTrazoDelBordeConSombra{
    if (!_colorDelTrazoDelBordeConSombra) {
        _colorDelTrazoDelBordeConSombra = [UIColor blackColor];
    }
    return _colorDelTrazoDelBordeConSombra;
}
-(NSInteger) grosorDelTrazo{
    if (_grosorDelSegmento==0) {
        _grosorDelTrazo = 2;
    }
    return _grosorDelTrazo;
}
-(UIColor *)colorDelRellenoDelSegmento{
    if (_colorDelRellenoDelSegmento==nil) {
        _colorDelRellenoDelSegmento = [UIColor redColor];
    }
    return _colorDelRellenoDelSegmento;
}


@end