//
//  IRGSettings.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 21/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSettings.h"
#import "IRGMetodosComunes.h"

#pragma mark - Constantes de la clase



#pragma mark -
@implementation IRGSettings
#pragma mark -

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
            _porcerntajeDeTransparenciaDeLasCeldas = PORCENTAJE_DE_TRANSPARENCIA_DE_LAS_CELDAS_POR_DEFECTO;
            _porcerntajeDeTransparenciaDelMenu =PORCENTAJE_DE_TRANSPARENCIA_DEL_MENU_POR_DEFECTO;
            _tapPoneBandera = TAP_PONE_BANDERA_POR_DEFECTO;
            _sensibilidadDelTap = SENSIBILIDAD_TAP_POR_DEFECTO;
            _grupoDeImagenesDeLosBotones = GRUPO_DE_IMAGENES_DE_LOS_BOTONES_POR_DEFECTO;
            _mostrarPantallaDeAyuda = MOSTRAR_PANTALLA_DE_AYUDA_POR_DEFECTO;
        }
    }
    return self;
}

#pragma mark - Accesors

-(NSInteger) desplazamientoXDelCanvasEnModoHorizontal{
    return DESPLAZAMIENTO_X_DEL_CANVAS_DE_CELDAS_EN_MODO_HORIZONTAL;
}

- (UIColor *) colorPorDefectoDelNumeroDeMinasAlrededorDeUnaCelda{
    return [UIColor blackColor];
}

- (UIColor *) colorDeRellenoDeLaCeldaProcesada{
    return[COLOR_DE_RELLENO_DE_LA_CELDA_PROCESADA colorWithAlphaComponent:[IRGSettings sharedSettings].porcerntajeDeTransparenciaDeLasCeldas];
}

- (UIColor *) colorDeRellenoDeLaCeldaNoProcesada{
    return COLOR_DE_RELLENO_DE_LA_CELDA_NO_PROCESADA;
}

-(UIColor *) colorDeRellenoDeLaBarraDeBotones{
    return COLOR_DE_RELLENO_DE_LA_BARRA_DE_BOTONES;
}


#pragma mark - metodos publicos

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


#pragma mark - Recuperar y guardar Settings

-(instancetype) recuperarSettings:(NSString *)path{
    return   [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.numeroDeMinas forKey:@"numeroDeMinas"];
    [aCoder encodeBool:self.activarAyuda forKey:@"activarAyuda"];
    [aCoder encodeInteger:self.tiempoDeAyuda forKey:@"tiempoDeAyuda"];
    [aCoder encodeInteger:self.dificultad forKey:@"dificultad"];
    [aCoder encodeFloat:self.porcerntajeDeTransparenciaDeLasCeldas forKey:@"porcentajeDeTransparenciaDeLasCeldas"];
    [aCoder encodeFloat:self.porcerntajeDeTransparenciaDelMenu forKey:@"porcentajeDeTransparenciaDelMenu"];
    [aCoder encodeBool:self.tapPoneBandera forKey:@"tapPoneBandera"];
    [aCoder encodeFloat:self.sensibilidadDelTap forKey:@"sensibilidadDelTap"];
    [aCoder encodeInteger:self.grupoDeImagenesDeLosBotones forKey:@"grupoDeImagenesDeLosBotones"];
    [aCoder encodeBool:self.mostrarPantallaDeAyuda forKey:@"mostrarPantallaDeAyuda"];
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        _numeroDeMinas = [aDecoder decodeIntegerForKey:@"numeroDeMinas"];
        _activarAyuda  = [aDecoder decodeBoolForKey:@"activarAyuda"];
        _tiempoDeAyuda = [aDecoder decodeIntegerForKey:@"tiempoDeAyuda"];
        _dificultad = [aDecoder decodeIntegerForKey:@"dificultad"];
        _porcerntajeDeTransparenciaDeLasCeldas = [aDecoder decodeFloatForKey:@"porcentajeDeTransparenciaDeLasCeldas"];
        _porcerntajeDeTransparenciaDelMenu = [aDecoder decodeFloatForKey:@"porcentajeDeTransparenciaDelMenu"];
        _tapPoneBandera = [aDecoder decodeBoolForKey:@"tapPoneBandera"];
        _sensibilidadDelTap = [aDecoder decodeFloatForKey:@"sensibilidadDelTap"];
        _grupoDeImagenesDeLosBotones = [aDecoder decodeIntegerForKey:@"grupoDeImagenesDeLosBotones"];
        _mostrarPantallaDeAyuda = [aDecoder decodeBoolForKey:@"mostrarPantallaDeAyuda"];
    }
    return self;
}

-(bool) guardarSettings{
    NSString *path = [self obtenerPath];
    return [NSKeyedArchiver archiveRootObject:self
                                       toFile:path];
}


#pragma mark - Auxiliares de primer nivel

-(NSString *) obtenerPath{
    NSString *directorio ;
    if(GRABAR_EN_IPAD){
        NSArray *listaDePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                               NSUserDomainMask,
                                                               TRUE);
        directorio = listaDePath[0];
    }
    else {
        directorio = DIRECTORIO_DE_TRABAJO;
    }
    return [directorio stringByAppendingString:ARCHIVO_SETTIGS];
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

@end
