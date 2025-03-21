Documentación

Este documento ofrece una descripción general de los archivos y carpetas.

## Archivos LISP independientes

1. **Pendiente.lsp (pnd)**

- Script LISP para calcular la pendiente de dos lineas

2. **UTMDataExtractor.lsp (exportar_UTM)**

- Script para extraer datos UTM(Universal Transverse Mercator) de un plano AutoCAD
- Este tiene que contar con la capa _increment_

3. **igualarAngulo.lsp (aa)**

- La función `igualarAngulo` es una función de AutoLISP que permite alinear objetos de texto con el ángulo de una línea seleccionada en AutoCAD.
- Modifica la rotación del objeto de texto para que coincida con el ángulo de la línea.
- Permite al usuario reposicionar el texto.

## Carpetas y su contenido

### Carpeta Basics

Contiene utilidades fundamentales de AutoLISP:

- **countObjets.lsp (contar_objetos)**
- Para contar objetos en el dibujo

- **crearCirculo.lsp (crear_circulo)**
- Para crear círculos

- **cuadricula.lsp (cuadricula)**
- Funcionalidad relacionada con la cuadrícula o grip

- **dibujarTrazo.lsp (dibujarTrazo)**
- Función de trazado de linea

- **gridSize.lsp (gridSize)**
- Configuración del tamaño de la cuadrícula

- **trazoWithLength.lsp (trazo)**
- Dibujo avanzado de trazado con especificaciones de longitud

### Carpeta CopyorMove

- **copyCursor.lsp (CC)**
- Función de copiar elemento y esta quede acoplada en el cursor lista para insertarse en el dibujo

- **CopyorMove.lsp (COM)**
- Script completo y principal de operaciones de copia/movimiento

- **moveCursor.lsp (MC)**
- Función de mover elemento y esta quede acoplada en el cursor lista para insertarse en el dibujo

### Carpeta DeleteLayer

Herramientas de gestión de capas:

- **deleteLayer.lsp (deleteLayer)**
- Esta versión de la utilidad de eliminación de capas te permite escribir el nombre de la capa a eliminar
- Util en planos con pocas capas o con nombres cortos en estas
- _La capa no debe estar separada por espacios para que se pueda aplicar_

- **borrarCapa.lsp (BORRARCAPA)**
- Esta versión de la utilidad de eliminación de capas tiene mas ventaja ya que te brinda una lista con las capas y su numeracion

### MultiLinea Carpeta

Utilidades de dibujo multilínea:

- **multilinea.lsp (ML)**
- Funcionalidad básica de dibujo multilínea
- Permite crear varias lineas desde un punto base a diferentes puntos

- **multipleML.lsp (MultiML)**
- Gestión de múltiples líneas
- Une desde varios elementos de texto a un punto destinado por el usuario

- **multilineComplete.lsp (MLSum)**
- Solución completa de dibujo multilínea
- Esta version mejorada permite unir desde varios elementos de texto a un punto destinado por el usuario ademas de otras funciones.
- Estas son la de mostrar el total seleccionado
- Este a su vez cuenta con reglas de validacion, definiendo errores con cambios de color

---

Última actualización: 21 de marzo de 2025
