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
        
        if ([self existeArchivo:[self obtenerPath]]){
            _mejoresTiempos = [self recuperarMejoresTiempos:[self obtenerPath]];
        }
        else {
            _mejoresTiempos = [[NSMutableArray alloc] init];
        }
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
        numeroDeMinas:(NSInteger)numeroDeMinas
             conAyuda:(bool)conAyuda{
    IRGDatoDelMejorTiempo * datoDelMejorTiempo = [[IRGDatoDelMejorTiempo alloc]initConTiempo:tiempo
                                                                                    nombre:nombre
                                                                            numeroDeCeldas:numeroDeCeldas
                                                                             numeroDeMinas:numeroDeMinas
                                                                                    conAyuda:conAyuda];
    [self.mejoresTiempos addObject:datoDelMejorTiempo];
    [self guardarMejoresTiempos];
}

- (NSArray *) todosLosMejoresTiempos{
    return self.mejoresTiempos;
}

#pragma mark Auxiliares primer nivel
-(bool) guardarMejoresTiempos{
    NSString *path = [self obtenerPath];
    NSArray * a = self.mejoresTiempos;
    return [NSKeyedArchiver archiveRootObject:self.mejoresTiempos
                                       toFile:path];
}




#pragma mark Funciones auxiliares

-(NSString *) obtenerPath{
    NSArray *listaDePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                               NSUserDomainMask,
                                                               TRUE);
    //NSString *directorio = listaDePath[0];
    NSString * directorio = @"/Users/IRG/Desktop/TopScores/";
   return [directorio stringByAppendingString:@"Resultados.irg"];
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