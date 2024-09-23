# VM_with_TF

En este laboratorio utilizamos Terraform para montar una maquina virtual en AZURE

Para esta practica usamos la funcionalidad de codespaces.

Lo primero que hicimos fue instalar las herramientas necesarias

* [Azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Primero nos autenticamos usando las credenciales de AZURE

---
Luego usamos el comando **terraform validate** para comprobar que los archivos de configuración de Terraform están bien formados y no contienen errores de sintaxis o lógica.
```
terraform validate
```
---
Para organizar  y formatear archivos de Terraform
```
terraform fmt
```

Este comando automáticamente ajusta el formato del código en los archivos .tf siguiendo las convenciones y estilos recomendados por Terraform, como la alineación de valores y la eliminación de espacios innecesarios.

---

Luego usamos **terraform plan** que genera un plan de ejecución que describe los cambios que Terraform realizará en la infraestructura. Es un paso de previsualización que no realiza cambios, pero muestra qué recursos se crearán, modificarán o destruirán.
```
terraform plan
```
---
Luego, **terraform apply** que aplica el plan de ejecución a la infraestructura real. Este es el paso donde los cambios se implementan, creando, modificando o destruyendo recursos según lo indicado por los archivos de configuración.

```
terraform aplly
```
---
Evidencias

![](/imgs/WhatsApp%20Image%202024-09-18%20at%209.08.21%20PM.jpeg)
![](/imgs/WhatsApp%20Image%202024-09-18%20at%209.08.00%20PM.jpeg)

Luego nos conectamos a la VM usando SSH

![](/imgs/WhatsApp%20Image%202024-09-18%20at%209.11.26%20PM.jpeg)
Para eliminar la infraestructura creada, se puede utilizar:

```bash
terraform destroy
```