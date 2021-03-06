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
#import "IRGConfirmarBorradoViewController.h"

#define  celdaDatosJugador @"celdaDatosJugardor"
#define TAMAÑO_IMAGEN_DEL_JUGADOR 80


@interface IRGMejoresTiemposViewController()
@property (nonatomic) NSInteger nivel;
@property (nonatomic) IRGConfirmarBorradoViewController * confirmarBorradoDelHistorial;
@property (weak, nonatomic) IBOutlet UIButton *botonBorrarHistorial;
@property (weak, nonatomic) IBOutlet UITableView *vistaTablaMejoresTiempos;


@end

@implementation IRGMejoresTiemposViewController;

#pragma mark - Inicializadores

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                          nivel:(NSInteger)nivel
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _nivel = nivel;
    return self;
}

-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil nivel:0];
}

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle * bundle = [NSBundle mainBundle];
    [self.vistaTablaMejoresTiempos registerNib:[UINib nibWithNibName:@"IRGMejoresTiemposTableViewCell"
                                                              bundle:bundle]
                        forCellReuseIdentifier:@"IRGMejoresTiemposTableViewCell"];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos count]==0){
        self.botonBorrarHistorial.hidden = TRUE;
    }
    else {
        self.botonBorrarHistorial.hidden = FALSE;
    }
}

#pragma mark - Delegado
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    return [[[IRGMejoresTiempos sharedMejoresTiempos] mejoresTiempoDelNivel:self.nivel ] count];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TAMAÑO_IMAGEN_DEL_JUGADOR+30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    IRGMejoresTiemposTableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"IRGMejoresTiemposTableViewCell"];
    
    NSInteger filaDeLaTabla  = indexPath.row;
    IRGDatoDelMejorTiempo *mejorTiempo =[[IRGMejoresTiempos sharedMejoresTiempos] mejoresTiempoDelNivel:self.nivel][filaDeLaTabla];

    celda.nombreDelJugador.text = mejorTiempo.nombre;
    celda.tiempoDelJugador.text =[IRGMetodosComunes formatearTiempoDeJuegoEnSegundos:mejorTiempo.tiempo];
    UIImage *imagenDeDificultad;
    switch (mejorTiempo.dificultad) {
        case 1:
            celda.dificultadDeLaPartida.text = @"Fácil";;
            imagenDeDificultad = [UIImage imageNamed:@"dificultad_neutra.png"];
            break;
        case 2:
            celda.dificultadDeLaPartida.text = @"Media";
            imagenDeDificultad = [UIImage imageNamed:@"dificultad_neutra.png"];
            break;
        case 3:
            celda.dificultadDeLaPartida.text = @"Dificil";
            imagenDeDificultad = [UIImage imageNamed:@"dificultad_neutra.png"];
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
        celda.conAyuda.alpha = 0.00;
    }
  
    if (mejorTiempo.imagenDelJugador!=nil){
    celda.imagenDelJugador.image = mejorTiempo.imagenDelJugador;
    }
   
    return celda;
}


#pragma mark - Navigation
- (IBAction)accionCerrarVentana:(id)sender {
    [self cerrarVentana];
}

- (void) cerrarVentana{
    [self.presentingViewController dismissViewControllerAnimated:TRUE
                                                      completion:nil];

}

- (IBAction)accionBorrarHistorial:(id)sender {

    self.confirmarBorradoDelHistorial = [[IRGConfirmarBorradoViewController alloc] init];
    
    CGRect frameConfirmarBorrado = [[UIApplication sharedApplication] keyWindow].frame;
    self.confirmarBorradoDelHistorial.view.frame = frameConfirmarBorrado;
    
    self.confirmarBorradoDelHistorial.view.center = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2,[[UIApplication sharedApplication] keyWindow].frame.size.height/2);
    self.confirmarBorradoDelHistorial.sender = self;
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.confirmarBorradoDelHistorial.view];
    
}


@end
