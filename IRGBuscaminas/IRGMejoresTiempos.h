//
//  IRGMejoresTiempos.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IRGMejoresTiempos : NSObject

#pragma mark - Incializadores
+ (instancetype) sharedMejoresTiempos;

#pragma mark Metodos publicos
- (void) anadirTiempo:(NSInteger)tiempo
               Nombre:(NSString *)nombre
       numeroDeCeldas:(NSInteger)numeroDeCeldas
        numeroDeMinas:(NSInteger)numeroDeMinas
             conAyuda:(bool)conAyuda
           dificultad:(NSInteger)dificultad
    imagendDelJugador:(UIImage *)imagenDelJugador;

- (NSArray *) todosLosMejoresTiempos;
- (NSArray *) mejoresTiempoDelNivel:(NSInteger) nivel;
- (bool) guardarMejoresTiempos;
- (void) borrarMejoresTiempos;


@end
