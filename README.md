# idleNvim

![Logo](https://raw.githubusercontent.com/Maurux01/idlenvim/main/assets/logo.png)

Una configuración de Neovim moderna para desarrollo frontend y backend, diseñada para ser **simple, rápida y potente**. Viene con scripts de instalación para que puedas empezar a programar en minutos.

---

## ✨ Características

-   ⚡ **Inicio Rápido**: Optimizada para la velocidad con `lazy.nvim`.
-   🎨 **UI/UX de IDE**: Interfaz moderna y funcional con `which-key` para descubrir atajos, notificaciones mejoradas con `noice.nvim` y un dashboard de bienvenida.
-   ✍️ **Formateo Automático**: Código limpio y consistente sin esfuerzo. Formateo al guardar con `none-ls`, compatible con `prettier`, `stylua` y más.
-   🧩 **LSP Inteligente**: Soporte completo para LSP con `mason.nvim` para la instalación automática de servidores de lenguajes y autocompletado avanzado con `nvim-cmp`.
-   🐛 **Depuración Integrada**: Depurador visual completo con `nvim-dap` y `nvim-dap-ui`. Añade breakpoints y ejecuta tu código paso a paso como en un IDE.
-   🐙 **Git Avanzado**: Interfaz de Git súper potente con `lazygit.nvim` y `gitsigns.nvim` para una gestión de versiones fluida.
-   🔍 **Búsqueda Potente**: Encuentra archivos y texto de forma interactiva con `telescope.nvim`.
-   💻 **Multiplataforma**: Scripts de instalación sencillos para Windows y Linux/macOS.

---

## 📋 Guía de Instalación Detallada

### Paso 1: Prerrequisitos

Antes de instalar, asegúrate de tener todo lo siguiente:

1.  **[Neovim](https://github.com/neovim/neovim/releases/tag/v0.9.1)** (v0.8.0 o superior).
2.  **[Git](https://git-scm.com/downloads)** para clonar el repositorio y para que los plugins de Git funcionen.
3.  **[Nerd Fonts](https://www.nerdfonts.com/font-downloads)** para que los iconos se muestren correctamente en la interfaz. Se recomienda **FiraCode Nerd Font**.
    > **Importante**: Después de instalar la fuente, no olvides **configurarla en tu terminal** (Windows Terminal, Alacritty, iTerm2, etc.).
4.  **(Recomendado)** Un compilador de C (como `gcc` o `Build Tools for Visual Studio`) para que `nvim-treesitter` compile los parsers de lenguajes más rápido.
5.  **(Recomendado)** `ripgrep` para que la búsqueda de texto de Telescope (`live_grep`) sea súper rápida.
6.  **(Opcional, para Git UI)** `lazygit` para usar la interfaz de Git avanzada.
7.  **(Opcional, para Depuración)** Los "adaptadores" de depuración para tus lenguajes. Se pueden instalar fácilmente con `:Mason`.

### Paso 2: Clonar el Repositorio

Abre tu terminal y clona este repositorio en tu máquina:

```sh
git clone https://github.com/Maurux01/idlenvim.git
cd idlenvim
```

### Paso 3: Ejecutar el Instalador

El script de instalación hará una copia de seguridad de tu configuración actual (si existe) y copiará los archivos de `idleNvim` a la carpeta de configuración de Neovim.

-   #### **Windows**
    1.  Abre una terminal de **PowerShell**.
    2.  Puede que necesites ajustar la política de ejecución de scripts. Ejecuta este comando:
        ```powershell
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
        ```
    3.  Ahora, ejecuta el instalador:
        ```powershell
        ./install.ps1
        ```

-   #### **Linux / macOS**
    1.  Abre tu terminal.
    2.  Dale permisos de ejecución al script:
        ```sh
        chmod +x install.sh
        ```
    3.  Ejecuta el instalador:
        ```sh
        ./install.sh
        ```

### Paso 4: ¡Primer Inicio!

¡Ya está todo listo! Abre Neovim ejecutando:

```sh
nvim
```

La primera vez que lo abras, **`lazy.nvim` se encargará de instalar todos los plugins automáticamente**. Verás una ventana mostrando el progreso. Este proceso puede tardar unos minutos. Una vez que termine, reinicia Neovim y tu nueva configuración estará lista para usarse.

---

## ⌨️ Atajos de Teclado Esenciales

La tecla `<leader>` está configurada como la **barra espaciadora**. Gracias a `which-key.nvim`, después de presionar `<leader>`, aparecerá una ventana con los atajos disponibles.

**General y UI**
| Atajo              | Acción                                       |
| ------------------ | -------------------------------------------- |
| `<leader>e`        | Abrir/cerrar el explorador de archivos       |
| `<C-\>`            | Abrir/cerrar un terminal flotante            |
| `gcc`              | Comentar/descomentar la línea actual         |
| `gc` (modo visual) | Comentar/descomentar la selección            |

**Telescope (Búsqueda)**
| Atajo              | Acción                                       |
| ------------------ | -------------------------------------------- |
| `<leader>ff`       | Buscar archivos en el proyecto               |
| `<leader>fg`       | Buscar texto en el proyecto                  |
| `<leader>bb`       | Ver los búferes abiertos                     |
| `<leader>fh`       | Buscar en la ayuda de Neovim                 |

**LSP (Inteligencia de Código)**
| Atajo              | Acción                                       |
| ------------------ | -------------------------------------------- |
| `gd`               | Ir a la definición de una variable/función   |
| `K`                | Mostrar documentación (hover)                |
| `<leader>ca`       | Ver acciones de código disponibles           |
| `<leader>rn`       | Renombrar símbolo                            |

**Git (con LazyGit)**
| Atajo              | Acción                                       |
| ------------------ | -------------------------------------------- |
| `<leader>lg`       | Abrir la interfaz de LazyGit                 |

**Depurador (DAP)**
| Atajo              | Acción                                       |
| ------------------ | -------------------------------------------- |
| `<leader>db`       | Poner/quitar un punto de interrupción (breakpoint) |
| `<leader>dc`       | Iniciar/continuar la ejecución               |
| `<leader>do`       | Ejecutar el siguiente paso (step over)       |
| `<leader>di`       | Entrar en la función (step into)             |
| `<leader>du`       | Abrir/cerrar la interfaz del depurador       |

---

## 🔧 Personalización

Si quieres modificar la configuración, aquí tienes una guía rápida de la estructura de carpetas:

-   `init.lua`: El punto de entrada principal. No deberías necesitar tocarlo.
-   `lua/core/`: Contiene la configuración base de Neovim.
    -   `options.lua`: Opciones generales del editor.
    -   `keymaps.lua`: Atajos de teclado globales.
    -   `plugins.lua`: La lista de todos los plugins que se instalarán.
-   `lua/plugins/`: Contiene la configuración específica para cada plugin. Si quieres cambiar el comportamiento de Telescope, por ejemplo, edita `lua/plugins/telescope.lua`.

---

¡Disfruta de tu nueva experiencia de desarrollo con **idleNvim**!
