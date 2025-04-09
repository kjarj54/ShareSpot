# ShareSpot

ShareSpot es una aplicación móvil desarrollada en Flutter que permite a los usuarios obtener su ubicación actual y compartirla fácilmente a través de aplicaciones de terceros. Esta aplicación demuestra el uso de funciones relacionadas con GPS, manejo de permisos de ubicación y la integración con mapas interactivos.

## Características

- **Obtener ubicación actual**: Carga la ubicación del usuario utilizando el GPS del dispositivo.
- **Mapa interactivo**: Muestra un mapa con un "pin" indicando la ubicación actual del usuario.
- **Gestión de permisos**: Solicita el consentimiento del usuario para acceder a la ubicación; si se rechazan los permisos, la aplicación no carga la información en el mapa.
- **Compartir ubicación**: Permite compartir la latitud y longitud del usuario con aplicaciones instaladas, como WhatsApp, Instagram, Messenger, entre otras.
- **Interfaz amigable**: La aplicación está diseñada para ofrecer una experiencia de usuario intuitiva y visualmente atractiva.
- **Mensajes de error**: Muestra mensajes amigables en caso de errores o rechazo de permisos.

## Requisitos

- **Flutter**: Version 3.x o superior
- **SDK**: Dart
- **Plataformas soportadas**: Android e iOS

## Instalación

Sigue los pasos a continuación para clonar este repositorio e instalar la aplicación:

1. Clona este repositorio:
   ```bash
   git clone https://github.com/kjarj54/ShareSpot.git
   cd ShareSpot
   ```

## Instalación de Dependencias

Asegúrate de tener Flutter instalado y ejecuta el siguiente comando para instalar las dependencias del proyecto:

```bash
flutter pub get
```

## Ejecución de la Aplicación

Usa el siguiente comando para ejecutar la aplicación en un emulador o dispositivo físico:

```bash
flutter run
```

## Uso de la Aplicación

### Pantalla Inicial

- Contiene un botón para cargar la ubicación actual del usuario.
- Muestra un mapa con un "pin" en la ubicación actual del usuario tras aceptar los permisos.

### Permisos de Ubicación

- La aplicación solicita el consentimiento del usuario antes de acceder a la ubicación.
- Si los permisos son rechazados, la aplicación no cargará la información en el mapa.

### Compartir Ubicación

- Un botón de compartir despliega un menú con las aplicaciones instaladas.
- Al seleccionar una aplicación, esta se abre con los datos de latitud y longitud precargados.

## Tecnologías Utilizadas

- **Flutter**: Framework principal para el desarrollo multiplataforma.
- **Google Maps API**: Para integrar el mapa y mostrar la ubicación del usuario.
- **Dart**: Lenguaje de programación utilizado para la lógica del proyecto.
- **CMake**: Configuración del proyecto nativo en plataformas.

## Estructura del Proyecto

```plaintext
ShareSpot/
├── lib/
│   ├── main.dart                # Punto de entrada de la aplicación
│   ├── screens/
│   │   ├── home_screen.dart     # Pantalla inicial con el mapa y funcionalidades
│   │   └── permissions.dart     # Manejo de permisos de ubicación
│   ├── widgets/
│   │   ├── map_widget.dart      # Widget para mostrar el mapa y el "pin"
│   │   └── share_button.dart    # Botón para compartir la ubicación
├── assets/
│   ├── images/                  # Recursos gráficos
├── pubspec.yaml                 # Configuración de dependencias
```

## Mejoras Futuras

- Soporte para más idiomas.
- Implementación de temas claros y oscuros.
- Almacenamiento de ubicaciones previamente compartidas.

## Contribuciones

¡Las contribuciones son bienvenidas! Si tienes ideas o encuentras problemas, no dudes en abrir un issue o enviar un pull request.

