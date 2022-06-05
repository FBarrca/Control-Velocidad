# Control Velocidad
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


Control de Velocidad de avance del robot Turtlebot3 mediante reguladores de tipo PID usando ROS2. Los nodos de ROS2 se han creado usando la herramienta de Code Generation de Simulink. De esta forma, el alumno puede crear fácilmente los controles en un entorno en el que está familiarizado

Imagen simulink?

## Installation
Este modelo está pensado para ser usado en MATLAB 2022a utilizando la librería ROS Toolbox.
Para empezar, se necesita instalar MATLABy descargar el código de GitHub.
###Si se tiene instalado Git 
```bash
git clone https://github.com/FranciscoBarCa/Control-Velocidad.git
cd cd Control-Velocidad
matlab -r EnsayoControlVelocidad #Asegurarse es 2022a
```


## Usage
Una vez creado el nodo con el comando build, no hace falta volver a usar el EnsayoControlVelocidad.slx salvo que se quiera hacer algun cambio al control.
Para realizar el ensayo se usa la función EnsayoPC para ejecutar el ensayo con los parametros expuestos.

## License
MIT License

Copyright (c) 2022 Francisco Barragán

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
