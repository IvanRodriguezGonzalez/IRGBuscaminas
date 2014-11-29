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



@implementation IRGMejoresTiemposViewController

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Delegado
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    return [[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *celda = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:@"UITableViewCell"];
    
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
    return celda;
}

#pragma mark - Navigation
- (IBAction)accionCerrarVentana:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:TRUE
                                                      completion:nil];
}


@end
