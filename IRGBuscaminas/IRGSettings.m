//
//  IRGSettings.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 21/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSettings.h"

#define NIVEL_DIFICULTAD_POR_DEFECTO 2
#define NUMERO_DE_MINAS_POR_DEFECTO 15
#define AYUDAS_ACTIVAS true
#define TIEMPO_DE_AYUDA_POR_DEFECTO 5
#define MINAS_POR_DEFECTO_DEL_NIVEL_1 10
#define MINAS_POR_DEFECTO_DEL_NIVEL_2 15
#define MINAS_POR_DEFECTO_DEL_NIVEL_3 20
#define TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_1 2
#define TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_2 5
#define TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_3 9


@interface IRGSettings ()


@end

@implementation IRGSettings
#pragma mark - Inicializadores

-(instancetype) init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
}

//designated initializer
+ (instancetype) sharedSettings{
    
    static IRGSettings * _settings;
    if(!_settings){
        _settings = [[IRGSettings alloc]initPrivado];
    }
    return _settings;
}

-(instancetype) initPrivado{
    self = [super init];
    if (self) {
        if ([self existeArchivo:[self obtenerPath]]){
            self = [self recuperarSettings:[self obtenerPath]];
        }
        else {
            _numeroDeMinas = NUMERO_DE_MINAS_POR_DEFECTO;
            _activarAyuda = AYUDAS_ACTIVAS;
            _tiempoDeAyuda = TIEMPO_DE_AYUDA_POR_DEFECTO;
            _dificultad =NIVEL_DIFICULTAD_POR_DEFECTO;
        }
    }
    return self;
}

#pragma mark Auxiliares de primer nivel

-(NSString *) obtenerPath{
    NSArray *listaDePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                               NSUserDomainMask,
                                                               TRUE);
    NSString *directorio = listaDePath[0];
    return [directorio stringByAppendingString:@"Configuracion.irg"];
}

-(BOOL) existeArchivo:(NSString *)pathArchivo{
    
    NSFileManager *fileManagerPrincipal = [NSFileManager defaultManager];
    if ([fileManagerPrincipal fileExistsAtPath:[self obtenerPath]]){
        return TRUE;
    }
    else{
        return FALSE;
    }
}

-(instancetype) recuperarSettings:(NSString *)path{
    return   [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.numeroDeMinas forKey:@"numeroDeMinas"];
    [aCoder encodeBool:self.activarAyuda forKey:@"activarAyuda"];
    [aCoder encodeInteger:self.tiempoDeAyuda forKey:@"tiempoDeAyuda"];
    [aCoder encodeInteger:self.dificultad forKey:@"dificultad"];
    
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        _numeroDeMinas = [aDecoder decodeIntegerForKey:@"numeroDeMinas"];
        _activarAyuda  = [aDecoder decodeBoolForKey:@"activarAyuda"];
        _tiempoDeAyuda = [aDecoder decodeIntegerForKey:@"tiempoDeAyuda"];
        _dificultad = [aDecoder decodeIntegerForKey:@"dificultad"];
    }
    return self;
}

-(bool) guardarSettings{
    NSString *path = [self obtenerPath];
    return [NSKeyedArchiver archiveRootObject:self
                                       toFile:path];
}

-(NSInteger)numeroDeMInasPorDefectoDelNivel:(NSInteger)nivelDeDificultad{
    NSInteger minasADevolver=NUMERO_DE_MINAS_POR_DEFECTO;
    
    if (nivelDeDificultad == 1){
        minasADevolver = MINAS_POR_DEFECTO_DEL_NIVEL_1;
    }
    if (nivelDeDificultad == 2){
        minasADevolver = MINAS_POR_DEFECTO_DEL_NIVEL_2;
    }
    if (nivelDeDificultad == 3){
        minasADevolver = MINAS_POR_DEFECTO_DEL_NIVEL_3;
    }
    return minasADevolver;
}

-(NSInteger)tiempoDeAyudaPorDefectoDelNivel:(NSInteger)nivelDeDificultad{
    NSInteger minasADevolver=TIEMPO_DE_AYUDA_POR_DEFECTO;
    
    if (nivelDeDificultad == 1){
        minasADevolver = TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_1;
    }
    if (nivelDeDificultad == 2){
        minasADevolver = TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_2;
    }
    if (nivelDeDificultad == 3){
        minasADevolver = TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_3;
    }
    return minasADevolver;
}

@end
