//
//  IRGMetodosComunes.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 9/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGMetodosComunes.h"




@implementation IRGMetodosComunes

+ (NSString *) formatearTiempoDeJuegoEnSegundos:(NSInteger)tiempoEnSegundos{
    NSInteger minutos = tiempoEnSegundos / 60;
    NSInteger segundos = tiempoEnSegundos - minutos*60;
    NSString * textoDeMinutos;
    NSString * textoDeSegundos;
    if (minutos<10){
        textoDeMinutos = [NSString stringWithFormat:@"0%ld",(long)minutos];
    }
    else{
        textoDeMinutos = [NSString stringWithFormat:@"%ld",(long)minutos];
    }
    
    if (segundos<10){
        textoDeSegundos = [NSString stringWithFormat:@"0%ld",(long)segundos];
    }
    else{
        textoDeSegundos = [NSString stringWithFormat:@"%ld",(long)segundos];
    }
    return [NSString stringWithFormat:@"%@:%@",textoDeMinutos,textoDeSegundos ];
}

+ (void)guardarImagen: (UIImage*)image conNombre:(NSString *)nombreDeLaImagen
{
    if (image != nil)
    {
        NSString *directorio;
        if (GRABAR_EN_IPAD){
            NSArray *listaDePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       TRUE);
            directorio = listaDePath[0];
        }
        else {
            directorio = DIRECTORIO_DE_TRABAJO;
        }

        NSString * path= [directorio stringByAppendingPathComponent:
                              [NSString stringWithString: nombreDeLaImagen] ];
        
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
}

+ (UIImage*)leerImagenConNombre:(NSString *)nombreDeLaImagen
{
    NSString *documentsDirectory;
    if (GRABAR_EN_IPAD){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        documentsDirectory = [paths objectAtIndex:0];
    }
    else {
        documentsDirectory = DIRECTORIO_DE_TRABAJO;
    }
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      [NSString stringWithString: nombreDeLaImagen] ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
