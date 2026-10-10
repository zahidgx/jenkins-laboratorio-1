# Laboratorio 1 — Jenkins

## Objetivo

Instalar Jenkins mediante Docker y ejecutar una tarea Freestyle llamada `pipe-hola-mundo` con el comando `echo "Hola Mundo"`.

## Resultado de la verificación

La tarea se ejecutó realmente en Jenkins y terminó con **SUCCESS**. Se incluyen un extracto de la salida de consola y los datos de la compilación.

**Entorno de la verificación:** Jenkins 2.516.3 con Java 17 en el entorno Linux de trabajo de ChatGPT. La ejecución se realizó con asistencia de ChatGPT.

**Pendiente del laboratorio:** ejecutar la instalación con Docker solicitada por el profesor. El proyecto incluye los comandos y la configuración `jenkins/jenkins:lts-jdk21`; Docker no se utilizó en esta verificación.

La captura original de la consola se entrega por separado.

## Archivos

| Archivo | Función |
| --- | --- |
| `hola-mundo.sh` | Imprime `Hola Mundo`. |
| `docker-compose.yml` | Inicia Jenkins con JDK 21, puerto 8081 y volumen persistente. |
| `jenkins/pipe-hola-mundo.xml` | Configuración exportada del trabajo Freestyle ejecutado. |
| `tests/test_hola_mundo.sh` | Comprueba la sintaxis y la salida del script. |
| `evidencias/` | Extracto de consola y datos de la ejecución real. |
| `Jenkinsfile` | Pipeline alternativo opcional; no forma parte de la evidencia Freestyle. |

## 1. Iniciar Jenkins mediante Docker

Con Docker Desktop iniciado, abrir PowerShell y ejecutar los comandos proporcionados por el profesor:

```powershell
docker volume create jenkins_home
docker run -d --name jenkins --restart unless-stopped -p 127.0.0.1:8081:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk21
```

Abrir **http://127.0.0.1:8081**. Para consultar la contraseña inicial:

```powershell
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Completar el asistente de Jenkins, instalar los plugins sugeridos y crear el usuario administrador.

**Alternativa con Compose:** desde la carpeta de este proyecto, ejecutar `docker compose up -d`. Elegir una de las dos formas de arranque para evitar duplicar el contenedor.

## 2. Crear la tarea como en el video

1. Elegir **New Item / Nueva tarea**.
2. Escribir `pipe-hola-mundo`.
3. Seleccionar **Freestyle project / Proyecto de estilo libre**.
4. Agregar la descripción `Hola mundo`.
5. En **Build Steps**, elegir **Execute shell / Ejecutar línea de comandos**.
6. Agregar el comando:

```sh
echo "Hola Mundo"
```

7. Guardar y seleccionar **Build Now / Construir ahora**.
8. Abrir la compilación y elegir **Console Output / Salida de consola**.

El resultado debe incluir:

```text
+ echo Hola Mundo
Hola Mundo
Finished: SUCCESS
```

La configuración incluida en `jenkins/pipe-hola-mundo.xml` contiene ese mismo paso de ejecución.

## 3. Probar el script

Desde Git Bash o una terminal Linux, situarse en la carpeta del proyecto:

```sh
sh tests/test_hola_mundo.sh
```

Resultado verificado:

```text
OK: el script imprime Hola Mundo
```

## 4. Evidencia incluida

- `evidencias/consola-jenkins.txt`: extracto de la salida descargada directamente de Jenkins, desde la ejecución del comando.
- `evidencias/resultado-ejecucion.json`: versión, fecha, compilación, resultado y entorno.

Para completar la evidencia de Docker, ejecutar el apartado 1 y capturar `docker ps`, el volumen `jenkins_home` y la consola del trabajo después de construirlo en esa instalación.

## 5. Detener Jenkins

Si se inició con los comandos del profesor:

```powershell
docker stop jenkins
```

Si se inició con Compose:

```powershell
docker compose down
```

El volumen `jenkins_home` conserva la configuración y los trabajos.

## Material de referencia

- [Laboratorio y videos del profesor](https://github.com/jorgealmeidamontiel/jenkins-laboratories/tree/main/Lab%201).
- [Ejemplo consultado](https://github.com/caspercit/jenkins-laboratorio-1).

La imagen del ejemplo no se utilizó como evidencia de este proyecto.
