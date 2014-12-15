//
//  IRGMejoresTiemposViewController.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGMejoresTiemposViewController.h"
#import"IRGMetodosComunes.h"
#import "IRGMejoresTiempos.h"
#import "IRGDatoDelMejorTiempo.h"
#import "IRGMejoresTiemposTableViewCell.h"

#define  celdaDatosJugador @"celdaDatosJugardor"



@implementation IRGMejoresTiemposViewController

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Delegado
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    return [[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IRGMejoresTiemposTableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"IRGMejoresTiemposTableViewCell"];

    if (!celda){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IRGMejoresTiemposTableViewCell" owner:self options:nil];
        celda = (IRGMejoresTiemposTableViewCell *)[nib objectAtIndex:0];
    }
    
    NSInteger filaDeLaTabla  = indexPath.row;
    IRGDatoDelMejorTiempo *mejorTiempo =[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos[filaDeLaTabla];

    celda.nombreDelJugador.text = mejorTiempo.nombre;
    celda.tiempoDelJugador.text =[IRGMetodosComunes formatearTiempoDeJuegoEnSegundos:mejorTiempo.tiempo];
    UIImage *imagenDeDificultad;
    switch (mejorTiempo.dificultad) {
        case 1:
            celda.dificultadDeLaPartida.text = @"Fácil";;
            imagenDeDificultad = [UIImage imageNamed:@"dificultad_facil.png"];
            break;
        case 2:
            celda.dificultadDeLaPartida.text = @"Media";
            imagenDeDificultad = [UIImage imageNamed:@"dificultad_media.png"];
            break;
        case 3:
            celda.dificultadDeLaPartida.text = @"Dificil";
            imagenDeDificultad = [UIImage imageNamed:@"dificultad_dificil.png"];
            break;
        default:
            celda.dificultadDeLaPartida.text = @"";
            break;
    }
    celda.graficoDeDificultad.image = imagenDeDificultad;
    celda.numeroDeMinas.text = [NSString stringWithFormat:@"%ld", (long)mejorTiempo.numeroDeMinas];
    if(mejorTiempo.conAyuda){
        celda.conAyuda.alpha = 1;
    }
    else{
        celda.conAyuda.alpha = 0;
    }
    NSLog(@"%f",celda.graficoDeDificultad.frame.size.height);
    return celda;
}


#pragma mark - Navigation
- (IBAction)accionCerrarVentana:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:TRUE
                                                      completion:nil];
}


@end
