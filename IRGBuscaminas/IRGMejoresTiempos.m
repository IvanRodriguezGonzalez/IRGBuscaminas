//
//  IRGMejoresTiempos.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGMejoresTiempos.h"
#import "IRGDatoDelMejorTiempo.h"
#import "IRGMetodosComunes.h"


#pragma mark -
@interface IRGMejoresTiempos ()
#pragma mark Propiedades privadas
    @property (nonatomic) NSMutableArray *mejoresTiempos;
@end


#pragma mark -
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
        if ([self existeArchivo:[self obtenerPath]]){
            _mejoresTiempos = [self recuperarMejoresTiempos:[self obtenerPath]];
        }
        else {
            _mejoresTiempos = [[NSMutableArray alloc] init];
        }
    }
   return self;
}

#pragma mark - Metodos publicos

- (void) anadirTiempo:(NSInteger)tiempo
               Nombre:(NSString *)nombre
       numeroDeCeldas:(NSInteger)numeroDeCeldas
        numeroDeMinas:(NSInteger)numeroDeMinas
             conAyuda:(bool)conAyuda
           dificultad:(NSInteger)dificultad
{
    IRGDatoDelMejorTiempo * datoDelMejorTiempo = [[IRGDatoDelMejorTiempo alloc]initConTiempo:tiempo
                                                                                    nombre:nombre
                                                                            numeroDeCeldas:numeroDeCeldas
                                                                             numeroDeMinas:numeroDeMinas
                                                                                    conAyuda:conAyuda
                                                                                  dificultad:dificultad];
    [self.mejoresTiempos insertObject:datoDelMejorTiempo atIndex:0];
    
    [self guardarMejoresTiempos];
}

- (NSArray *) todosLosMejoresTiempos{
    return self.mejoresTiempos;
}

- (NSArray *) mejoresTiempoDelNivel:(NSInteger) nivel{
    NSPredicate * condicionDeBusqueda = [NSPredicate predicateWithFormat:@"dificultad = %d",
                                       nivel];
    return [self.mejoresTiempos filteredArrayUsingPredicate:condicionDeBusqueda];
    
}

- (bool) guardarMejoresTiempos{
    NSString *path = [self obtenerPath];
    return [NSKeyedArchiver archiveRootObject:self.mejoresTiempos
                                       toFile:path];
}

- (void) borrarMejoresTiempos{
    self.mejoresTiempos = [[NSMutableArray alloc] init];
    [self guardarMejoresTiempos];
};


#pragma mark - Auxiliares primer nivel

- (void) inicializarMejoresTiempos{
    self.mejoresTiempos = [[NSMutableArray alloc]init];
}


-(NSString *) obtenerPath{
    NSString *directorio;
    if (GRABAR_EN_IPAD) {
        NSArray *listaDePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                   NSUserDomainMask,
                                                                   TRUE);
        directorio = listaDePath[0];
    }
    else {
        directorio = DIRECTORIO_DE_TRABAJO;
    }
   return [directorio stringByAppendingString:@"/Resultados.irg"];
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

-(NSMutableArray *) recuperarMejoresTiempos:(NSString *)path{
    return   [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end