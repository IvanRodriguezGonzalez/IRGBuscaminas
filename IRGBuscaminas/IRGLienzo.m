//
//  IRGLienzo.m
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGLienzo.h"

# define ALTO_DE_LA_CELDA 20
# define ANCHO_DE_LA_CELDA 20
# define FILAS_DEL_LIENZO 15
# define COLUMNAS_DEL_LIENZO 15
# define TAMANO_MINIMO_PARA_PINTAR_BORDE 5



@implementation IRGLienzo


#pragma mark Inicializadores

-(instancetype) init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Use [IRGLienzo sharedLienzo]" userInfo:nil];
    return false;
}
//designated initializer
+ (instancetype) sharedLienzo{
    
    static IRGLienzo *_lienzo;
    if(!_lienzo){
        _lienzo = [[IRGLienzo alloc]initPrivado];
    }
    return _lienzo;
}

-(instancetype) initPrivado{
    self = [super init];
    
    if (self) {
        [self establecerCeldaSinPintarPorDefecto];
    }
    return self;
}

#pragma mark - Accesors

- (void) establecerCeldaSinPintarPorDefecto {
    self.colorDelTrazoDeLaCeldaSinPintar = [UIColor blackColor];
    self.colorDelRellenoDeLaCeldaSinPintar = [UIColor lightGrayColor];
    self.grosoDelTrazoDeLaCeldaSinPintar = 1;
}


-(NSInteger) filasDelLienzo {
    if (_filasDelLienzo == 0) {
        return FILAS_DEL_LIENZO;
    }
    else{
        return  _filasDelLienzo;
    }
}

-(NSInteger) columnasDelLienzo {
    if (_columnasDelLienzo ==0) {
        return   COLUMNAS_DEL_LIENZO;
    }
    else {
    return _columnasDelLienzo;
    }
}

-(NSInteger) anchoCelda{
        return  ANCHO_DE_LA_CELDA;
}

-(NSInteger) altoCelda{
  return ALTO_DE_LA_CELDA;
}

#pragma mark - Propios Publicos


@end
