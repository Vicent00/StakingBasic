# 🌟 Staking App - Proyecto con Foundry

¡Bienvenido a **Staking App**, un emocionante proyecto de staking hecho con Foundry! 🚀 Aquí podrás desplegar y probar un sistema de staking de tokens completamente en Remix IDE, sin necesidad de deployarlo en una testnet. 🎉 Este proyecto es ideal para desarrolladores que desean entender cómo funciona el staking de tokens ERC20 y experimentar con su funcionamiento desde cero. 💪

---

## 📚 Descripción del Proyecto

Este proyecto consta de dos contratos inteligentes diseñados para proporcionar funcionalidad básica de staking con tokens ERC20. La idea principal es permitir que los usuarios bloqueen sus tokens durante un tiempo determinado a cambio de recompensas fijas. 📆💰

### 🔑 Contratos Principales
1. **📄 StakingContract.sol**:
   - 📥 **Depósitos (Staking):** Permite a los usuarios depositar un monto fijo de tokens para participar en el staking.
   - 📤 **Retiros (Withdraw):** Los usuarios pueden retirar sus tokens con recompensas acumuladas al finalizar el periodo de staking.
   - 🧮 **Cálculo de Recompensas:** Implementa un sistema de recompensas fijas basado en el tiempo que los tokens permanecen bloqueados.
   - 📊 **Tarifas por Uso:** El contrato puede aplicar tarifas en función del monto depositado.

2. **💰 StakingToken.sol:**
   - 🪙 **Token ERC20 Básico:** Este contrato crea un token ERC20 minimalista que se puede usar para staking.
   - 🧩 **Función Mint:** Permite crear nuevos tokens y asignarlos a una dirección específica, útil para pruebas locales.

---

## 🛠️ Tecnologías Usadas
- ⚙️ Solidity 0.8.26
- 🧩 Foundry (para pruebas y despliegue)
- 📦 OpenZeppelin Contracts (para manejo seguro de permisos y ERC20)

---

## 🚀 Despliegue Fácil en Remix IDE
¡Desplegar esta aplicación es pan comido! 🍞 Sigue estos pasos:

1. Abre [Remix IDE](https://remix.ethereum.org/) 💻.
2. Carga ambos archivos `StakingContract.sol` y `StakingToken.sol` 📂.
3. Compila ambos contratos usando el compilador Solidity 0.8.26 ⚙️.
4. **Primero** despliega `StakingToken.sol` para crear el token que será usado para staking. 🔨
5. **Luego** despliega `StakingContract.sol`, pasando la dirección del token creado como argumento del constructor. 📝

### 💡 Recomendaciones
- Asegúrate de configurar correctamente los parámetros `stakingPeriod_`, `fixedStakingAmount_` y `feePerAmount_` al desplegar `StakingContract.sol`. 📌

---

## 🎮 Cómo Usarlo (Guía Detallada)

### 1. 🔨 Generar Tokens
   - Llama a la función `mint()` en `StakingToken.sol` para crear tokens. Especifica la dirección a la que se le asignarán y la cantidad a crear. 📈

### 2. 🔒 Autorizar Uso de Tokens
   - Usa la función `approve()` en `StakingToken` para permitir que `StakingContract` pueda transferir tokens en tu nombre. Esto es esencial para el staking. ✅

### 3. 📥 Realizar Staking
   - Llama a `stake()` en `StakingContract.sol` con la cantidad exacta especificada por `fixedStakingAmount_`.
   - El contrato bloqueará los tokens por el periodo configurado y comenzará a acumular recompensas. 💸

### 4. 📤 Retirar Tokens y Recompensas
   - Después de que el periodo de staking termine, utiliza `withdraw()` para retirar tus tokens y recibir las recompensas generadas. 🤑

---

## 🔐 Seguridad
⚠️ **IMPORTANTE:**
- Este contrato es un prototipo y no está optimizado para producción. 🚧
- Se recomienda realizar una auditoría de seguridad profesional antes de implementarlo en un entorno real. 🔍
- Considera agregar límites de staking, medidas anti-spam, y protección contra ataques como reentrancy.

---

## 🌟 Futuras Implementaciones
Aquí algunas ideas para expandir el proyecto y hacerlo aún más robusto y funcional: 📈
- 🔄 Soporte para múltiples tokens en el mismo contrato.
- 📅 Implementar staking flexible con diferentes periodos y tasas de recompensa.
- 🖥️ Crear un frontend atractivo que se comunique con los contratos mediante Web3.
- ✅ Añadir pruebas más detalladas utilizando Foundry para asegurar la calidad del código.
- 📊 Recompensas variables basadas en la duración del staking.
- 🔐 Implementar un sistema de penalidades por retiro anticipado.
- 📈 Añadir un sistema de gobernanza para permitir ajustes en las recompensas y periodos de staking.

---

## 📜 Licencia
Este proyecto está licenciado bajo la Licencia MIT. ✅



