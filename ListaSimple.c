#include <stdio.h>

struct nodo{
	int dato;
	struct Nodo* sig;	
}a;

typedef struct nodo Nodo;
typedef Nodo* Lista;

int n , op;

int main(){
	Lista L =  NULL;
	
	/* MENU */
	do{
		printf("\n **MENU DE LISTA SIMPLE**\n");
		printf("\n 1) Mostrar Lista");
		printf("\n 2) Agregar Nodo (Principio)");
		printf("\n 3) Agregar Nodo (Final)");
		printf("\n 4) Agregar entre dos Nodos");
		printf(" \n\n  > ");
		
		scanf("%d", & n);
		
		switch(n){
			
			case 1 : mostrarLista(L);
				break;
				
			case 2 :
				fflush( stdin );
				printf("\n AGREGAR PRINCIPIO\n\n Ingresa el dato : ");
				scanf("%d", & a.dato); fflush( stdin );
				
				agregarP(&L , a.dato);
				
				break;
			
			case 3 :
				fflush( stdin );
				printf("\n AGREGAR FINAL\n\n Ingrese un dato : ");
				scanf("%d", & a.dato); fflush( stdin );
				
				agregarF(&L , a.dato);
				
				break;
				
			case 4 :
				fflush( stdin );
				printf("\n AGREGAR ENTRE DOS\n\n Ingrese un dato : ");
				scanf("%d", & a.dato); fflush( stdin );
				
				agregarE(&L , a.dato);
				
				break;
			
			default : printf("\n\nERROR OPCION NO CORRECTA");
						return 0;
				
				
		}
		
		printf("\nIngresa << 1 >> regresar al menu : ");
		scanf("%d", & op);
		
	} while( op == 1 ) ;
	
	return 0;
}

void mostrarLista(Lista L){
	
	printf("\n ELEMENTOS : \n");
	
	while(L != NULL){
		
		printf("\n %d", L->dato);
		L = L->sig;
		
	}
}

void agregarP(Lista* L , int dato){
	
	
	Nodo* nuevo = (Nodo*) malloc (sizeof(Nodo));
	
	(*nuevo).dato = dato;
	
	nuevo->sig = NULL;
	
	if(*L == NULL){
		
		*L = nuevo;
	} else {
		
		nuevo->sig = *L;
		*L = nuevo;
	}
}

void agregarF(Lista* L, int dato){
	
	Nodo* nuevo = (Nodo*) malloc (sizeof(Nodo));
	
	nuevo->dato = dato;
	
	(*nuevo).sig = NULL;
	
	if(*L == NULL){
	 	
	 	*L = nuevo;
	 	
	} else {
	 	
	 	Lista aux = *L;
	 	
	 	while(aux->sig != NULL){
	 		
	 		aux = aux->sig;
	 		
		 }
		 
		 aux->sig = nuevo;
	 	
	}
}

void agregarE(Lista *L, int dato){
	
	Nodo* nuevo = (Nodo*) malloc(sizeof(Nodo));
	
	nuevo->sig = NULL;
	nuevo->dato = dato;
	
	if(*L == NULL){
		
		*L = nuevo;
	} else{
		
		Lista aux = *L;
	 	Lista prev = aux;
	 	
	 	while(aux->sig != NULL){
	 		
	 		prev  =aux;
	 		aux = aux->sig;
			
			 
		}
	 	
	 	prev->sig = nuevo;
	 	nuevo->sig = aux;
		
	}
}
