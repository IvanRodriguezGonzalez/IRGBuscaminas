//
//  IRGSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSieteSegmentos.h"

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

@property (nonatomic) bool establecidoElEfecto3D;
@end

@implementation IRGSieteSegmentos


#pragma mark - Inicializadores

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){

    self.esquinaSuperiorIzquierda = CGPointMake(self.grosorDelSegmento/2+self.separacionDeLosSegmentosConLaVista,self.grosorDelSegmento/2+self.separacionDeLosSegmentosConLaVista);
    self.esquinaSuperiorDerecha = CGPointMake(self.bounds.size.width-self.grosorDelSegmento/2-self.separacionDeLosSegmentosConLaVista, self.grosorDelSegmento/2+self.separacionDeLosSegmentosConLaVista);
    self.esquinaCentralIzquierda = CGPointMake(self.grosorDelSegmento/2+self.separacionDeLosSegmentosConLaVista, self.bounds.size.height/2);
    self.esquinaCentralDerecha = CGPointMake(self.bounds.size.width-self.grosorDelSegmento/2-self.separacionDeLosSegmentosConLaVista, self.frame.size.height/2);
    self.esquinaInferiorIzquierda = CGPointMake(self.grosorDelSegmento/2+self.separacionDeLosSegmentosConLaVista, self.bounds.size.height-self.grosorDelSegmento/2-self.separacionDeLosSegmentosConLaVista);
    self.esquinaInferiorDerecha = CGPointMake(self.bounds.size.width-self.grosorDelSegmento/2-self.separacionDeLosSegmentosConLaVista, self.frame.size.height-self.grosorDelSegmento/2-self.separacionDeLosSegmentosConLaVista);
    self.tamanoSegmentoHorizontal = CGPointMake(self.bounds.size.width-2*self.separacionDeLosSegmentosConLaVista-2*self.grosorDelSegmento-2*self.separacionEntreSegmentos,self.grosorDelSegmento);
    self.tamanoSegmentoVertical = CGPointMake(self.grosorDelSegmento,self.bounds.size.height/2-self.separacionDeLosSegmentosConLaVista-1.5*self.grosorDelSegmento-2*self.separacionEntreSegmentos);
        
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
    return self.grosorDelSegmento;
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
    [self.colorDelRelleno setFill];
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
    [self.colorDelRelleno setFill];
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
    [self.colorDelRelleno setFill];
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
    [self.colorDelRelleno setFill];
    [path fill];
   }

#pragma mark - Accesors

-(NSInteger) porcentajeDetTansparencia{
    if (_porcentajeDetTansparencia == 0) {
        _porcentajeDetTansparencia = 50;
    }
    return _porcentajeDetTansparencia/100;
}
-(NSInteger) grosorDelSegmento{
    if (_grosorDelSegmento==0) {
        _grosorDelSegmento = 30;
    }
    return _grosorDelSegmento;
}
-(NSInteger) separacionEntreSegmentos{
    if (_separacionEntreSegmentos==0) {
        _separacionEntreSegmentos = 3;
    }
    return _separacionEntreSegmentos;
}
-(NSInteger) separacionDeLosSegmentosConLaVista{
    if (_separacionDeLosSegmentosConLaVista==0) {
        _separacionDeLosSegmentosConLaVista = 10;
    }
    return _separacionDeLosSegmentosConLaVista;
}
-(UIColor *) colorDelTrazoDelBorde{
    if (_colorDelTrazoDelBorde == nil) {
        _colorDelTrazoDelBorde = [UIColor blackColor];
    }
    return _colorDelTrazoDelBorde;
}
-(UIColor *) colorDelTrazoDelBordeConLuz{
    if (_colorDelTrazoDelBordeConLuz == nil) {
        _colorDelTrazoDelBordeConLuz = [UIColor whiteColor];
    }
    return _colorDelTrazoDelBordeConLuz;
}
-(UIColor *) colorDelTrazoDelBordeConSombra{
    if (_colorDelTrazoDelBordeConSombra==nil) {
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
-(UIColor *)colorDelRelleno{
    if (_colorDelRelleno==nil) {
        _colorDelRelleno = [UIColor redColor];
    }
    return _colorDelRelleno;
}

-(void) setEfecto3D:(bool)efecto3D{
    _efecto3D = efecto3D;
    self.establecidoElEfecto3D = true;
}

@end