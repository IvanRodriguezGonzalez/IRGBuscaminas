//
//  IRGPincel.m
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGPincel.h"
#import "IRGLienzo.h"

@implementation IRGPincel

#pragma mark - Inicializadores

-(instancetype) init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Use [IRGPincel sharedPincel]" userInfo:nil];
    return false;
}

//designated initializer
+ (instancetype) sharedPincel{
    
    static IRGPincel *_pincel;
    if(!_pincel){
        _pincel = [[IRGPincel alloc]initPrivado];
    }
    return _pincel;
}

-(instancetype) initPrivado{
    self = [super init];
    if (self) {
        [self establecerPincelPorDefecto];
    }
    return self;
}

- (void) establecerPincelPorDefecto{
    self.colorDeTrazoDelPincel = [[UIColor alloc]initWithRed:.65 green:.65 blue:.65 alpha:1];
    self.grosorDelTrazoDelPincel = 1;
}

#pragma mark - Accesosr

- (UIColor *) colorDelNumeroDeMInas{
    return [UIColor blackColor];
}


-(UIColor *) colorDeRellenoDePantallaNormal{
    return [[UIColor alloc]initWithRed:.8 green:.8 blue:.8 alpha:1];
}

- (UIColor *) colorDeRellenoDelPincel{
    return[[UIColor alloc]initWithRed:.7 green:.7 blue:.7 alpha:1];
}

- (UIColor *) colorDeRellenoDeLaCeldaVacia{
    return [[UIColor alloc]initWithRed:.9 green:.9 blue:.9 alpha:1];
    
}

-(UIColor *) colorDeRellenoDePantallaDeError{
    return [[UIColor alloc] initWithRed:.8 green:.1 blue:.2  alpha:1];
}

-(UIColor *) colorDeRellenoDePantallaDeVictoria{
    return [[UIColor alloc] initWithRed:0 green:.5 blue:0 alpha:1];;
}

-(UIColor *) colorDeRellenoDePantallaDeModoAyuda{
    return [[UIColor alloc] initWithRed:1 green:1 blue:1 alpha:1];
}

-(UIColor *) colorEtiquetaDeBotonSeleccionado{
    return [[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:1];
}

-(UIColor *) colorEtiquetaDeBotonNormal{
    return [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1];
}
@end
