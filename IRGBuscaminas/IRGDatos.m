//
//  IRGDatos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGDatos.h"
#import "IRGLienzo.h"

#define NUMERO_DE_MINAS_POR_DEFECTO 40

@interface IRGDatos ()
@property (nonatomic) NSMutableArray * celdasDelJuego;

@end

@implementation IRGDatos

#pragma mark - Inicializadores

-(instancetype) init{
    [NSException exceptionWithName:@"Invalid init" reason:@"Singleton" userInfo:nil];
    return false;
}
//designated initializer
+ (instancetype) sharedDatos{
    
    static IRGDatos *_datos;
    if(!_datos){
        _datos = [[IRGDatos alloc]initPrivado];
    }
    return _datos;
}

-(instancetype) initPrivado{
    self = [super init];
    
    if (self) {
    }
    return self;
}


#pragma mark - Accesosrs

-(int) numeroDeMinas{
    if (_numeroDeMinas == 0){
        return NUMERO_DE_MINAS_POR_DEFECTO;
    }
    else {
        return _numeroDeMinas;
    }
}

-(NSArray *) celdasDelJuego{
    if (!_celdasDelJuego){
        _celdasDelJuego = [[NSMutableArray alloc] init];
    }
    return _celdasDelJuego;
}

#pragma mark - Porpios Publicos

-(void) anadirCeldaViewController:(IRGCeldaViewController *)celdaViewControllerNuevo{
    [self.celdasDelJuego addObject:celdaViewControllerNuevo];
}

- (void) borrarJuego{
    self.celdasDelJuego = [[NSMutableArray alloc]init];
}

- (NSArray *) todasLasCeldas{
    return self.celdasDelJuego;
}

- (IRGCeldaViewController *) celdaDeLaFila:(NSInteger) fila
                                   columna:(NSInteger) columna{
    if ((fila >= 0) & (columna >= 0) & (columna < [IRGLienzo sharedLienzo].columnasDelLienzo) & (fila<[IRGLienzo sharedLienzo].filasDelLienzo)){
        NSInteger numeroDeCelda = fila*[IRGLienzo sharedLienzo].columnasDelLienzo;
        numeroDeCelda = numeroDeCelda+columna;
        return self.celdasDelJuego[numeroDeCelda];
    }
    else{
        return nil;
    }
}

- (BOOL) tieneMinasAlrededor:(IRGCeldaViewController *) celdaViewcontroller{
    
    NSArray * celdasAlrededor = [[NSMutableArray alloc] init];
    NSArray *celdasAlrededorSinMinas = [[NSMutableArray alloc] init];
    
    celdasAlrededor = [[IRGDatos sharedDatos] celdasAlrededorDe:celdaViewcontroller];
    celdasAlrededorSinMinas = [[IRGDatos sharedDatos]celdasSinMinasAlrededorDe:celdaViewcontroller incluyendoEsquinas:true];
    
    return ([celdasAlrededor count] == [celdasAlrededorSinMinas count]);
    
}

- (NSInteger) numeroDeMinasAlrededor:(IRGCeldaViewController *) celdaViewcontroller{
    return [[self celdasAlrededorDe:celdaViewcontroller]count] -[[self celdasSinMinasAlrededorDe:celdaViewcontroller incluyendoEsquinas:true] count];
}

- (NSArray *) celdasSinMinasAlrededorDe: (IRGCeldaViewController *) celdaViewcontroller
                     incluyendoEsquinas:(bool)incluirEsquinas{
    
    NSMutableArray * conjuntoDeCeldasSinMinas = [[NSMutableArray alloc]init];
    
    NSArray * conjuntoDeCeldasAlrededor = [self celdasAlrededorDe:celdaViewcontroller];
    
    for (IRGCeldaViewController * cvc in conjuntoDeCeldasAlrededor){
        if (!cvc.tieneMina){
            [conjuntoDeCeldasSinMinas addObject:cvc];
        }
    }
    return conjuntoDeCeldasSinMinas;
}

- (NSArray *) celdasAlrededorDe:(IRGCeldaViewController *)celdaViewcontroller{
    
    NSMutableArray * conjuntoDeCeldas = [[NSMutableArray alloc]init];
    
    IRGCeldaViewController *celdaSuperioIzquierda =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila-1
                                                               columna:celdaViewcontroller.numeroDeColumna-1];
    
    IRGCeldaViewController *celdaSuperior =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila-1
                                                       columna:celdaViewcontroller.numeroDeColumna];
    IRGCeldaViewController *celdaSuperiorDerecha =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila-1
                                                              columna:celdaViewcontroller.numeroDeColumna+1];
    IRGCeldaViewController *celdaIzquierda =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila
                                                        columna:celdaViewcontroller.numeroDeColumna-1];
    IRGCeldaViewController *celdaDerecha =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila
                                                      columna:celdaViewcontroller.numeroDeColumna+1];
    IRGCeldaViewController *celdaInferiorIzquierda =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila+1
                                                                columna:celdaViewcontroller.numeroDeColumna-1];
    IRGCeldaViewController *celdaInferior =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila+1
                                                       columna:celdaViewcontroller.numeroDeColumna];
    IRGCeldaViewController *celdaInferiorDerecha =[self celdaDeLaFila:celdaViewcontroller.numeroDeFila+1
                                                              columna:celdaViewcontroller.numeroDeColumna+1];
    if (celdaSuperioIzquierda!=nil){
        [conjuntoDeCeldas addObject:celdaSuperioIzquierda];
    }
    
    if (celdaSuperiorDerecha!=nil){
        [conjuntoDeCeldas addObject:celdaSuperiorDerecha];
    }
    if (celdaInferiorIzquierda!=nil){
            [conjuntoDeCeldas addObject:celdaInferiorIzquierda];
    }
    if (celdaInferiorDerecha!=nil){
        [conjuntoDeCeldas addObject:celdaInferiorDerecha];
    }
    
    if(celdaSuperior!=nil){
        [conjuntoDeCeldas addObject:celdaSuperior];
    }
    if (celdaIzquierda!=nil) {
        [conjuntoDeCeldas addObject:celdaIzquierda];
    }
    if (celdaDerecha!=nil) {
        [conjuntoDeCeldas addObject:celdaDerecha];
    }
    if (celdaInferior!=nil){
        [conjuntoDeCeldas addObject:celdaInferior];
    }
    return conjuntoDeCeldas;
}



@end