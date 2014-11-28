//
//  IRGPincel.m
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGPincel.h"
#import "IRGSettings.h"

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
    return [UIColor clearColor];
}

- (UIColor *) colorDeRellenoDelPincel{
   // return [UIColor clearColor];
    return[[[UIColor alloc]initWithRed:.8 green:.8 blue:.8 alpha:1] colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparencia];
}

- (UIColor *) colorDeRellenoDeLaCeldaVacia{
   return [[UIColor alloc]initWithRed:.7 green:.7 blue:.7 alpha:1];
}

-(UIColor *) colorDeRellenoDePantallaDeError{
    return [UIColor clearColor];
}

-(UIColor *) colorDeRellenoDePantallaDeVictoria{
    return [UIColor clearColor];
}

-(UIColor *) colorDeRellenoDePantallaDeModoAyuda{
    return [UIColor clearColor];
}

-(UIColor *) colorEtiquetaDeBotonSeleccionado{
    return [[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:1];
}

-(UIColor *) colorEtiquetaDeBotonNormal{
    return [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1];
}
@end
