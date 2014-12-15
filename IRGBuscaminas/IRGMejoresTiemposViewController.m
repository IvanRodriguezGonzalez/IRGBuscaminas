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
    NSLog(@"Ancho: %f Alto: %f",celda.frame.size.width,celda.frame.size.height);

    celda.nombreDelJugador.text = mejorTiempo.nombre;
/*
    NSInteger filaDeLaTabla  = indexPath.row;
    IRGDatoDelMejorTiempo *mejorTiempo =[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos[filaDeLaTabla];
   
    NSString * timepoDeJuegoFormateado =  [IRGMetodosComunes formatearTiempoDeJuegoEnSegundos:mejorTiempo.tiempo];
    
    NSString *conAyuda;
    if(mejorTiempo.conAyuda){
        conAyuda = @"Si";
    }
    else{
        conAyuda = @"No";
    }
    
    
    NSString * detalle = [NSString stringWithFormat:@"Tiempo:%@ Celdas:%ld Minas:%ld Con ayuda:%@",
                          timepoDeJuegoFormateado,
                          (long)mejorTiempo.numeroDeCeldas,
                          (long)mejorTiempo.numeroDeMinas,conAyuda];
    
    celda.textLabel.text = mejorTiempo.nombre;
    celda.detailTextLabel.text = detalle;
 */
    return celda;
}


#pragma mark - Navigation
- (IBAction)accionCerrarVentana:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:TRUE
                                                      completion:nil];
}


@end
