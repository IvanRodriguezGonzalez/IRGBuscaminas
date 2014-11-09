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

@interface IRGPreguntarNombreViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;
@property (weak, nonatomic) IBOutlet UITextField *tiempoTextField;
@property (weak, nonatomic) IBOutlet UITextField *numeroDeCeldasTextField;
@property (weak, nonatomic) IBOutlet UITextField *numeroDeMinasTextField;
@property (weak, nonatomic) IBOutlet UITextField *conAyudaTextField;

@end

@implementation IRGPreguntarNombreViewController


# pragma mark Navigation
- (IBAction)accionGrabar:(UIButton *)sender {
    [self registrarMejorTiempo:self.datoDelMejorTiempo.tiempo
                        Nombre:self.nombreTextField.text
                numeroDeCeldas:self.datoDelMejorTiempo.numeroDeCeldas
                 numeroDeMinas:self.datoDelMejorTiempo.numeroDeMinas
                                conAyuda:self.datoDelMejorTiempo.conAyuda];
    [self.presentingViewController dismissViewControllerAnimated:TRUE completion:nil];
}

#  pragma mark Overrides

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


#pragma mark Delegado Primer Nivel
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
    
    
    NSString * detalle = [NSString stringWithFormat:@"Tiempo:%@ Celdas:%ld Minas:%ld Con ayuda:%@",timepoDeJuegoFormateado,(long)mejorTiempo.numeroDeCeldas,(long)mejorTiempo.numeroDeMinas,conAyuda];
    
    celda.textLabel.text = mejorTiempo.nombre;
    celda.detailTextLabel.text = detalle;
    
    return celda;
}

# pragma mark Auxiliares primer nivel
- (void) registrarMejorTiempo: (NSInteger)mejorTiempo
                       Nombre:(NSString *)nombre
               numeroDeCeldas:(NSInteger)numeroDeCeldas
                numeroDeMinas:(NSInteger)numeroDeMinas
                     conAyuda:(bool)conAyuda{
    
    [[IRGMejoresTiempos sharedMejoresTiempos] anadirTiempo:mejorTiempo
                                                    Nombre:nombre
                                            numeroDeCeldas:numeroDeCeldas
                                             numeroDeMinas:numeroDeMinas
                                                  conAyuda:conAyuda];
}

@end
