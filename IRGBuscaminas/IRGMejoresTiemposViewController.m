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

@interface IRGMejoresTiemposViewController ()

@end

@implementation IRGMejoresTiemposViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    CGRect frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60);
    UITableView *tablaDeMejoresTiempos = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    tablaDeMejoresTiempos.dataSource = self;
    [self.view addSubview:tablaDeMejoresTiempos];
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

@end
