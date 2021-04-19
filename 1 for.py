numero=int(input("Ingrese el número entero: "))
primo=1
for i in range(2,numero):
    if numero%i==0:
        primo=0
if primo==1:
    print("El número", numero, "es primo")
else:
    print("El número", numero, "NO es primo")
