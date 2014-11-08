//
//  IRGVentanaPrincipalViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#define NUMERO_DE_FILAS_POR_DEFECTO 10
#define NUMERO_DE_COLUMNAS_POR_DEFECTO 10

#import "IRGVentanaPrincipalViewController.h"
#import "IRGPincel.h"
#import "IRGLienzo.h"
#import "IRGCeldaViewController.h"
#import "IRGDatos.h"
#import "IRGCelda.h"


@interface IRGVentanaPrincipalViewController ()
@property (nonatomic)  NSInteger numeroDeFilas;
@property (nonatomic)  NSInteger numeroDeColumnas;
@property (nonatomic) BOOL mostrarMinas;
@property (nonatomic) BOOL juegoAcabado;

@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (weak, nonatomic) IBOutlet UITextField *totalMinas;
@property (weak, nonatomic) IBOutlet UIButton *botonPrincipal;
@property (weak, nonatomic) IBOutlet UIButton *BotonMostrarMinas;
@property (weak, nonatomic) IBOutlet UIProgressView *barraDeProgreso;

@end

@implementation IRGVentanaPrincipalViewController

#pragma mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation primer nivel

- (IBAction)accionJugar:(UIButton *)sender {
    [self.totalMinas resignFirstResponder];
    [self iniciarJuego];
}


- (IBAction)accionMostrarMinas:(UIButton *)sender {
   
    if (!self.mostrarMinas){
        [self mostrarTodasLasMinas];
    }
    else {
        [self ocultarTodasLasMinas];
    }
    self.mostrarMinas = !self.mostrarMinas;
}

# pragma mark Navigation segundo nivel

-(void) mostrarTodasLasMinas{
    
    for (IRGCeldaViewController * celdaViewController in [[IRGDatos sharedDatos] todasLasCeldas]){
        [celdaViewController mostrarMina];
    }
}

-(void) ocultarTodasLasMinas{
    
    for (IRGCeldaViewController * celdaViewController in [[IRGDatos sharedDatos] todasLasCeldas]){
        [celdaViewController ocultarMina];
    }
}

#pragma mark - Delegado primer nivel

- (void) celdaPulsada:(IRGCeldaViewController *)celdaPulsada{
    if ((!self.juegoAcabado) & (celdaPulsada.estado == libre)){
        if ((celdaPulsada.tieneMina) ){
            [self acabarJuegoConError];
        }
        else {
            [self propagaTouch:celdaPulsada];
            [self actualizarBotonYBarraDeProgreso];
        }
    }
}

# pragma mark Delegado segundo nivel

-(void) propagaTouch:(IRGCeldaViewController *)celdaViewController{
    if (!celdaViewController.estado == procesado){
        
        celdaViewController.estado = procesado;
        [celdaViewController dibujarComoCeldaVacia];
        
        if ([[IRGDatos sharedDatos] tieneMinasAlrededor:celdaViewController]){
            NSArray * celdasSinMinasAlrededorAPropagar= [[NSMutableArray alloc]init];
            celdasSinMinasAlrededorAPropagar =[[IRGDatos sharedDatos] celdasSinMinasAlrededorDe:celdaViewController incluyendoEsquinas:true];
            for (IRGCeldaViewController * celdeViewControllerTmp in celdasSinMinasAlrededorAPropagar ){
                [self propagaTouch:celdeViewControllerTmp];
            }
        }
        else {
            [celdaViewController mostrarNumeroDeMinas];
        }
    }
}

-(void) actualizaMinasPendientes{
    int banderasPuestas=0;
    for (IRGCeldaViewController *celdaViewController in [IRGDatos sharedDatos].todasLasCeldas){
        if (celdaViewController.estado == conBandera){
            banderasPuestas++;
        }
    }
    int banderasPendientes = [IRGDatos sharedDatos].numeroDeMinas;
    banderasPendientes = banderasPendientes-banderasPuestas;
    self.totalMinas.text = [NSString stringWithFormat:@"%d",banderasPendientes];
}
#pragma mark - Auxiliares primer nivel


- (void) iniciarJuego{
    if (!self.juegoAcabado){
        [self restablecerNumeroDeMinasPendietes];
    }
    self.juegoAcabado = false;
    [[IRGDatos sharedDatos] borrarJuego];
    [self borrarCanvas];
    [self generarCanvas];
    [self actualizarNumeroDeMinas];
    [self generarMinas];
    [self restablecerNumeroDeMinasPendietes];
    [self actualizarBotonYBarraDeProgreso];
    [self activarMostrarMinas];
    [self desactivarNumeroDeMinas];
    [self iniciarBarraDeProgreso];
    [self establecerFondoNeutro];
}

-(void) acabarJuegoConError{
    [self mostrarTodasLasMinas];
    self.juegoAcabado = true;
    [self establecerImagenDelBotonPrincipal:@"error"];
    [self desactivarMostrarMinas];
    [self activarNumeroDeMinas];
    [self establecerFondoDeError];
    [self restablecerNumeroDeMinasPendietes];

}

- (void) acabarJuegoSinError{
    self.juegoAcabado = true;
    [self activarNumeroDeMinas];
    [self establecerFondoDeVictoria];
    [self restablecerNumeroDeMinasPendietes];

}

# pragma mark - Auxiliares segundo nivel

- (void) generarCanvas{
    for (NSInteger fila = 0;fila < [IRGLienzo sharedLienzo].filasDelLienzo;fila++){
        for (NSInteger columna = 0; columna< [IRGLienzo sharedLienzo].columnasDelLienzo;columna++){
            
            IRGCeldaViewController *celdaViewController;
            celdaViewController= [self crearCeldaViewControllerConFila:fila
                                                            conColumna:columna];
            [self anadirAlCanvasElCeldaViewController:celdaViewController];
            [[IRGDatos sharedDatos] anadirCeldaViewController:celdaViewController];
        }
    }
}

- (void) borrarCanvas{
    for (UIView * vistaDelCanvas in self.canvas.subviews){
        if (vistaDelCanvas.class == [IRGCelda class]){
            [vistaDelCanvas removeFromSuperview];
        }
    }
}
-(void) establecerFondoNeutro{
    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaNormal;
}

- (void) establecerFondoDeError{

    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaDeError;
}

- (void) establecerFondoDeVictoria {
    self.canvas.backgroundColor = [IRGPincel sharedPincel].colorDeRellenoDePantallaDeVictoria;
}

-(void) actualizarNumeroDeMinas{
    [IRGDatos sharedDatos].numeroDeMinas = [self.totalMinas.text intValue];
}

- (void) generarMinas{
    for (int numeroDeMinas = 0;numeroDeMinas < [IRGDatos sharedDatos].numeroDeMinas;numeroDeMinas++){
        NSInteger celdaConMina = [self generarNumeroAleatorioEntre:0
                                                                 Y:[IRGLienzo sharedLienzo].filasDelLienzo*[IRGLienzo sharedLienzo].columnasDelLienzo];
        
        IRGCeldaViewController * celdaViewController = [IRGDatos sharedDatos].todasLasCeldas[celdaConMina];
        
        if (!celdaViewController.tieneMina){
            celdaViewController.tieneMina = true;
        }
        else {
            numeroDeMinas --;
        }
    }
    self.mostrarMinas = false;
}

- (void) restablecerNumeroDeMinasPendietes{
    self.totalMinas.text = [NSString stringWithFormat:@"%d",[[IRGDatos sharedDatos] numeroDeMinas]];
}

-(void) actualizarBotonYBarraDeProgreso{
    NSArray *todasLasCeldas = [IRGDatos sharedDatos].todasLasCeldas;
    Float32 totalCeldas = [todasLasCeldas count];
    totalCeldas = totalCeldas - [IRGDatos sharedDatos].numeroDeMinas;
    
    Float32 totalCeldasProcesadas = 0;
    for (IRGCeldaViewController * celdaViewController in todasLasCeldas){
        if (celdaViewController.estado == procesado){
            totalCeldasProcesadas++;
        }
    }
    Float32 porcentajeDeAvance = (totalCeldasProcesadas/totalCeldas);
    [self actualizarBotonConProgreso:porcentajeDeAvance];
    [self actualizarBarraDeProgresoConProgreso:porcentajeDeAvance];
}

- (void) activarMostrarMinas{
    self.BotonMostrarMinas.enabled = TRUE;
}

- (void) desactivarMostrarMinas{
    self.BotonMostrarMinas.enabled = false;
}

- (void) activarNumeroDeMinas{
    self.totalMinas.enabled = true;
    self.totalMinas.textColor = [UIColor blueColor];
    self.totalMinas.text = [NSString stringWithFormat:@"%d",[IRGDatos sharedDatos].numeroDeMinas];
}

- (void) desactivarNumeroDeMinas{
    self.totalMinas.enabled = false;
    self.totalMinas.textColor = [UIColor lightGrayColor];
}

-(void) iniciarBarraDeProgreso{
    [self.barraDeProgreso setProgress:0 animated:true];
}



# pragma mark - Auxiliares tercer nivel

-(void) actualizarBotonConProgreso:(float)porcentajeDeAvance{
    if (porcentajeDeAvance == 1) {
        [self establecerImagenDelBotonPrincipal:@"igualA100"];
        [self acabarJuegoSinError];
    }
    if (porcentajeDeAvance < 1) {
        [self establecerImagenDelBotonPrincipal:@"menorDe100"];
    }
    if (porcentajeDeAvance < .8) {
        [self establecerImagenDelBotonPrincipal:@"menorDe80"];
    }
    if (porcentajeDeAvance < .60) {
        [self establecerImagenDelBotonPrincipal:@"menorDe60"];
    }
    if (porcentajeDeAvance < .40) {
        [self establecerImagenDelBotonPrincipal:@"menorDe40"];
    }
    
    if (porcentajeDeAvance < .20) {
        [self establecerImagenDelBotonPrincipal:@"menorDe20"];
    }

    
}

- (void) actualizarBarraDeProgresoConProgreso:(float)porcentajeDeAvance{
    [self.barraDeProgreso setProgress:porcentajeDeAvance animated:true];
}


- (void) establecerImagenDelBotonPrincipal:(NSString *)imagenNueva{
    [self.botonPrincipal setImage:[UIImage imageNamed:imagenNueva] forState:(normal) ];
}

- (IRGCeldaViewController *) crearCeldaViewControllerConFila:(NSInteger)fila
                                                  conColumna:(NSInteger)columna{
    IRGCeldaViewController *celdaViewController = [[IRGCeldaViewController alloc]initConNumeroDeFila:fila numeroDeColumna:columna conDelegado:self];
    return celdaViewController;
}

- (void) anadirAlCanvasElCeldaViewController:(IRGCeldaViewController *)celdaViewController{
    [self.canvas addSubview:celdaViewController.view];
}


- (NSInteger) generarNumeroAleatorioEntre:(NSInteger)numeroInferior
                                        Y:(NSInteger) numeroSuperior{
    NSInteger numeroAleatorio =numeroInferior+random()%numeroSuperior;
    return numeroAleatorio;
}

-(NSInteger) altoDelCanvas{
    return self.canvas.frame.size.height;
}



@end
