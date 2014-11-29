//
//  IRGCelda.m
//  IRGDibujar
//
//  Created by Ivan Rodriguez Gonzalez on 26/10/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGCelda.h"


@interface IRGCelda ()


@property (nonatomic,readonly) float posicionX;
@property (nonatomic,readonly) float posicionY;


@end

@implementation IRGCelda

#pragma mark - Inicializadores

- (instancetype) initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                 colorDelBorde:[UIColor redColor]
                grosorDelTrazo:1
                     procesada:FALSE];
}


//designated initializer
- (instancetype) initWithFrame:(CGRect)frame
                 colorDelBorde:(UIColor *)colorDelBorde
                grosorDelTrazo:(NSUInteger) grosorDelTrazo
                     procesada:(bool) procesada; {

    self = [super initWithFrame:frame];
    if (self){
        _colorDelBorde = colorDelBorde;
        _grosorDelTrazoDeLaCelda = grosorDelTrazo;
        _procesada = procesada;

        CGRect frame = CGRectMake(12 ,0, self.frame.size.width, self.frame.size.height);
        UILabel * numeroDeMinasAlrededor = [[UILabel alloc] initWithFrame:frame];
        numeroDeMinasAlrededor.font = [UIFont  systemFontOfSize:30];
     //   [numeroDeMinasAlrededor setAdjustsFontSizeToFitWidth:true];

        CGRect frame1 = CGRectMake(2, 2, self.frame.size.width-4,self.frame.size.height-4);
        UIImage *imagen =nil;
        UIImageView * imagenDeMina  = [[UIImageView alloc]initWithImage:imagen];
        imagenDeMina.frame = frame1;
        
        [self addSubview:numeroDeMinasAlrededor];
        [self addSubview:imagenDeMina];
        
        self.numeroDeMinasAlrededor = numeroDeMinasAlrededor;
        self.imagenDeMina = imagenDeMina;
    }
    return self;
}

# pragma mark - Overrides



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (!self.procesada){
        [self dibujarBorderCeldaNoProcesada];
  }
    else{
        [self dibujarBorderCeldaProcesada];
    }
}

# pragma mark - Accesors
-(float) posicionX{
    return self.frame.origin.x;
}

-(float) posicionY{
    return self.frame.origin.y;
}

#pragma mark - Auxiliares primer nivel
-(void) dibujarBorderCeldaNoProcesada{
    NSInteger grosorDeLaLinea = 3;
    
    [self dibujarLineaSuperiorClaraConGrosor:grosorDeLaLinea];
    [self dibujarLineaIzquierdaClaraConGrosor:grosorDeLaLinea];
    [self dibujarLineaInferiorOscuraConGrosor:grosorDeLaLinea];
    [self dibujarLineaDerechaOscuraConGrosor:grosorDeLaLinea];
}
    
-(void) dibujarBorderCeldaProcesada{
    
    NSInteger grosorDeLaLinea = 1;
    [self dibujarLineaSuperiorOscuraConGrosor:grosorDeLaLinea];
    [self dibujarLineaIzquierdaOscuraConGrosor:grosorDeLaLinea];
    [self dibujarLineaInferiorClaraConGrosor:grosorDeLaLinea];
    [self dibujarLineaDerechaClaraConGrosor:grosorDeLaLinea];
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
    UIColor * lineaOscura =[[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:1];
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:lineaOscura
                  conGrosor:grosor];
}

- (void) dibujarLineaClaraDesde:(CGPoint) puntoInicial
                           hasta:(CGPoint) puntoFinal
                       conGrosor:(NSInteger) grosor{
    UIColor * lineaClara = [[UIColor alloc] initWithRed:.9 green:.9 blue:.9 alpha:1];
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:lineaClara
                  conGrosor:grosor];
}

#pragma mark - Auxiliar cuarto nivel

- (void) dibujarLineaDesde:(CGPoint)puntoInicial
                     hasta:(CGPoint) puntoFinal
                  conColor:(UIColor *)color
                 conGrosor:(NSInteger) grosor{
    
    CGRect  linea = CGRectMake(puntoInicial.x,puntoInicial.y,puntoFinal.x,puntoFinal.y);
    [color setStroke];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
    [path moveToPoint:puntoInicial];
    path.lineWidth = grosor;
    [path stroke];
}
@end
