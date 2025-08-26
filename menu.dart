import 'dart:io';

// Variables para almacenar los datos del usuario
String cedula = '';
String nombre = '';
String login = '';
String clave = '';
String ciudad = '';

// Variable para controlar la opción preferida
int opcionPreferida = -1;

void main() {
  bool salir = false;
  
  // Lista de opciones del menú
  List<String> menuOpciones = [
    'Capturar datos del usuario',
    'Cambiar la clave del usuario',
    'Mostrar tablas de multiplicar',
    'Verificar si un número es Primo',
    'Seleccionar opción preferida del menú',
    'Salir'
  ];

  while (!salir) {
    print('\n--- Menú de Opciones ---');
    
    // Muestra el menú sin alterar el orden
    for (int i = 0; i < menuOpciones.length; i++) {
      String opcionTexto = menuOpciones[i];
      // Agrega la etiqueta "(Opción Preferida)" si corresponde
      if (i + 1 == opcionPreferida) {
        opcionTexto += ' (Opción Preferida)';
      }
      print('${i + 1}. $opcionTexto');
    }
    
    print('------------------------');
    stdout.write('Ingrese su opción: ');
    
    String? opcionElegida = stdin.readLineSync();
    if (opcionElegida == null) {
      print('Opción no válida. Intente de nuevo.');
      continue;
    }

    int? opcion = int.tryParse(opcionElegida);
    if (opcion == null || opcion < 1 || opcion > menuOpciones.length) {
      print('Opción no válida. Intente de nuevo.');
      continue;
    }

    switch (opcion) {
      case 1:
        capturarDatos();
        break;
      case 2:
        cambiarClave();
        break;
      case 3:
        mostrarTablasMultiplicar();
        break;
      case 4:
        verificarPrimo();
        break;
      case 5:
        seleccionarOpcionPreferida();
        break;
      case 6:
        salir = true;
        break;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }

  mostrarDatosFinales();
}

/// Función para la opción 1: Capturar los datos del usuario.
void capturarDatos() {
  print('\n--- Capturar Datos del Usuario ---');
  stdout.write('Ingrese su cédula: ');
  cedula = stdin.readLineSync() ?? '';
  stdout.write('Ingrese su nombre: ');
  nombre = stdin.readLineSync() ?? '';
  stdout.write('Ingrese su login: ');
  login = stdin.readLineSync() ?? '';
  stdout.write('Ingrese su clave: ');
  clave = stdin.readLineSync() ?? '';
  stdout.write('Ingrese su ciudad de residencia: ');
  ciudad = stdin.readLineSync() ?? '';
  print('Datos capturados exitosamente.');
}

/// Función para la opción 2: Cambiar la clave del usuario.
void cambiarClave() {
  print('\n--- Cambiar Clave del Usuario ---');
  if (login.isEmpty) {
    print('Error: Primero debe capturar los datos del usuario (Opción 1).');
    return;
  }

  stdout.write('Ingrese su login actual: ');
  String? loginIngresado = stdin.readLineSync();
  stdout.write('Ingrese su clave actual: ');
  String? claveIngresada = stdin.readLineSync();

  if (loginIngresado == login && claveIngresada == clave) {
    stdout.write('Ingrese la nueva clave: ');
    String? nuevaClave = stdin.readLineSync();
    if (nuevaClave != null && nuevaClave.isNotEmpty) {
      clave = nuevaClave;
      print('La clave ha sido cambiada exitosamente.');
    } else {
      print('La nueva clave no puede estar vacía.');
    }
  } else {
    print('Error: Login o clave incorrectos.');
  }
}

/// Función para la opción 3: Mostrar las tablas de multiplicar.
void mostrarTablasMultiplicar() {
  print('\n--- Tablas de Multiplicar ---');
  stdout.write('Ingrese el número mínimo: ');
  int? min = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write('Ingrese el número máximo: ');
  int? max = int.tryParse(stdin.readLineSync() ?? '');

  if (min == null || max == null || min > max) {
    print('Error: Rango de números no válido.');
    return;
  }

  for (int i = min; i <= max; i++) {
    print('\nTabla del $i:');
    for (int j = 1; j <= 10; j++) {
      print('$i x $j = ${i * j}');
    }
  }
}

/// Función para la opción 4: Verificar si un número es primo.
void verificarPrimo() {
  print('\n--- Verificar Número Primo ---');
  stdout.write('Ingrese un número entero (mayor a 1): ');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  if (numero == null || numero <= 1) {
    print('Error: El número debe ser un entero mayor a 1.');
    return;
  }

  bool esPrimo = true;
  for (int i = 2; i <= numero / 2; i++) {
    if (numero % i == 0) {
      esPrimo = false;
      break;
    }
  }

  if (esPrimo) {
    print('El número $numero es primo.');
  } else {
    print('El número $numero no es primo.');
  }
}

/// Función para la opción 5: Seleccionar la opción preferida del menú.
void seleccionarOpcionPreferida() {
  print('\n--- Seleccionar Opción Preferida ---');
  print('1. Capturar datos del usuario');
  print('2. Cambiar la clave del usuario');
  print('3. Mostrar tablas de multiplicar');
  stdout.write('Ingrese el número de la opción que desea como preferida: ');
  int? opcion = int.tryParse(stdin.readLineSync() ?? '');

  if (opcion != null && opcion >= 1 && opcion <= 3) {
    opcionPreferida = opcion;
    print('La opción $opcion ha sido establecida como preferida.');
  } else {
    print('Opción no válida. Debe elegir entre 1, 2 o 3.');
  }
}

/// Función para mostrar los datos personales al salir del programa.
void mostrarDatosFinales() {
  print('\n' + '-' * 30);
  print('Datos Personales del Estudiante');
  
  if (nombre.isEmpty || cedula.isEmpty) {
    print('No se han capturado datos del usuario. Saliendo del programa.');
  } else {
    print('Cédula: $cedula');
    print('Nombre Completo: $nombre');
    print('Login: $login');
    print('Clave: $clave');
    print('Ciudad: $ciudad');
    print('\nAutoevaluación:');
    print('He completado las funcionalidades del programa, demostrando la capacidad de manejar entradas de usuario, lógica condicional, bucles y manipulación de datos en Dart.');
  }
  
  print('-' * 30);
}