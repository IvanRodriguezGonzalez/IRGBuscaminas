//
//  IRGSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSieteSegmentos.h"
#define espaciado 10
#define anchoDelSegmentoPorDefecto 10

@interface IRGSieteSegmentos ()
@property (nonatomic) NSInteger anchoDelSegmento;
@property (nonatomic) NSInteger valor;

@end

@implementation IRGSieteSegmentos


#pragma mark - Overrides
- (void)drawRect:(CGRect)rect {
        if (self.valor==2){
        [self dos];
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

-(void) dos{
    [self dibujaSegmentoTop];
    [self dibujaSegmentoIzquierdoSuperior];
    [self dibujaSegmentoDerechoSuperior];
  //  [self dibujaSegmentoCentral];
    
}

#pragma mark - Auxiliares de tercer nivel


-(void) dibujaSegmentoTop{
    CGPoint puntoInicial = CGPointMake(espaciado,0);
    CGPoint puntoFinal = CGPointMake(self.frame.size.width-2*espaciado,0);
    [self dibujaSegmentoDesde:puntoInicial hasta:puntoFinal];
}
-(void) dibujaSegmentoIzquierdoSuperior{
    CGPoint puntoInicial = CGPointMake(0,espaciado);
    CGPoint puntoFinal = CGPointMake(0,(self.frame.size.height/2)-(2*espaciado));
    [self dibujaSegmentoDesde:puntoInicial hasta:puntoFinal];
}
-(void) dibujaSegmentoDerechoSuperior{
    CGPoint puntoInicial = CGPointMake(self.frame.size.width,espaciado);
    CGPoint puntoFinal = CGPointMake(self.frame.size.width,(self.frame.size.height/2)-(2*espaciado));
    [self dibujaSegmentoDesde:puntoInicial hasta:puntoFinal];
}

-(void) dibujaSegmentoCentral{
    CGPoint puntoInicial = CGPointMake (espaciado,(self.frame.size.height/2)-(2*espaciado));
    CGPoint puntoFinal = CGPointMake(self.frame.size.width-espaciado,(self.frame.size.height/2)-(2*espaciado));
    [self dibujaSegmentoDesde:puntoInicial hasta:puntoFinal];
}


#pragma mark - Auxiliares de cuarto nivel
-(void) dibujaSegmentoDesde:(CGPoint)puntoInicial
                      hasta:(CGPoint)puntoFinal{
    CGRect  linea = CGRectMake(puntoInicial.x,puntoInicial.y,puntoFinal.x,puntoFinal.y);
    [[UIColor redColor] setStroke];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
    [path moveToPoint:puntoInicial];
    path.lineWidth = anchoDelSegmentoPorDefecto;
    [path stroke];
    
}



@end
