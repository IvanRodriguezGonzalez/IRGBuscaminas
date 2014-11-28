//
//  IRGSettings.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 21/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSettings.h"

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
            _numeroDeMinas = 33;
            _activarAyuda = true;
            _tiempoDeAyuda = 6;
        }
    }
    return self;
}

#pragma mark Auxiliares de primer nivel

-(NSString *) obtenerPath{
    NSArray *listaDePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                               NSUserDomainMask,
                                                               TRUE);
    //NSString *directorio = listaDePath[0];
    NSString * directorio = @"/Users/LVS/Desktop/TopScores/";
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
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        _numeroDeMinas = [aDecoder decodeIntegerForKey:@"numeroDeMinas"];
        _activarAyuda  = [aDecoder decodeBoolForKey:@"activarAyuda"];
        _tiempoDeAyuda = [aDecoder decodeIntegerForKey:@"tiempoDeAyuda"];
    }
    return self;
}

-(bool) guardarSettings{
    NSString *path = [self obtenerPath];
    return [NSKeyedArchiver archiveRootObject:self
                                       toFile:path];
}


@end
