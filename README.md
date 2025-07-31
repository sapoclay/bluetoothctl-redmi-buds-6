# 🔊 Conexión Automática a Redmi Buds 6 por Bluetooth (Bash Script)

Este repositorio contiene un script en Bash que permite **conectar automáticamente tus auriculares Redmi Buds 6** mediante `bluetoothctl`, sin necesidad de interfaz gráfica.

---

## 🧩 Requisitos

- Linux con `bluetoothctl` (BlueZ).
- Auriculares emparejados al menos una vez con el sistema.
- Auriculares encendidos y en modo de conexión.

---

## 📥 Instalación

1. Clona o descarga el repositorio.
2. Edita el script `conectar_redmi_buds.sh` y **reemplaza la dirección MAC** por la de tus auriculares:
   ```bash
   DEVICE_MAC="XX:XX:XX:XX:XX:XX"
   ```

Puedes obtener esta dirección con el comando:
``` bash
bluetoothctl
scan on
```
Y esperar a que aparezca una línea como:

Device 12:34:56:78:9A:BC Redmi Buds 6

    Dale permisos de ejecución:

    chmod +x conectar_redmi_buds.sh

🚀 Uso

Ejecuta el script directamente:

./conectar_redmi_buds.sh

Si los auriculares están encendidos y dentro del rango, se establecerá la conexión automáticamente.
✅ Salida esperada

🔄 Intentando conectar a 12:34:56:78:9A:BC...
Attempting to connect to 12:34:56:78:9A:BC
Connection successful
✅ Conectado correctamente a 12:34:56:78:9A:BC.

❌ Posibles errores

    Si los auriculares están apagados o fuera de rango:

Failed to connect: org.bluez.Error.Failed
❌ No se pudo conectar.

Si no has reemplazado la dirección MAC:

    ❌ Por favor, edita el script y pon la dirección MAC de tus Redmi Buds 6.

🧪 Comprobación de conexión

Puedes verificar manualmente si están conectados con:

bluetoothctl info <DIRECCION_MAC>

Busca la línea:

Connected: yes
