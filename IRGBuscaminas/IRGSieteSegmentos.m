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
        [self calcularPuntosDeDibujo];
        self.alpha = 1;
       self.backgroundColor =  [UIColor lightGrayColor];
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

-(void) calcularPuntosDeDibujo{
    self.esquinaSuperiorIzquierda = CGPointMake(self.grosorDelSegmento/2+self.separacionHorizontalDeLosSegmentosConLaVista,self.grosorDelSegmento/2+self.separacionVerticalDeLosSegmentosConLaVista);
    
    self.esquinaSuperiorDerecha = CGPointMake(self.bounds.size.width-self.grosorDelSegmento/2-self.separacionHorizontalDeLosSegmentosConLaVista, self.grosorDelSegmento/2+self.separacionVerticalDeLosSegmentosConLaVista);
    
    self.esquinaCentralIzquierda = CGPointMake(self.grosorDelSegmento/2+self.separacionHorizontalDeLosSegmentosConLaVista, self.bounds.size.height/2);
    
    self.esquinaCentralDerecha = CGPointMake(self.bounds.size.width-self.grosorDelSegmento/2-self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height/2);
    
    self.esquinaInferiorIzquierda = CGPointMake(self.grosorDelSegmento/2+self.separacionHorizontalDeLosSegmentosConLaVista, self.bounds.size.height-self.grosorDelSegmento/2-self.separacionVerticalDeLosSegmentosConLaVista);
    
    self.esquinaInferiorDerecha = CGPointMake(self.bounds.size.width-self.grosorDelSegmento/2-self.separacionHorizontalDeLosSegmentosConLaVista, self.frame.size.height-self.grosorDelSegmento/2-self.separacionVerticalDeLosSegmentosConLaVista);
    
    self.tamanoSegmentoHorizontal = CGPointMake(self.bounds.size.width-2*self.separacionHorizontalDeLosSegmentosConLaVista-2*self.grosorDelSegmento-2*self.separacionEntreSegmentos,self.grosorDelSegmento);
    
    self.tamanoSegmentoVertical = CGPointMake(self.grosorDelSegmento,self.bounds.size.height/2-self.separacionVerticalDeLosSegmentosConLaVista-1.5*self.grosorDelSegmento-2*self.separacionEntreSegmentos);
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

    CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x+self.separacionEntreSegmentos, puntoInicial.y);
    CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x+self.grosorDelSegmento+self.tamanoSegmentoHorizontal.x, puntoInicialAjustado.y);
    CGPoint puntoDestinoSuperiorIncial = CGPointMake(puntoInicialAjustado.x+self.grosorDelSegmento/2, puntoInicialAjustado.y-self.grosorDelSegmento /2);
    CGPoint puntoDestinoInferiorIncial = CGPointMake(puntoInicialAjustado.x+self.grosorDelSegmento/2, puntoInicialAjustado.y+self.grosorDelSegmento/2);
    CGPoint puntoDestinoSuperiorFinal = CGPointMake(puntoFinalAjustado.x-self.grosorDelSegmento/2, puntoInicialAjustado.y-self.grosorDelSegmento/2);
    CGPoint puntoDestinoInferiorFinal = CGPointMake(puntoFinalAjustado.x-self.grosorDelSegmento/2, puntoInicialAjustado.y+self.grosorDelSegmento/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoInicialAjustado];
    [path addLineToPoint:puntoDestinoSuperiorIncial];
    [path addLineToPoint:puntoDestinoSuperiorFinal];
    if (self.efecto3D){
        [self.colorDelTrazoDelBordeConLuz setStroke];
    }
    else {
        [self.colorDelTrazoDelBorde setStroke];
    }
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoDestinoSuperiorFinal];
    [path addLineToPoint:puntoFinalAjustado];
    [path addLineToPoint:puntoDestinoInferiorFinal];
    [path addLineToPoint:puntoDestinoInferiorIncial];
    [path addLineToPoint:puntoInicialAjustado];

    if (self.efecto3D){
        [self.colorDelTrazoDelBordeConSombra setStroke];
    }
    else {
        [self.colorDelTrazoDelBorde setStroke];
    }
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
}

-(void) dibujaSegmentoVerticalDesde:(CGPoint)puntoInicial{
    
    CGPoint puntoInicialAjustado = CGPointMake(puntoInicial.x, puntoInicial.y+self.separacionEntreSegmentos);
    CGPoint puntoFinalAjustado = CGPointMake(puntoInicialAjustado.x, puntoInicialAjustado.y+self.grosorDelSegmento+self.tamanoSegmentoVertical.y);
    CGPoint puntoDestinoIzquierdaIncial = CGPointMake(puntoInicialAjustado.x-self.grosorDelSegmento/2, puntoInicialAjustado.y+self.grosorDelSegmento/2);
    CGPoint puntoDestinoDerechoIncial = CGPointMake(puntoInicialAjustado.x+self.grosorDelSegmento/2, puntoInicialAjustado.y+self.grosorDelSegmento/2);
    CGPoint puntoDestinoIzquierdaFinal = CGPointMake(puntoFinalAjustado.x-self.grosorDelSegmento/2, puntoFinalAjustado.y-self.grosorDelSegmento/2);
    CGPoint puntoDestinoDerechoFinal = CGPointMake(puntoFinalAjustado.x+self.grosorDelSegmento/2, puntoFinalAjustado.y-self.grosorDelSegmento/2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:puntoInicialAjustado];
    [path addLineToPoint:puntoDestinoIzquierdaIncial];
    [path addLineToPoint:puntoDestinoIzquierdaFinal];
    if (self.efecto3D){
        [self.colorDelTrazoDelBordeConLuz setStroke];
    }
    else {
        [self.colorDelTrazoDelBorde setStroke];
    }
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoDestinoIzquierdaFinal];
    [path addLineToPoint:puntoFinalAjustado];
    [path addLineToPoint:puntoDestinoDerechoFinal];
    [path addLineToPoint:puntoDestinoDerechoIncial];
    [path addLineToPoint:puntoInicialAjustado];
    
    if (self.efecto3D){
        [self.colorDelTrazoDelBordeConSombra setStroke];
    }
    else {
        [self.colorDelTrazoDelBorde setStroke];
    }
    path.lineWidth = self.grosorDelTrazo;
    [path stroke];
    [self.colorDelRellenoDelSegmento setFill];
    [path fill];
   }

#pragma mark - Accesors


-(NSInteger) grosorDelSegmento{
    if (_grosorDelSegmento==0) {
        _grosorDelSegmento = self.bounds.size.width/10;
    }
    return _grosorDelSegmento;
}
-(NSInteger) separacionEntreSegmentos{
    if (_separacionEntreSegmentos==0) {
        _separacionEntreSegmentos = 3;
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
    if (_grosorDelSegmento) {
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