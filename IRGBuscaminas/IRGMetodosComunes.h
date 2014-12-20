//
//  IRGMetodosComunes.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 9/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//
// constantes de la clase IRGSettings
//
#define NIVEL_DIFICULTAD_POR_DEFECTO 1
#define NUMERO_DE_MINAS_POR_DEFECTO 15
#define AYUDAS_ACTIVAS true
#define TIEMPO_DE_AYUDA_POR_DEFECTO 5
#define MINAS_POR_DEFECTO_DEL_NIVEL_1 10
#define MINAS_POR_DEFECTO_DEL_NIVEL_2 25
#define MINAS_POR_DEFECTO_DEL_NIVEL_3 40
#define TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_1 2
#define TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_2 5
#define TIEMPO_DE_AYUDA_POR_DEFECTO_DEL_NIVEL_3 9
#define PORCENTAJE_DE_TRANSPARENCIA_DE_LAS_CELDAS_POR_DEFECTO 1
#define PORCENTAJE_DE_TRANSPARENCIA_DEL_MENU_POR_DEFECTO 1
#define TAP_PONE_BANDERA_POR_DEFECTO true;
#define SENSIBILIDAD_TAP_POR_DEFECTO .2
#define GRUPO_DE_IMAGENES_DE_LOS_BOTONES_POR_DEFECTO 1

//Colores
#define COLOR_DE_RELLENO_DE_LA_CELDA_PROCESADA [[UIColor alloc]initWithRed:.8 green:.8 blue:.8 alpha:1]

#define COLOR_DE_RELLENO_DE_LA_CELDA_NO_PROCESADA [[UIColor alloc]initWithRed:.7 green:.7 blue:.7 alpha:1]
#define COLOR_DE_RELLENO_DE_LA_BARRA_DE_BOTONES [UIColor lightGrayColor]

#define DESPLAZAMIENTO_X_DEL_CANVAS_DE_CELDAS_EN_MODO_HORIZONTAL 50

#define GRABAR_EN_IPAD TRUE
#define DIRECTORIO_DE_TRABAJO @"/Users/IRG/Desktop"
#define ARCHIVO_SETTIGS @"/IRGSettings.conf"
#define ARCHIVO_IMAGEN_DEL_FONDO @"/Fondo.png"



@interface IRGMetodosComunes : NSObject

+ (NSString *) formatearTiempoDeJuegoEnSegundos:(NSInteger)tiempoEnSegundos;
+ (void)guardarImagen: (UIImage*)image conNombre:(NSString *)nombreDeLaImagen;
+ (UIImage*)leerImagenConNombre:(NSString *)nombreDeLaImagen;


@end
