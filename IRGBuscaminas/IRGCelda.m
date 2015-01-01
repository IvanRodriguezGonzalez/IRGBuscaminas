//
//  IRGCelda.m
//  IRGDibujar
//
//  Created by Ivan Rodriguez Gonzalez on 26/10/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGCelda.h"

#pragma mark  Constantes de la clase

#define GROSOR_DEL_BORDE_DE_LA_CELDA_PROCESADA 1
#define GROSOR_DEL_BORDE_DE_LA_CELDA_NO_PROCESADA 3
#define COLOR_DEL_BORDE_OSCURO [UIColor grayColor]
#define COLOR_DEL_BORDE_CLARO [[UIColor alloc] initWithRed:.9 green:.9 blue:.9 alpha:1]
#pragma mark -

@implementation IRGCelda

#pragma mark - Inicializadores

- (instancetype) initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                     procesada:FALSE];
}


//designated initializer
- (instancetype) initWithFrame:(CGRect)frame
                     procesada:(bool) procesada; {

    self = [super initWithFrame:frame];
    if (self){
        _procesada = procesada;

        CGRect frameTextoDeLaCelda = CGRectMake(0 ,
                                                0,
                                                self.frame.size.width*.8,
                                                self.frame.size.height*.8);
        
        UILabel * textoDeLaCelda = [[UILabel alloc] initWithFrame:frameTextoDeLaCelda];
        textoDeLaCelda.center = CGPointMake(self.frame.size.width/2,self.frame.size.height/2);
        
        textoDeLaCelda.font = [UIFont fontWithName:@"Bradley Hand" size:self.frame.size.height];
                textoDeLaCelda.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:textoDeLaCelda];
        self.numeroDeMinasAlrededor = textoDeLaCelda;
        
        //imagen de la celda
        CGRect frameDeLaImagenDeLaCelda = CGRectMake(0,
                                                     0,
                                                     self.frame.size.width*.8,
                                                     self.frame.size.height*.8);
        UIImage *imagenVacia =nil;
        UIImageView * imagenDeLaCelda  = [[UIImageView alloc]initWithImage:imagenVacia];
        imagenDeLaCelda.frame = frameDeLaImagenDeLaCelda;
        imagenDeLaCelda.center = CGPointMake(self.frame.size.width/2,self.frame.size.height/2);

        [self addSubview:imagenDeLaCelda];
        self.imagenDeMina = imagenDeLaCelda;
    }
    return self;
}

# pragma mark - Overrides

- (void)drawRect:(CGRect)rect {
    if (!self.procesada){
        [self dibujarBorderCeldaNoProcesada];
  }
    else{
        [self dibujarBorderCeldaProcesada];
    }
}

#pragma mark - Metodos publicos

-(void) dibujarBorderCeldaProcesada{
    
    [self dibujarLineaSuperiorOscuraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_PROCESADA];
    [self dibujarLineaIzquierdaOscuraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_PROCESADA];
    [self dibujarLineaInferiorClaraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_PROCESADA];
    [self dibujarLineaDerechaClaraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_PROCESADA];
}


#pragma mark - Auxiliares primer nivel
-(void) dibujarBorderCeldaNoProcesada{
    
    [self dibujarLineaSuperiorClaraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_NO_PROCESADA];
    [self dibujarLineaIzquierdaClaraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_NO_PROCESADA];
    [self dibujarLineaInferiorOscuraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_NO_PROCESADA];
    [self dibujarLineaDerechaOscuraConGrosor:GROSOR_DEL_BORDE_DE_LA_CELDA_NO_PROCESADA];
}

#pragma mark - Auxiliares segundo nivel


-(void) dibujarLineaSuperiorOscuraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, 0);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,0);
    [self dibujarLineaOscuraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}

-(void) dibujarLineaSuperiorClaraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, 0);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,0);
    [self dibujarLineaClaraDesde:puntoInicial
                            hasta:(puntoFinal)
                        conGrosor:grosor];
}

- (void) dibujarLineaInferiorOscuraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, self.bounds.size.height);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,self.bounds.size.height);
    [self dibujarLineaOscuraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}

- (void) dibujarLineaInferiorClaraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, self.bounds.size.height);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,self.bounds.size.height);
    [self dibujarLineaClaraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}

- (void) dibujarLineaIzquierdaOscuraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, 0);
    CGPoint puntoFinal = CGPointMake(0,self.bounds.size.height);
    [self dibujarLineaOscuraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}
- (void) dibujarLineaIzquierdaClaraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, 0);
    CGPoint puntoFinal = CGPointMake(0,self.bounds.size.height);
    [self dibujarLineaClaraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}

- (void) dibujarLineaDerechaOscuraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(self.bounds.size.width, 0);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,self.bounds.size.height);
    [self dibujarLineaOscuraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}

- (void) dibujarLineaDerechaClaraConGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(self.bounds.size.width, 0);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,self.bounds.size.height);
    [self dibujarLineaClaraDesde:puntoInicial
                      hasta:(puntoFinal)
                  conGrosor:grosor];
}

#pragma mark - Auxiliares tercer nivel

- (void) dibujarLineaOscuraDesde:(CGPoint) puntoInicial
                           hasta:(CGPoint) puntoFinal
                       conGrosor:(NSInteger) grosor{
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:COLOR_DEL_BORDE_OSCURO
                  conGrosor:grosor];
}

- (void) dibujarLineaClaraDesde:(CGPoint) puntoInicial
                           hasta:(CGPoint) puntoFinal
                       conGrosor:(NSInteger) grosor{
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:COLOR_DEL_BORDE_CLARO
                  conGrosor:grosor];
}

#pragma mark - Auxiliar cuarto nivel

- (void) dibujarLineaDesde:(CGPoint)puntoInicial
                     hasta:(CGPoint) puntoFinal
                  conColor:(UIColor *)color
                 conGrosor:(NSInteger) grosor{
    
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:puntoInicial];
    [path addLineToPoint:puntoFinal];
    [color setStroke];
    path.lineWidth = grosor;
    [path stroke];
}
@end
