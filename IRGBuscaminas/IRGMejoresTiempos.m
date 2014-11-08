//
//  IRGMejoresTiempos.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGMejoresTiempos.h"
#import "IRGDatoDelMejorTiempo.h"

@interface IRGMejoresTiempos ()
@property (nonatomic) NSMutableArray *mejoresTiempos;

@end

@implementation IRGMejoresTiempos

#pragma mark - Inicializadores

-(instancetype) init {
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
}

//designated initializer
+ (instancetype) sharedMejoresTiempos{
    
    static IRGMejoresTiempos *_mejoresTiempos;
    if(!_mejoresTiempos){
        _mejoresTiempos = [[IRGMejoresTiempos alloc]initPrivado];
    }
    return _mejoresTiempos;
}

-(instancetype) initPrivado{
    self = [super init];
    if (self) {
        [self inicializarMejoresTiempos];
        [self anadirTiempo:99 Nombre:@"Ivan1" numeroDeCeldas:100 numeroDeMinas:40];
        [self anadirTiempo:210 Nombre:@"Ivan2" numeroDeCeldas:50 numeroDeMinas:20];
        [self anadirTiempo:230 Nombre:@"Ivan3" numeroDeCeldas:60 numeroDeMinas:30];
        
        
    }
    return self;
}

#pragma mark - Auxiliares primer nivel

- (void) inicializarMejoresTiempos{
    self.mejoresTiempos = [[NSMutableArray alloc]init];
}

- (void) anadirTiempo:(NSInteger)tiempo
               Nombre:(NSString *)nombre
       numeroDeCeldas:(NSInteger)numeroDeCeldas
        numeroDeMinas:(NSInteger)numeroDeMinas{
    IRGDatoDelMejorTiempo * datoDelMejorTiempo = [[IRGDatoDelMejorTiempo alloc]initConTiempo:tiempo
                                                                                    nombre:nombre
                                                                            numeroDeCeldas:numeroDeCeldas
                                                                             numeroDeMinas:numeroDeMinas];
    [self.mejoresTiempos addObject:datoDelMejorTiempo];
}

- (NSArray *) todosLosMejoresTiempos{
    return self.mejoresTiempos;
}

@end
