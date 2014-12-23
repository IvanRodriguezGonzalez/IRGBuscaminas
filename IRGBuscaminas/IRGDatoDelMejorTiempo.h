//
//  IRGDatoDelMejorTiempo.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IRGDatoDelMejorTiempo : NSObject<NSCoding>
#pragma mark Propiedades publicas
@property (nonatomic) NSInteger tiempo;
@property (nonatomic) NSString * nombre;
@property (nonatomic) NSInteger numeroDeCeldas;
@property (nonatomic )NSInteger numeroDeMinas;
@property (nonatomic) BOOL conAyuda;
@property (nonatomic) NSInteger dificultad;
@property (nonatomic) UIImage *imagenDelJugador;

#pragma mark - Inicializadores
//designated initializer
- (instancetype) initConTiempo: (NSInteger)tiempo
                        nombre:(NSString *)nombre
                numeroDeCeldas:(NSInteger) numeroDeCeldas
                 numeroDeMinas:(NSInteger) numeroDeMinas
                      conAyuda:(bool) conAyuda
                    dificultad:(NSInteger) dificultad
              imagenDelJugador:(UIImage*)imagenDelJugador;

@end
