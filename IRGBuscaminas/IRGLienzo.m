//
//  IRGLienzo.m
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGLienzo.h"

# define ALTO_DE_LA_CELDA 30
# define ANCHO_DE_LA_CELDA 30
# define FILAS_DEL_LIENZO 29
# define COLUMNAS_DEL_LIENZO 25
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
    }
    return self;
}

#pragma mark - Accesors



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
