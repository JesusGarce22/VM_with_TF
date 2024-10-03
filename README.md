# Despliegue de VM en Azure utilizando Terraform

Este proyecto implementa el despliegue de una máquina virtual en Azure utilizando Terraform, con la separación de la parte de networking mediante un módulo independiente.

Para esta practica usamos la funcionalidad de codespaces.

Lo primero que hicimos fue instalar las herramientas necesarias

* [Azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Primero nos autenticamos usando las credenciales de AZURE

### Archivos principales

- `main.tf`: Define la creación del grupo de recursos, máquina virtual y la integración con el módulo de networking.
- `variables.tf`: Contiene las variables reutilizables del proyecto.
- `modules/networking/main.tf`: Define los recursos de networking, como redes virtuales, subnets y la interfaz de red.
- `modules/networking/outputs.tf`: Exporta los IDs de los recursos de networking para que puedan ser usados en otros módulos.
- `modules/networking/variables.tf`: Variables utilizadas dentro del módulo de networking.

## Proceso de despliegue

1. **Grupo de Recursos**: Se crea un grupo de recursos donde se alojarán todos los recursos asociados a la VM y la red.
   
2. **Networking con Módulos**: 
   - La parte de networking está separada en un módulo dentro de `modules/networking/`.
   - Este módulo se encarga de crear:
     - Red virtual (`azurerm_virtual_network`)
     - Subnets (`azurerm_subnet`)
     - Interfaz de red (`azurerm_network_interface`)
     - IP pública (`azurerm_public_ip`)
   - Los IDs de estos recursos son exportados a través de `outputs.tf` para ser usados en la configuración principal del proyecto.

3. **Máquina Virtual**: 
   - Se crea una máquina virtual con sistema operativo Ubuntu 22.04 LTS, usando la imagen de Canonical.
   - La VM utiliza una interfaz de red creada a través del módulo de networking.
   - Se configura acceso SSH a la VM usando la interfaz de red asociada.

4. **Seguridad**:
   - Se crea un grupo de seguridad de red (`NSG`) que permite acceso SSH (puerto 22) desde cualquier dirección IP.

## Variables

- `name_vm`: Nombre de la máquina virtual.
- `location`: Ubicación (región) donde se desplegarán los recursos.
- `azure-id`: ID de la suscripción de Azure que se está utilizando para el despliegue.

Ejemplo del archivo `variables.tf`:

```hcl
variable "name_vm" {
  type        = string
  default     = "jesusfirstvm"
  description = "Nombre de la primera VM"
}

variable "location" {
  type        = string
  default     = "westus"
  description = "Ubicación"
}

variable "azure-id" {
  default = "*******************"
}

```

Primero usamos `terraform init` para inicializar el proyecto de Terraform

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
![](/imgs/APPLY.PNG)
---
Evidencias

![](/imgs/AZUREVM.PNG)
Para eliminar la infraestructura creada, se puede utilizar:

```bash
terraform destroy
```