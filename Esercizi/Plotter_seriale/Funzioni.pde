
// DisegnaGrafico() si occupa di disegnare gli assi, le tacche, le frecce e i valori per ogni tacca
void DisegnaGrafico(){
  
	strokeWeight(SpessoreAssi); //Imposta lo spessore degli assi
	
//Pulisci la parte prima dellasse Y
	stroke (Colore_Sfo); //Imposta colore bordo
	fill   (Colore_Sfo); //Imposta colore riempimento
	
	quad(0,0,0,height,Dis_Y_SupX,height,Dis_Y_SupX,0); //Disegna un rettangolo che copre eventuali linee
	
	
	//-------------------ASSE Y-------------------
	stroke (Colore_Y); //Imposta colore bordo
	fill   (Colore_Y); //Imposta colore riempimento
	
	//Diegna linea Asse Y
	line (Dis_Y_SupX, Dis_Y_SupY, Dis_Y_InfX, Dis_Y_InfY);
	
	//Triangolo Asse Y
	triangle(Dis_Y_SupX-(Lato_Trig/2), Dis_Y_SupY, Dis_Y_SupX+(Lato_Trig/2), Dis_Y_SupY, Dis_Y_SupX, Dis_Y_SupY-Lato_Trig);
	
	//Disegna tacche Asse Y
	textSize  (Dim_Text_Y   ); //Imposta dimensione testo
	textAlign (RIGHT, CENTER); //Imposta riferimento 0 testo 
	
	//Disegna tacche Asse Y positivo
	for (int i = 1; i <=((Dis_X_SinY-Dis_Y_SupY)/Dis_Tacca_Y) ;i++) {
		
		//Disegna tacchetta
		line (Dis_Y_SupX-Dim_Tacca,Zero_Y-Dis_Tacca_Y*i,Dis_Y_SupX,Zero_Y-Dis_Tacca_Y*i); //Disegna Tacche per asse positivo X
		//Scrivi testo
		text(i*ValoreTaccaY, Dis_Y_SupX-Dim_Tacca, Zero_Y-Dis_Tacca_Y*i);
	}
	
	//Disegna tacche Asse Y negativo
	for (int i = 1; i <=((height-Dis_X_SinY-Dis_Y_SupY)/Dis_Tacca_Y) ;i++){
		//Disegna tacchetta
		line (Dis_Y_SupX-Dim_Tacca,Zero_Y+Dis_Tacca_Y*i,Dis_Y_SupX,Zero_Y+Dis_Tacca_Y*i); //Disegna Tacche per asse negativo X
		//Scrivi testo
		text(-1*i*ValoreTaccaY, Dis_Y_SupX-Dim_Tacca, Zero_Y+Dis_Tacca_Y*i);
	}
	
	//-------------------ASSE X-------------------
	stroke (Colore_X); //Imposta colore bordo
	fill   (Colore_X); //Imposta colore riempimento
	
	//Diesgna Asse X
	line (Dis_X_SinX, Dis_X_SinY, Dis_X_DesX, Dis_X_DesY);
	
	//Triangolo asse X
	triangle(Dis_X_SinX, Dis_X_SinY-(Lato_Trig/2), Dis_X_SinX, Dis_X_SinY+(Lato_Trig/2), Dis_X_SinX-Lato_Trig, Dis_X_SinY);
	
	//Disegna tacche Asse X
	textSize  (Dim_Text_X ); //Imposta dimensione testo
	textAlign (CENTER, TOP); //Imposta riferimento 0 testo 
	
	for (int i =((Dis_X_DesX-Zero_X)/Dis_Tacca_X); i >0 ;i--) {
		
		//Scrivi testo e disegna tacca alternando sopra sotto
		if(boolean(i%2)) {
			//Scrivi testo sopra
			text( i * ValoreTaccaX, Dis_X_DesX - Dis_Tacca_X * i, Zero_Y + Dim_Tacca       );
			//Disegna tacche corta asse X
			line (Dis_X_DesX-Dis_Tacca_X*i,Zero_Y,Dis_X_DesX-Dis_Tacca_X*i,Zero_Y+Dim_Tacca);
		}
		else {
			//Scrivi testo sotto
			text( i * ValoreTaccaX, Dis_X_DesX- Dis_Tacca_X * i, Zero_Y + Dim_Tacca + Dim_Text_X);
			//Disegna tacche lunga asse X
		line (Dis_X_DesX-Dis_Tacca_X*i,Zero_Y,Dis_X_DesX-Dis_Tacca_X*i,Zero_Y+Dim_Tacca+Dim_Text_X);}
	}
}

int Cont;
int Oldmillis;

//CompilaGrafico(float i) si occupa di tracciare la linea con i valori
void CompilaGrafico(float i) {
  
	//Aggiorna i valore massimo e minimo trovato e di conseguenza i settaggi del grafico
//	if(i>MAXVal){MAXVal=i;AggiornaSettaggi();}
//	if(i<MINVal){MINVal=i;AggiornaSettaggi();}
	
	background(Colore_Sfo); //Ripulisci schermata

	image(Logo, Dis_Y_SupX, 0); //Stampa immagine

	stroke (0,0,0); //Imposta colore bordo
	fill   (0,0,0); //Imposta colore riempimento
	
	//Scrivi il valore appena ricevuto
	textAlign(RIGHT, TOP); //Imposta riferimento 0 testo 
	text(i, width-10,10);  //Scrivi il testo
	
	//Salva il valore corrente nel vettore
	OldVal [Cont] = i;
	
	//Salva la differenza di tempo in secondi nel vettore
	OldTemp[Cont]= (float(millis()-Oldmillis))/1000;
	
	//Scrivi la differenza di tempo
	text(OldTemp[Cont], width-10,30);
	
	//Aggiorna la variabile per la futura sottrazione
	Oldmillis = millis();
	
	//Traccia la linea
	float totTemp =0; //Creare una variabile che contine il tempo totale per il disegno

	strokeWeight(Spessore); //Imposta lo spessore delal linea
MAXVal=1;
MINVal =-1;
	for(int f =Cont; f>1; f--) {
		//Disegno linea
		line( Dis_X_DesX - ((( OldTemp[f  ]                + totTemp) - OldTemp[Cont]) / ValoreTaccaX) * Dis_Tacca_X , //X2
		Zero_Y     - (   OldVal [f  ]                                            / ValoreTaccaY) * Dis_Tacca_Y , //Y2 
		Dis_X_DesX - ((( OldTemp[f-1] + OldTemp[f]   + totTemp) - OldTemp[Cont]) / ValoreTaccaX) * Dis_Tacca_X , //X1
		Zero_Y     - (   OldVal [f-1]                                            / ValoreTaccaY) * Dis_Tacca_Y); //Y1
		
		//Aggiorna tempo totale
		totTemp+= OldTemp[f];
//Aggiorna i valore massimo e minimo trovato e di conseguenza i settaggi del grafico
  if(OldVal [f  ]>MAXVal){MAXVal=OldVal [f  ];}
  if(OldVal [f  ]<MINVal){MAXVal=OldVal [f  ];}
	}
	
	if (((totTemp/ValoreTaccaX) * Dis_Tacca_X)< width) {AllargaVettori(); Cont++;}
	else {ScalaVal();}
	
	//Ridisegna il grafico
	DisegnaGrafico();
  AggiornaSettaggi();
}

void AggiornaSettaggi(){
	
	//Aggiorna asse X
	Dis_Y_InfY = height - Dis_Y_SupY;
	
	//Aggiorna asse Y
	//map ( Valore assoluto di MINVal, Zero, Totale valore Asse Y positivo piu negativo, Punto superiore Asse Y, Punto inferiore Asse Y)
	Dis_X_SinY = height - 30 - int(map ( abs(MINVal)              , 0   , MAXVal+abs(MINVal)                        , Dis_Y_SupY            , Dis_Y_InfY            ));
	Dis_X_DesX = width  - Dis_X_SinX;
	Dis_X_DesY = Dis_X_SinY;
	
	//Aggiorna posizione 0
	Zero_X = Dis_Y_SupX;
	Zero_Y = Dis_X_SinY;
	
	for (ValoreTaccaY = 0; (ValoreTaccaY*((Zero_Y-Dis_Y_SupY)/Dis_Tacca_Y))<MAXVal;ValoreTaccaY+=0.01){} //Calcola valore di una tacca
}

void ScalaVal(){
	for(int i =1;i<=Cont;i++){
		OldVal [i-1] = OldVal [i];
		OldTemp[i-1] = OldTemp[i];
	}
}

//AllargaVettori() inserisce un unita nel vettore
void AllargaVettori(){
	//Creiamo due vettori temporanei piu grossi
	float [] Temp  = new float [Cont+2];
	float [] Temp1 = new float [Cont+2];
	
	//Trasferiamo i vecchi dati nei nuovi vettori
	for(int i = 0;i<=Cont;i++){
		Temp [i] = OldVal [i];
		Temp1[i] = OldTemp[i];
	}
	
	//Bisognerebbe eliminare i vecchi vettori = > ??
	
	//Aggiorniamo il puntatore
	OldVal  = Temp;
	OldTemp = Temp1;
}

void Arduino(){

}