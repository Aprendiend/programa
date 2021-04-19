numero=int(input("Ingrese un número entero: "))
primo=True
for i in range(2,numero):
    if numero%i==0:
        primo=False
if primo:
    print("El número", numero, "es primo")
else:
    print("El número", numero, "NO es primo")
    
