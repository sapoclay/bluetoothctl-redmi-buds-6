#!/bin/bash
# ¿Cómo saber la MAC de los Redmi Buds?
# Con los auriculares encendidos, abre una terminal y ejecuta:
bluetoothctl
scan on


# Dirección MAC de los Redmi Buds 6 (reemplázala por la tuya)
DEVICE_MAC="XX:XX:XX:XX:XX:XX"

# Nombre para notificación
DEVICE_NAME="Redmi Buds 6"

# Comprobación inicial
if [[ "$DEVICE_MAC" == "XX:XX:XX:XX:XX:XX" ]]; then
    notify-send "Bluetooth" "❌ Dirección MAC no configurada en el script"
    echo "❌ Por favor, edita el script y pon la dirección MAC de tus Redmi Buds 6."
    exit 1
fi

# Verificar estado de conexión actual
IS_CONNECTED=$(bluetoothctl info "$DEVICE_MAC" | grep "Connected: yes")

if [[ -n "$IS_CONNECTED" ]]; then
    # Desconectar
    echo "🔌 Desconectando de $DEVICE_NAME..."
    bluetoothctl disconnect "$DEVICE_MAC" > /dev/null
    if [[ $? -eq 0 ]]; then
        notify-send "Bluetooth" "🔌 $DEVICE_NAME desconectado"
        echo "✅ $DEVICE_NAME desconectado correctamente."
    else
        notify-send "Bluetooth" "❌ Error al desconectar $DEVICE_NAME"
        echo "❌ Error al desconectar."
    fi
else
    # Conectar
    echo "🔄 Conectando a $DEVICE_NAME..."
    bluetoothctl << EOF > /dev/null
power on
agent on
default-agent
connect $DEVICE_MAC
EOF

    IS_CONNECTED_NOW=$(bluetoothctl info "$DEVICE_MAC" | grep "Connected: yes")
    if [[ -n "$IS_CONNECTED_NOW" ]]; then
        notify-send "Bluetooth" "✅ $DEVICE_NAME conectado correctamente"
        echo "✅ $DEVICE_NAME conectado correctamente."
    else
        notify-send "Bluetooth" "❌ No se pudo conectar a $DEVICE_NAME"
        echo "❌ No se pudo conectar. Asegúrate de que los auriculares estén encendidos y emparejados."
    fi
fi


# Tras guardar el contenido le damos permisos de ejecución 
# chmod +x conectar_redmi_buds.sh
# Lo ejecutamos como:
# ./conectar_redmi_buds.sh