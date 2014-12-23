//
//  IRGMejoresTiemposTableViewCell.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 15/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRGMejoresTiemposTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombreDelJugador;

@property (weak, nonatomic) IBOutlet UILabel *tiempoDelJugador;

@property (weak, nonatomic) IBOutlet UIImageView *graficoDeDificultad;

@property (weak, nonatomic) IBOutlet UILabel *dificultadDeLaPartida;
@property (weak, nonatomic) IBOutlet UILabel *numeroDeMinas;
@property (weak, nonatomic) IBOutlet UIImageView *conAyuda;
@property (weak, nonatomic) IBOutlet UIImageView *reloj;
@property (weak, nonatomic) IBOutlet UIImageView *mina;
@property (weak, nonatomic) IBOutlet UIImageView *imagenDelJugador;



@property (weak, nonatomic) IBOutlet UIView *vistaGeneralDeLaCelda;

@property (weak, nonatomic) IBOutlet UIView *vistaInteriorPrincipal;

@property (weak, nonatomic) IBOutlet UIView *vistaDeLosDatos;
@end
