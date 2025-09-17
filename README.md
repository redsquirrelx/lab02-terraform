# Hola

Mi grupo es:
- Aguilar Chavez Fabricio (fabrilar1)
- Melendez Quezada Fabricio (FabricioMQ-sys)
- Muga Ponce Franco (redsquirrelx)
- Quispe Cesias Andro (AndroJQC)
- Rodriguez Acevedo Emerson (ron4ldo.Xrdz)


Tenemos el siguiente diagrama: 
![Diagrama de Infraestructura](./docs/image-3.png)



Para aplicar el entorno ejecutar los sig. comandos en el directorio base del repositorio:
```
cd iac
sudo terraform init
sudo terraform workspace new dev
sudo terraform workspace select dev
sudo terraform apply
```

Luego, aplicar la configuración
```
cd ../config
sudo ansible-playbook -i inventory.ini playbook.yaml
```