//
//  IRGLienzo.m
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGLienzo.h"
#import "IRGSettings.h"

#pragma mark - Constantes

# define ALTO_DE_LA_CELDA_NIVEL1 84
# define ANCHO_DE_LA_CELDA_NIVEL1 84


# define ALTO_DE_LA_CELDA_NIVEL2 56
# define ANCHO_DE_LA_CELDA_NIVEL2 56

# define ALTO_DE_LA_CELDA_NIVEL3 42
# define ANCHO_DE_LA_CELDA_NIVEL3 42

# define FILAS_DEL_LIENZO_Nivel_1 8
# define COLUMNAS_DEL_LIENZO_Nivel_1 8

# define FILAS_DEL_LIENZO_Nivel_2 12
# define COLUMNAS_DEL_LIENZO_Nivel_2 12

# define FILAS_DEL_LIENZO_Nivel_3 16
# define COLUMNAS_DEL_LIENZO_Nivel_3 16

#pragma mark -
@implementation IRGLienzo
#pragma mark -


#pragma mark  - Inicializadores

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
    if ([IRGSettings sharedSettings].dificultad == 1){
        _anchoCelda = ANCHO_DE_LA_CELDA_NIVEL1 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 2){
        _anchoCelda = ANCHO_DE_LA_CELDA_NIVEL2 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 3){
        _anchoCelda = ANCHO_DE_LA_CELDA_NIVEL3;
    }
        return  _anchoCelda;
}

-(NSInteger) altoCelda{
    if ([IRGSettings sharedSettings].dificultad == 1){
        _altoCelda = ALTO_DE_LA_CELDA_NIVEL1 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 2){
        _altoCelda = ALTO_DE_LA_CELDA_NIVEL2 ;
    }
    if ([IRGSettings sharedSettings].dificultad == 3){
        _altoCelda = ALTO_DE_LA_CELDA_NIVEL3;
    }
    return  _altoCelda;

}

@end
