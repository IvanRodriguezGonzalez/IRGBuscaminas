//
//  IRGSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSieteSegmentos.h"
#define anchoDelSegmentoPorDefecto 20
#define espaciado 2
#define marco 1

@interface IRGSieteSegmentos ()
@property (nonatomic) NSInteger anchoDelSegmento;
@property (nonatomic) NSInteger valor;
@property (nonatomic) CGPoint esquinaSuperiorIzquierda;
@property (nonatomic) CGPoint esquinaSuperiorDerecha;
@property (nonatomic) CGPoint esquinaCentralIzquierda;
@property (nonatomic) CGPoint esquinaCentralDerecha;
@property (nonatomic) CGPoint esquinaInferiorIzquierda;
@property (nonatomic) CGPoint esquinaInferiorDerecha;
@property (nonatomic) CGPoint tamanoSegmentoHorizontal;
@property (nonatomic) CGPoint tamanoSegmentoVertical;

@end

@implementation IRGSieteSegmentos


#pragma mark - Inicializadores

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        CGRect a = self.frame;
        CGRect b = self.bounds;
    self.esquinaSuperiorIzquierda = CGPointMake(anchoDelSegmentoPorDefecto/2+marco,anchoDelSegmentoPorDefecto/2+marco);
    self.esquinaSuperiorDerecha = CGPointMake(self.bounds.size.width-anchoDelSegmentoPorDefecto/2-marco, anchoDelSegmentoPorDefecto/2+marco);
    self.esquinaCentralIzquierda = CGPointMake(anchoDelSegmentoPorDefecto/2+marco, self.bounds.size.height/2);
    self.esquinaCentralDerecha = CGPointMake(self.bounds.size.width-anchoDelSegmentoPorDefecto/2-marco, self.frame.size.height/2);
    self.esquinaInferiorIzquierda = CGPointMake(anchoDelSegmentoPorDefecto/2+marco, self.bounds.size.height-anchoDelSegmentoPorDefecto/2-marco);
    self.esquinaInferiorDerecha = CGPointMake(self.bounds.size.width-anchoDelSegmentoPorDefecto/2-marco, self.frame.size.height-anchoDelSegmentoPorDefecto/2-marco);
        self.tamanoSegmentoHorizontal = CGPointMake(self.bounds.size.width-2*marco-2*anchoDelSegmentoPorDefecto-2*espaciado,anchoDelSegmentoPorDefecto);
        self.tamanoSegmentoVertical = CGPointMake(anchoDelSegmentoPorDefecto,self.bounds.size.height/2-2*marco-1.5*anchoDelSegmentoPorDefecto-2*espaciado);
        
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


#pragma mark accesors
-(NSInteger) anchoDelSegmento{
    return anchoDelSegmentoPorDefecto;
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
    [self dibujaSegmentoCentral];
    
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
    CGPoint puntoInicial = CGPointMake(self.esquinaSuperiorIzquierda.x ,self.esquinaSuperiorIzquierda.y);
    [self dibujaSegmentoHorizontalDesde:puntoInicial];
}
-(void) dibujaSegmentoCentral{
    CGPoint puntoInicial = CGPointMake (self.esquinaCentralIzquierda.x,self.esquinaCentralIzquierda.y);
    [self dibujaSegmentoHorizontalDesde:puntoInicial];
}

- (void) dibujaSegmentoDown{
    CGPoint puntoInicial = CGPointMake (self.esquinaInferiorIzquierda.x,self.esquinaInferiorIzquierda.y);
    [self dibujaSegmentoHorizontalDesde:puntoInicial];
}

-(void) dibujaSegmentoIzquierdoSuperior{
    CGPoint puntoInicial = CGPointMake(self.esquinaSuperiorIzquierda.x,self.esquinaSuperiorIzquierda.y);
    [self dibujaSegmentoVerticalDesde:puntoInicial];
}

-(void) dibujaSegmentoIzquierdoInferior{
    CGPoint puntoInicial = CGPointMake (self.esquinaCentralIzquierda.x,self.esquinaCentralIzquierda.y);
    [self dibujaSegmentoVerticalDesde:puntoInicial];
}


-(void) dibujaSegmentoDerechoInferior{
    CGPoint puntoInicial = CGPointMake (self.esquinaCentralDerecha.x,self.esquinaCentralDerecha.y);
    [self dibujaSegmentoVerticalDesde:puntoInicial];
}

-(void) dibujaSegmentoDerechoSuperior{
    CGPoint puntoInicial = CGPointMake(self.esquinaSuperiorDerecha.x,self.esquinaSuperiorDerecha.y);
    [self dibujaSegmentoVerticalDesde:puntoInicial];
}




#pragma mark - Auxiliares de cuarto nivel

-(void) dibujaSegmentoHorizontalDesde:(CGPoint)puntoInicial{
    
    [[UIColor blueColor] setStroke];
    [[UIColor clearColor] setFill];
    
    CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x+espaciado, puntoInicial.y);
    CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto+self.tamanoSegmentoHorizontal.x, puntoInicialAjustado.y);
    CGPoint puntoDestinoSuperiorIncial = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y-anchoDelSegmentoPorDefecto/2);
    CGPoint puntoDestinoInferiorIncial = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
    CGPoint puntoDestinoSuperiorFinal = CGPointMake(puntoFinalAjustado.x-anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y-anchoDelSegmentoPorDefecto/2);
    CGPoint puntoDestinoInferiorFinal = CGPointMake(puntoFinalAjustado.x-anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];

    [path moveToPoint:puntoInicialAjustado];
    [path addLineToPoint:puntoDestinoSuperiorIncial];
    [path addLineToPoint:puntoDestinoSuperiorFinal];
    [path addLineToPoint:puntoFinalAjustado];
    [path addLineToPoint:puntoDestinoInferiorFinal];
    [path addLineToPoint:puntoDestinoInferiorIncial];
    [path addLineToPoint:puntoInicialAjustado];
    
    [path stroke];
    [path fill];
    
    
}

-(void) dibujaSegmentoVerticalDesde:(CGPoint)puntoInicial{

    [[UIColor blueColor] setStroke];
    [[UIColor clearColor] setFill];

    CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x, puntoInicial.y+espaciado);
    CGRect  linea = CGRectMake(puntoInicialAjustado.x-anchoDelSegmentoPorDefecto/2,
                               puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2,
                               self.tamanoSegmentoVertical.x,
                               self.tamanoSegmentoVertical.y);
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
    [path moveToPoint:puntoInicial];
    [path stroke];
    [path fill];

    
    // dibujo el pico superior
    path = [UIBezierPath bezierPath];
   
    [path moveToPoint:puntoInicialAjustado];
    
    CGPoint puntoDestinoIzquierdaIncial = CGPointMake(puntoInicialAjustado.x-anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
    [path addLineToPoint:puntoDestinoIzquierdaIncial];
    
    CGPoint puntoDestinoDerechoIncial = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
    [path addLineToPoint:puntoDestinoDerechoIncial];
    
    [path addLineToPoint:puntoInicialAjustado];
    [path stroke];
    [path fill];
    
    // dibujo el pico inferior
    
    CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto+self.tamanoSegmentoVertical.y);

    path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoFinalAjustado];
    
    CGPoint puntoDestinoIzquierdaFinal = CGPointMake(puntoFinalAjustado.x-anchoDelSegmentoPorDefecto/2, puntoFinalAjustado.y-anchoDelSegmentoPorDefecto/2);
    [path addLineToPoint:puntoDestinoIzquierdaFinal];
    
    CGPoint puntoDestinoDerechoFinal = CGPointMake(puntoFinalAjustado.x+anchoDelSegmentoPorDefecto/2, puntoFinalAjustado.y-anchoDelSegmentoPorDefecto/2);
    [path addLineToPoint:puntoDestinoDerechoFinal];
    
    [path addLineToPoint:puntoFinalAjustado];
    [path stroke];
    [path fill];
    
}

/*
 -(void) dibujaSegmentoHorizontalDesde:(CGPoint)puntoInicial{
 
 [[UIColor blueColor] setStroke];
 [[UIColor clearColor] setFill];
 
 
 CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x+espaciado, puntoInicial.y);
 
 CGRect  linea = CGRectMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2
 ,puntoInicialAjustado.y-anchoDelSegmentoPorDefecto/2
 ,self.tamanoSegmentoHorizontal.x
 ,self.tamanoSegmentoHorizontal.y);
 UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
 [path stroke];
 [path fill];
 
 
 
 // dibujo el pic inicial
 path = [UIBezierPath bezierPath];
 
 [path moveToPoint:puntoInicialAjustado];
 
 CGPoint puntoDestinoSuperiorIncial = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y-anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoSuperiorIncial];
 
 CGPoint puntoDestinoInferiorIncial = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoInferiorIncial];
 
 [path addLineToPoint:puntoInicialAjustado];
 [path stroke];
 [path fill];
 
 // dibujo el pico final
 
 CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto+self.tamanoSegmentoHorizontal.x, puntoInicialAjustado.y);
 
 path = [UIBezierPath bezierPath];
 [path moveToPoint:puntoFinalAjustado];
 
 CGPoint puntoDestinoSuperiorFinal = CGPointMake(puntoFinalAjustado.x-anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y-anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoSuperiorFinal];
 
 CGPoint puntoDestinoInferiorFinal = CGPointMake(puntoFinalAjustado.x-anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoInferiorFinal];
 
 [path addLineToPoint:puntoFinalAjustado];
 [path stroke];
 [path fill];
 
 
 
 
 }
 
 -(void) dibujaSegmentoVerticalDesde:(CGPoint)puntoInicial{
 
 [[UIColor blueColor] setStroke];
 [[UIColor clearColor] setFill];
 
 CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x, puntoInicial.y+espaciado);
 CGRect  linea = CGRectMake(puntoInicialAjustado.x-anchoDelSegmentoPorDefecto/2,
 puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2,
 self.tamanoSegmentoVertical.x,
 self.tamanoSegmentoVertical.y);
 UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
 [path moveToPoint:puntoInicial];
 [path stroke];
 [path fill];
 
 
 // dibujo el pico superior
 path = [UIBezierPath bezierPath];
 
 [path moveToPoint:puntoInicialAjustado];
 
 CGPoint puntoDestinoIzquierdaIncial = CGPointMake(puntoInicialAjustado.x-anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoIzquierdaIncial];
 
 CGPoint puntoDestinoDerechoIncial = CGPointMake(puntoInicialAjustado.x+anchoDelSegmentoPorDefecto/2, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoDerechoIncial];
 
 [path addLineToPoint:puntoInicialAjustado];
 [path stroke];
 [path fill];
 
 // dibujo el pico inferior
 
 CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x, puntoInicialAjustado.y+anchoDelSegmentoPorDefecto+self.tamanoSegmentoVertical.y);
 
 path = [UIBezierPath bezierPath];
 [path moveToPoint:puntoFinalAjustado];
 
 CGPoint puntoDestinoIzquierdaFinal = CGPointMake(puntoFinalAjustado.x-anchoDelSegmentoPorDefecto/2, puntoFinalAjustado.y-anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoIzquierdaFinal];
 
 CGPoint puntoDestinoDerechoFinal = CGPointMake(puntoFinalAjustado.x+anchoDelSegmentoPorDefecto/2, puntoFinalAjustado.y-anchoDelSegmentoPorDefecto/2);
 [path addLineToPoint:puntoDestinoDerechoFinal];
 
 [path addLineToPoint:puntoFinalAjustado];
 [path stroke];
 [path fill];
 
 }
 
 
*/

@end
