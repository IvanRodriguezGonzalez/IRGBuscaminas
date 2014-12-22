//
//  IRGPreguntarNombreViewController.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 9/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGPreguntarNombreViewController.h"
#import "IRGMejoresTiempos.h"
#import "IRGDatoDelMejorTiempo.h"
#import "IRGMetodosComunes.h"
#import "IRGSettings.h"
#import "IRGMejoresTiemposTableViewCell.h"

#define FILAS_DE_MEJORES_TIEMPOS_MOSTRADAS 3

@interface IRGPreguntarNombreViewController ()
#pragma mark - Propiedades privadas
@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;
@property (weak, nonatomic) IBOutlet UITextField *tiempoTextField;
@property (weak, nonatomic) IBOutlet UITextField *numeroDeCeldasTextField;
@property (weak, nonatomic) IBOutlet UITextField *numeroDeMinasTextField;
@property (weak, nonatomic) IBOutlet UITextField *conAyudaTextField;
@property (weak, nonatomic) IBOutlet UITableView *tablaVistaMejoresTiempos;


@end

#pragma mark -
@implementation IRGPreguntarNombreViewController


# pragma mark - Navigation
- (IBAction)accionGrabar:(UIButton *)sender {
    [self registrarMejorTiempo:self.datoDelMejorTiempo.tiempo
                        Nombre:self.nombreTextField.text
                numeroDeCeldas:self.datoDelMejorTiempo.numeroDeCeldas
                 numeroDeMinas:self.datoDelMejorTiempo.numeroDeMinas
                    conAyuda:self.datoDelMejorTiempo.conAyuda
     dificultad:[IRGSettings sharedSettings].dificultad];
    [self.presentingViewController dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)accionCerrarVentana:(UIButton *)sender {
    [self.presentingViewController dismissViewControllerAnimated:TRUE completion:nil];
}

#  pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nombreTextField.text = self.datoDelMejorTiempo.nombre;
    self.numeroDeCeldasTextField.text = [NSString stringWithFormat:@"%ld",(long)self.datoDelMejorTiempo.numeroDeCeldas];
    self.numeroDeMinasTextField.text = [NSString stringWithFormat:@"%ld",(long)self.datoDelMejorTiempo.numeroDeMinas];
    if (self.datoDelMejorTiempo.conAyuda){
        self.conAyudaTextField.text = @"Si";
    }
    else{
        self.conAyudaTextField.text = @"No";
    }
    self.tiempoTextField.text = [IRGMetodosComunes formatearTiempoDeJuegoEnSegundos:self.datoDelMejorTiempo.tiempo]
    ;    

    
    NSBundle * bundle = [NSBundle mainBundle];
    [self.tablaVistaMejoresTiempos registerNib:[UINib nibWithNibName:@"IRGMejoresTiemposTableViewCell"
                                                              bundle:bundle]
                        forCellReuseIdentifier:@"IRGMejoresTiemposTableViewCell"];

    
}


#pragma mark - Delegado Primer Nivel

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Facil";
            break;
        case 1:
            return @"Medio";
            break;
        case 2:
            return @"Dificil";
            break;
        default:
            return @"";
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    NSInteger mejoresTiemposDisponibles = [[[IRGMejoresTiempos sharedMejoresTiempos] mejoresTiempoDelNivel:section+1] count];
    if (mejoresTiemposDisponibles > FILAS_DE_MEJORES_TIEMPOS_MOSTRADAS){
        return FILAS_DE_MEJORES_TIEMPOS_MOSTRADAS+1;
    }
    else {
        return mejoresTiemposDisponibles;
    }
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IRGMejoresTiemposTableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"IRGMejoresTiemposTableViewCell"];
    NSInteger filaDeLaTabla  = indexPath.row;
    
    if (filaDeLaTabla > FILAS_DE_MEJORES_TIEMPOS_MOSTRADAS-1)
    {

        celda.nombreDelJugador.text = @"...";
        celda.tiempoDelJugador.text =Nil;
        celda.dificultadDeLaPartida.text = @"";
        celda.graficoDeDificultad.hidden = YES;
        celda.numeroDeMinas.text = @"";
        celda.conAyuda.hidden = YES;
        celda.reloj.hidden = YES;
        celda.mina.hidden = YES;
    }
    else
    {
        IRGDatoDelMejorTiempo *mejorTiempo =[[IRGMejoresTiempos sharedMejoresTiempos] mejoresTiempoDelNivel:indexPath.section+1][filaDeLaTabla];
        
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
            celda.conAyuda.alpha= 1;
        }
        else{
            celda.conAyuda.alpha = .05;
        }
    }
    return celda;
}

# pragma mark - Auxiliares primer nivel
- (void) registrarMejorTiempo: (NSInteger)mejorTiempo
                       Nombre:(NSString *)nombre
               numeroDeCeldas:(NSInteger)numeroDeCeldas
                numeroDeMinas:(NSInteger)numeroDeMinas
                     conAyuda:(bool)conAyuda
                   dificultad:(NSInteger) dificultad{
    
    [[IRGMejoresTiempos sharedMejoresTiempos] anadirTiempo:mejorTiempo
                                                    Nombre:nombre
                                            numeroDeCeldas:numeroDeCeldas
                                             numeroDeMinas:numeroDeMinas
                                                  conAyuda:conAyuda
                                                dificultad:dificultad];
}

@end
