//
//  IRGDatoDelMejorTiempo.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGDatoDelMejorTiempo.h"

@implementation IRGDatoDelMejorTiempo

-(instancetype) int{
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
}

// designated initializer
- (instancetype) initConTiempo: (NSInteger)tiempo
                        nombre:(NSString *)nombre
                numeroDeCeldas:(NSInteger) numeroDeCeldas
                 numeroDeMinas:(NSInteger) numeroDeMinas{
    self = [super init];
    if (self){
        _tiempo = tiempo;
        _nombre = nombre;
        _numeroDeCeldas = numeroDeCeldas;
        _numeroDeMinas = numeroDeMinas;
    }
    return self;
}

@end
