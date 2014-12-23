//
//  IRGDatoDelMejorTiempo.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGDatoDelMejorTiempo.h"

@implementation IRGDatoDelMejorTiempo

#pragma mark - Inicializadores
-(instancetype) int{
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
}

// designated initializer
- (instancetype) initConTiempo: (NSInteger)tiempo
                        nombre:(NSString *)nombre
                numeroDeCeldas:(NSInteger) numeroDeCeldas
                 numeroDeMinas:(NSInteger) numeroDeMinas
                      conAyuda:(bool)conAyuda
                    dificultad:(NSInteger)dificultad
              imagenDelJugador:(UIImage *)imagenDelJugador

{
    self = [super init];
    if (self){
        _tiempo = tiempo;
        _nombre = nombre;
        _numeroDeCeldas = numeroDeCeldas;
        _numeroDeMinas = numeroDeMinas;
        _conAyuda = conAyuda;
        _dificultad = dificultad;
        _imagenDelJugador = imagenDelJugador;
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        _tiempo = [aDecoder decodeIntegerForKey:@"tiempo"];
        _nombre = [aDecoder decodeObjectForKey:@"nombre"];
        _numeroDeCeldas = [aDecoder decodeIntegerForKey:@"numeroDeCeldas"];
        _numeroDeMinas = [aDecoder decodeIntegerForKey:@"numeroDeMinas"];
        _conAyuda = [aDecoder decodeBoolForKey:@"conAyuda"];
        _dificultad = [aDecoder decodeIntegerForKey:@"dificultad"];
        _imagenDelJugador = [aDecoder decodeObjectForKey:@"imagenDelJugador"];
        
    }
    return self;
}

#pragma mark - Overrides

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.tiempo forKey:@"tiempo"];
    [aCoder encodeObject:self.nombre forKey:@"nombre"];
    [aCoder encodeInteger:self.numeroDeCeldas forKey:@"numeroDeCeldas"];
    [aCoder encodeInteger:self.numeroDeMinas forKey:@"numeroDeMinas"];
    [aCoder encodeBool:self.conAyuda forKey:@"conAyuda"];
    [aCoder encodeInteger:self.dificultad forKey:@"dificultad"];
    [aCoder encodeObject:self.imagenDelJugador forKey:@"imagenDelJugador"];
}
@end

