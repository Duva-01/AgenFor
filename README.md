# Mi App de Agenda para Informáticos

## Descripción
Mi aplicación es una agenda especialmente diseñada para informáticos. Ofrece varias secciones útiles para organizar la vida estudiantil y profesional. La app incluye las siguientes características:

## Secciones

### Noticias Tecnológicas
Esta sección presenta las últimas noticias tecnológicas obtenidas a través de una API. Mantente al tanto de las novedades en el mundo de la tecnología.

### Biblioteca
La sección de biblioteca contiene una colección de libros relacionados con diferentes asignaturas de la carrera informática. Accede a recursos valiosos para tus estudios y proyectos.

### Calendario y Notas
Organiza tu tiempo con un calendario integrado y crea notas para recordar tareas importantes, fechas límite y eventos. Mantén todo en un solo lugar.

### Método Pomodoro
Optimiza tu productividad con un temporizador basado en el método Pomodoro. Divide tu trabajo en intervalos de tiempo concentrado y descanso para mantener la eficiencia.

### Chat estilo WhatsApp
Utiliza la funcionalidad de chat, inspirada en WhatsApp, para comunicarte con colegas y amigos. Esta sección está respaldada por Firebase para una experiencia en tiempo real.

### Minijuego
Incluso los informáticos necesitan un descanso. Disfruta de un minijuego incorporado para relajarte entre sesiones de estudio y trabajo.

### Menú de Opciones
Accede a configuraciones y opciones adicionales para personalizar tu experiencia con la aplicación. Encuentra opciones de privacidad, recomendaciones y más.

## Enlaces de la App
| Nombre | Enlace |
| ---     | ---   |
| Play Store  | [Descargar App](https://play.google.com/store/apps/details?id=com.david.agenfor&hl=es_419&gl=US) |
| GitHub | [Codigo fuente](https://github.com/Duva-01/AgenFor) |



## Jerarquía de Directorios
```
|—— lib
|    |—— generated_plugin_registrant.dart
|    |—— main.dart
|    |—— register_page.dart
|    |—— sections
|        |—— agenda
|            |—— agenda.dart
|            |—— NotesPages.dart
|            |—— NotesScreen.dart
|        |—— biblioteca
|            |—— biblioteca_digital.dart
|            |—— buscador.dart
|            |—— pdf_apuntes_ac
|                |—— apuntes_generales_ac.dart
|                |—— apuntes_generales_ec.dart
|                |—— menu_arquitectura_computadores.dart
|            |—— pdf_apuntes_programacion.dart
|                |—— apuntes_generales_c++.dart
|                |—— apuntes_generales_html.dart
|                |—— apuntes_generales_js.dart
|                |—— apuntes_generales_pdoo.dart
|                |—— apuntes_generales_python.dart
|                |—— menu_programacion.dart
|            |—— pdf_apuntes_so
|                |—— apuntes_generales_fs.dart
|                |—— apuntes_generales_sc.dart
|                |—— apuntes_generales_so.dart
|                |—— apuntes_generales_ubuntu.dart
|                |—— apuntes_generales_windows7.dart
|                |—— menu_sistemas_operativos.dart
|            |—— pdf_apuntes_variado
|                |—— apuntes_generales_algebra.dart
|                |—— apuntes_generales_algoritmica.dart
|                |—— apuntes_generales_calculo.dart
|                |—— apuntes_generales_ed.dart
|                |—— apuntes_generales_fisica.dart
|                |—— apuntes_generales_logica.dart
|                |—— menu_apuntes_variado.dart
|        |—— foro_virtual
|            |—— chatSection
|                |—— ChatPage
|                    |—— ChatPage.dart
|                    |—— ConversationListScreen.dart
|                    |—— ForoArquitecturaComputadores.dart
|                    |—— ForoGeneral.dart
|                    |—— ForoPreguntas.dart
|                    |—— ForoProgramacion.dart
|                    |—— ForoSistemasOperativos.dart
|                    |—— perfil.dart
|                    |—— PerfilExterno.dart
|                    |—— PrivateChat.dart
|                    |—— SalaForos.dart
|                    |—— SignOut.dart
|                |—— firebaseHelper.dart
|                |—— LoginPage.dart
|                |—— RegisterChatApp.dart
|            |—— IniciarChatApp.dart
|        |—— minijuego
|            |—— leaderboard.dart
|            |—— minijuego.dart
|        |—— noticias_tecnologia
|            |—— helper
|                |—— noticias.dart
|                |—— widgets.dart
|            |—— modelos
|                |—— articulo.dart
|                |—— modelo_categorias.dart
|            |—— noticias_tech.dart
|            |—— secret.dart
|            |—— vista_articulos.dart
|        |—— opciones
|            |—— intro.dart
|            |—— opciones.dart
|            |—— privacy_policy.dart
|            |—— recomendacion.dart
|        |—— sesion_estudio
|            |—— sesion_estudio.dart
```


