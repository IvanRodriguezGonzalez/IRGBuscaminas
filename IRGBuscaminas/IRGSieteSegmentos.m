//
//  IRGSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSieteSegmentos.h"
#define GROSOR_DEL_SEGMENTO 30
#define ESPACIADO_ENTRE_SEGMENTOS 3
#define ESPACIADO_CON_LA_VENTANA 30
#define GROSOR_DEL_TRAZO 2
#define COLOR_BORDE_DEL_SEGMENTO_CON_LUZ whiteColor
#define COLOR_BORDE_DEL_SEGMENTO_CON_SOMBRA blackColor
#define COLOR_DE_RELLENO redColor

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
    self.esquinaSuperiorIzquierda = CGPointMake(GROSOR_DEL_SEGMENTO/2+ESPACIADO_CON_LA_VENTANA,GROSOR_DEL_SEGMENTO/2+ESPACIADO_CON_LA_VENTANA);
    self.esquinaSuperiorDerecha = CGPointMake(self.bounds.size.width-GROSOR_DEL_SEGMENTO/2-ESPACIADO_CON_LA_VENTANA, GROSOR_DEL_SEGMENTO/2+ESPACIADO_CON_LA_VENTANA);
    self.esquinaCentralIzquierda = CGPointMake(GROSOR_DEL_SEGMENTO/2+ESPACIADO_CON_LA_VENTANA, self.bounds.size.height/2);
    self.esquinaCentralDerecha = CGPointMake(self.bounds.size.width-GROSOR_DEL_SEGMENTO/2-ESPACIADO_CON_LA_VENTANA, self.frame.size.height/2);
    self.esquinaInferiorIzquierda = CGPointMake(GROSOR_DEL_SEGMENTO/2+ESPACIADO_CON_LA_VENTANA, self.bounds.size.height-GROSOR_DEL_SEGMENTO/2-ESPACIADO_CON_LA_VENTANA);
    self.esquinaInferiorDerecha = CGPointMake(self.bounds.size.width-GROSOR_DEL_SEGMENTO/2-ESPACIADO_CON_LA_VENTANA, self.frame.size.height-GROSOR_DEL_SEGMENTO/2-ESPACIADO_CON_LA_VENTANA);
    self.tamanoSegmentoHorizontal = CGPointMake(self.bounds.size.width-2*ESPACIADO_CON_LA_VENTANA-2*GROSOR_DEL_SEGMENTO-2*ESPACIADO_ENTRE_SEGMENTOS,GROSOR_DEL_SEGMENTO);
    self.tamanoSegmentoVertical = CGPointMake(GROSOR_DEL_SEGMENTO,self.bounds.size.height/2-ESPACIADO_CON_LA_VENTANA-1.5*GROSOR_DEL_SEGMENTO-2*ESPACIADO_ENTRE_SEGMENTOS);
        
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
    return GROSOR_DEL_SEGMENTO;
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

    CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x+ESPACIADO_ENTRE_SEGMENTOS, puntoInicial.y);
    CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x+GROSOR_DEL_SEGMENTO+self.tamanoSegmentoHorizontal.x, puntoInicialAjustado.y);
    CGPoint puntoDestinoSuperiorIncial = CGPointMake(puntoInicialAjustado.x+GROSOR_DEL_SEGMENTO/2, puntoInicialAjustado.y-GROSOR_DEL_SEGMENTO/2);
    CGPoint puntoDestinoInferiorIncial = CGPointMake(puntoInicialAjustado.x+GROSOR_DEL_SEGMENTO/2, puntoInicialAjustado.y+GROSOR_DEL_SEGMENTO/2);
    CGPoint puntoDestinoSuperiorFinal = CGPointMake(puntoFinalAjustado.x-GROSOR_DEL_SEGMENTO/2, puntoInicialAjustado.y-GROSOR_DEL_SEGMENTO/2);
    CGPoint puntoDestinoInferiorFinal = CGPointMake(puntoFinalAjustado.x-GROSOR_DEL_SEGMENTO/2, puntoInicialAjustado.y+GROSOR_DEL_SEGMENTO/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoInicialAjustado];
    [path addLineToPoint:puntoDestinoSuperiorIncial];
    [path addLineToPoint:puntoDestinoSuperiorFinal];

    [[UIColor COLOR_BORDE_DEL_SEGMENTO_CON_LUZ] setStroke];
    path.lineWidth = GROSOR_DEL_TRAZO;
    [path stroke];
    [[UIColor COLOR_DE_RELLENO] setFill];
    [path fill];
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoDestinoSuperiorFinal];
    [path addLineToPoint:puntoFinalAjustado];
    [path addLineToPoint:puntoDestinoInferiorFinal];
    [path addLineToPoint:puntoDestinoInferiorIncial];
    [path addLineToPoint:puntoInicialAjustado];

    [[UIColor COLOR_BORDE_DEL_SEGMENTO_CON_SOMBRA] setStroke];
    path.lineWidth = GROSOR_DEL_TRAZO;
    [path stroke];
    [[UIColor COLOR_DE_RELLENO] setFill];
    [path fill];
}

-(void) dibujaSegmentoVerticalDesde:(CGPoint)puntoInicial{
    
    CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x, puntoInicial.y+ESPACIADO_ENTRE_SEGMENTOS);
    CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x, puntoInicialAjustado.y+GROSOR_DEL_SEGMENTO+self.tamanoSegmentoVertical.y);
    CGPoint puntoDestinoIzquierdaIncial = CGPointMake(puntoInicialAjustado.x-GROSOR_DEL_SEGMENTO/2, puntoInicialAjustado.y+GROSOR_DEL_SEGMENTO/2);
    CGPoint puntoDestinoDerechoIncial = CGPointMake(puntoInicialAjustado.x+GROSOR_DEL_SEGMENTO/2, puntoInicialAjustado.y+GROSOR_DEL_SEGMENTO/2);
    CGPoint puntoDestinoIzquierdaFinal = CGPointMake(puntoFinalAjustado.x-GROSOR_DEL_SEGMENTO/2, puntoFinalAjustado.y-GROSOR_DEL_SEGMENTO/2);
    CGPoint puntoDestinoDerechoFinal = CGPointMake(puntoFinalAjustado.x+GROSOR_DEL_SEGMENTO/2, puntoFinalAjustado.y-GROSOR_DEL_SEGMENTO/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:puntoInicialAjustado];
    [path addLineToPoint:puntoDestinoIzquierdaIncial];
    [path addLineToPoint:puntoDestinoIzquierdaFinal];
    
    [[UIColor COLOR_BORDE_DEL_SEGMENTO_CON_LUZ] setStroke];
    path.lineWidth = GROSOR_DEL_TRAZO;
    [path stroke];
    [[UIColor COLOR_DE_RELLENO] setFill];
    [path fill];
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoDestinoIzquierdaFinal];
    [path addLineToPoint:puntoFinalAjustado];
    [path addLineToPoint:puntoDestinoDerechoFinal];
    [path addLineToPoint:puntoDestinoDerechoIncial];
    [path addLineToPoint:puntoInicialAjustado];
    
    [[UIColor COLOR_BORDE_DEL_SEGMENTO_CON_SOMBRA] setStroke];
    path.lineWidth = GROSOR_DEL_TRAZO;
    [path stroke];
    [[UIColor COLOR_DE_RELLENO] setFill];
    [path fill];
   }
@end