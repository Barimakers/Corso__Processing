//----------------------------------------------------------------------
//Dati
float MAXVal = 1;
float MINVal = 1;

float [] OldVal  = new float [1];
float [] OldTemp = new float [1];

int Spessore = 5;
//----------------------------------------------------------------------


//----------------------------------------------------------------------
//Asse Y (Valore)
int Dis_Y_SupX = 100;
int Dis_Y_SupY = 20;
int Dis_Y_InfX = Dis_Y_SupX;
int Dis_Y_InfY = height - Dis_Y_SupY;

int Dis_Tacca_Y = 50;

float ValoreTaccaY;

int Dim_Text_Y =15;

color Colore_Y = color(0,0,255);
//----------------------------------------------------------------------


//----------------------------------------------------------------------
//Asse X (Tempo)
int Dis_X_SinX = 20;
int Dis_X_SinY = height - 30;
int Dis_X_DesX = width - Dis_X_SinX;
int Dis_X_DesY = Dis_X_SinY;

int Dis_Tacca_X = 50;

float ValoreTaccaX = 2; //in secondi

int Dim_Text_X =15;

color Colore_X = color(255,0,0);
//----------------------------------------------------------------------


//----------------------------------------------------------------------
//Posizione 0
int Zero_X = Dis_Y_SupX;
int Zero_Y = Dis_X_SinY;
//----------------------------------------------------------------------


//----------------------------------------------------------------------
//Altro
int Dim_Tacca = 3;
int Lato_Trig = 15;
color Colore_Sfo = color(255,255,255);
int SpessoreAssi = 2;
PImage Logo;
//----------------------------------------------------------------------