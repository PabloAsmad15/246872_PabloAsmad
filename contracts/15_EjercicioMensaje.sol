// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract MensajesBasicos {
    
    // Variable para guardar la dirección del propietario
    address public owner;

    // 1. Definimos la estructura del mensaje
    struct Mensaje {
        address from;
        address to;
        string contenido;
        uint256 timestamp;
    }

    // 2. Definimos el evento que se emitirá al enviar un mensaje
    event MensajeEnviado(
        address indexed from, 
        address indexed to, 
        string contenido, 
        uint256 timestamp
    );

    // Arreglo para guardar el historial de todos los mensajes enviados
    Mensaje[] public historialMensajes;

    // Constructor que asigna al creador del contrato como el propietario
    constructor() {
        owner = msg.sender;
    }

    // Modificador para restringir la ejecución solo al propietario
    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Solo el propietario puede enviar mensajes.");
        _;
    }

    // 3. Función principal para enviar el mensaje
    function enviarMensaje(address _to, string memory _contenido) public onlyOwner {
        
        // Se crea y guarda el mensaje en la estructura dentro del arreglo
        historialMensajes.push(Mensaje({
            from: msg.sender, // o también se puede usar la variable 'owner'
            to: _to,
            contenido: _contenido,
            timestamp: block.timestamp
        }));

        // Se emite el evento para dejar el registro en la blockchain
        emit MensajeEnviado(msg.sender, _to, _contenido, block.timestamp);
    }

    // Función adicional (opcional) para consultar la cantidad de mensajes enviados
    function obtenerTotalMensajes() public view returns (uint256) {
        return historialMensajes.length;
    }
}