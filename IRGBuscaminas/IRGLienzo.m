//
//  IRGLienzo.m
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGLienzo.h"
#import "IRGSettings.h"

# define ALTO_DE_LA_CELDA 50
# define ANCHO_DE_LA_CELDA 50
# define FILAS_DEL_LIENZO_Nivel_1 8
# define COLUMNAS_DEL_LIENZO_Nivel_1 8

# define FILAS_DEL_LIENZO_Nivel_2 12
# define COLUMNAS_DEL_LIENZO_Nivel_2 12

# define FILAS_DEL_LIENZO_Nivel_3 15
# define COLUMNAS_DEL_LIENZO_Nivel_3 15



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
    if ([IRGSettings sharedSettings].dificultad == 1){
        _filasDelLienzo = FILAS_DEL_LIENZO_Nivel_1 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 2){
        _filasDelLienzo = FILAS_DEL_LIENZO_Nivel_2 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 3){
        _filasDelLienzo = FILAS_DEL_LIENZO_Nivel_3 ;
    }
    return _filasDelLienzo;
        }

-(NSInteger) columnasDelLienzo {
    if ([IRGSettings sharedSettings].dificultad == 1){
        _columnasDelLienzo = COLUMNAS_DEL_LIENZO_Nivel_1 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 2){
        _columnasDelLienzo = COLUMNAS_DEL_LIENZO_Nivel_2 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 3){
        _columnasDelLienzo = COLUMNAS_DEL_LIENZO_Nivel_3 ;
    }
    return _columnasDelLienzo;
}


-(NSInteger) anchoCelda{
        return  ANCHO_DE_LA_CELDA;
}

-(NSInteger) altoCelda{
  return ALTO_DE_LA_CELDA;
}

#pragma mark - Propios Publicos


@end
