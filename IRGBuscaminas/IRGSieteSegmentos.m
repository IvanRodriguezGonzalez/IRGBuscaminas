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
    return 3;
}

#pragma mmark - Auxiliares de primer nivel

-(void) dibujarNumero:(NSInteger)valor{
    self.valor = valor;
    [self setNeedsDisplay];

}

#pragma mark - Auxiliares de segundo nivel

-(void) dos{
    [self dibujaSegmentoSuperior];
}

#pragma mark - Auxiliares de tercer nivel


-(void) dibujaSegmentoSuperior{
    CGPoint puntoInicial = CGPointMake(0,0);
    CGPoint puntoFinal = CGPointMake(self.frame.size.width,self.anchoDelSegmento);
    [self dibujaSegmentoDesde:puntoInicial hasta:puntoFinal];
    
}

#pragma mark - Auxiliares de cuarto nivel
-(void) dibujaSegmentoDesde:(CGPoint)puntoInicial
                      hasta:(CGPoint)puntoFinal{
    CGRect  linea = CGRectMake(puntoInicial.x,puntoInicial.y,puntoFinal.x,puntoFinal.y);
    [[UIColor redColor] setStroke];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
    [path moveToPoint:puntoInicial];
    path.lineWidth = 3;
    [path stroke];
    
}



@end
