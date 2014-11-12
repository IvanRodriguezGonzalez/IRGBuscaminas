//
//  IRGCelda.m
//  IRGDibujar
//
//  Created by Ivan Rodriguez Gonzalez on 26/10/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGCelda.h"
#define TAMANO_X_DEL_NUMERO 10
#define TAMANO_Y_DEL_NUMERO 10

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

        CGRect frame = CGRectMake(8 ,2, self.frame.size.width -12, self.frame.size.height-2);
        UILabel * numeroDeMinasAlrededor = [[UILabel alloc] initWithFrame:frame];
        [numeroDeMinasAlrededor setAdjustsFontSizeToFitWidth:true];

        CGRect frame1 = CGRectMake(1, 1, self.frame.size.width-2,self.frame.size.height-2);
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
        /*
         [[UIColor whiteColor] setStroke];
         CGRect  lineaSuperior = CGRectMake(0,0, self.bounds.size.width,0);
         UIBezierPath *path = [UIBezierPath bezierPathWithRect:lineaSuperior];
         path.lineWidth = 2;
         [path stroke];
         
         [path moveToPoint:CGPointMake(0,0)];
         CGRect  lineaIzquierda = CGRectMake(0,0, 0,self.frame.size.height);
         path = [UIBezierPath bezierPathWithRect:lineaIzquierda];
         [path stroke];
         
         [[[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:1] setStroke];;
         [path moveToPoint:CGPointMake(self.frame.size.width,0)];
         CGRect  lineaDerecha = CGRectMake(self.frame.size.width,0,self.frame.size.width,self.frame.size.height);
         path = [UIBezierPath bezierPathWithRect:lineaDerecha];
         [path stroke];
         
         [path moveToPoint:CGPointMake(0,self.frame.size.height)];
         CGRect  lineaInferior = CGRectMake(0,self.frame.size.height,self.frame.size.width,self.frame.size.height);
         path = [UIBezierPath bezierPathWithRect:lineaInferior];
         [path stroke];    }
         
         */


    }
    else{
        [self dibujarBorderCeldaProcesada];
    }

        /*
        [[[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:1] setStroke];;
        CGRect  lineaSuperior = CGRectMake(0,0, self.bounds.size.width,0);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:lineaSuperior];
        path.lineWidth = 2;
        [path stroke];
        
        [path moveToPoint:CGPointMake(0,0)];
        CGRect  lineaIzquierda = CGRectMake(0,0, 0,self.frame.size.height);
        path = [UIBezierPath bezierPathWithRect:lineaIzquierda];
        [path stroke];
        
        [[UIColor whiteColor] setStroke];
        [path moveToPoint:CGPointMake(self.frame.size.width,0)];
        CGRect  lineaDerecha = CGRectMake(self.frame.size.width,0,self.frame.size.width,self.frame.size.height);
        path = [UIBezierPath bezierPathWithRect:lineaDerecha];
        [path stroke];
        
        [path moveToPoint:CGPointMake(0,self.frame.size.height)];
        CGRect  lineaInferior = CGRectMake(0,self.frame.size.height,self.frame.size.width,self.frame.size.height);
        path = [UIBezierPath bezierPathWithRect:lineaInferior];
        [path stroke];    }

*/
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
    UIColor * lineaOscura =[[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:1];
    UIColor * lineaClara = [[UIColor alloc] initWithRed:.9 green:.9 blue:.9 alpha:1];
    NSInteger grosorDeLaLinea = 2;
    [self dibujarLineaSuperiorConColor:lineaClara conGrosor:grosorDeLaLinea];
    [self dibujarLineaIzquierdaConColor:lineaClara conGrosor:grosorDeLaLinea];
    [self dibujarLineaInferiorConColor:lineaOscura conGrosor:grosorDeLaLinea];
    [self dibujarLineaDerechaConColor:lineaOscura conGrosor:grosorDeLaLinea];
}
    
-(void) dibujarBorderCeldaProcesada{
    UIColor * lineaOscura =[[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:1];
    UIColor * lineaClara = [[UIColor alloc] initWithRed:1 green:1 blue:1 alpha:1];
    NSInteger grosorDeLaLinea = 1;
    [self dibujarLineaSuperiorConColor:lineaOscura conGrosor:grosorDeLaLinea];
    [self dibujarLineaIzquierdaConColor:lineaOscura conGrosor:grosorDeLaLinea];
    [self dibujarLineaInferiorConColor:lineaClara conGrosor:grosorDeLaLinea];
    [self dibujarLineaDerechaConColor:lineaClara conGrosor:grosorDeLaLinea];
}

#pragma mark - Auxiliares segundo nivel
-(void) dibujarLineaSuperiorConColor:(UIColor *)color conGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, 0);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,0);
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:color
                  conGrosor:grosor];
}

- (void) dibujarLineaInferiorConColor:(UIColor *) color conGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, self.bounds.size.height);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,self.bounds.size.height);
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:color
                  conGrosor:grosor];
}


- (void) dibujarLineaIzquierdaConColor:(UIColor *) color conGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(0, 0);
    CGPoint puntoFinal = CGPointMake(0,self.bounds.size.height);
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:color
                  conGrosor:grosor];
}

- (void) dibujarLineaDerechaConColor:(UIColor *) color conGrosor:(NSInteger)grosor{
    CGPoint puntoInicial = CGPointMake(self.bounds.size.width, 0);
    CGPoint puntoFinal = CGPointMake(self.bounds.size.width,self.bounds.size.height);
    [self dibujarLineaDesde:puntoInicial
                      hasta:(puntoFinal)
                   conColor:color
                  conGrosor:grosor];
}

#pragma mark - Auxiliares tercer nivel
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
