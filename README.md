# polski-craft

Espaço para usar o [Craft Anything](https://github.com/storytold/craft-anything). Ele estuda um site ou programa e, com a ajuda de um agente de programação (o Claude Code), cria um projeto parecido, com o seu próprio conteúdo.

> O Craft Anything ainda é alfa. Use só em sites e programas que são seus ou que você tem permissão para estudar. Ele não copia logotipos, fotos nem textos de outras pessoas.

## 1. Instalar

**Jeito fácil (Windows, Mac, Linux):** baixe o instalador da [última versão](https://github.com/storytold/craft-anything/releases/latest).

| Sistema | Arquivo |
|---|---|
| Windows | `craft-anything-<versão>-windows-x64.msi` |
| Mac | `craft-anything-<versão>-macos-universal.dmg` |
| Linux | veja a lista na página da versão |

**Pela linha de comando (Mac/Linux, compilando):** precisa do [Rust](https://rustup.rs) 1.97 ou mais novo.

```sh
./instalar.sh
```

## 2. Pré-requisito: Claude Code

Para criar projetos, o Claude Code precisa estar instalado e com login feito no seu computador:
https://code.claude.com. Depois, conecte os dois e confira:

```sh
craft-anything-cli setup --client claude_code --yes   # liga o Craft Anything ao Claude Code
craft-anything-cli doctor        # mostra o que está ok e o que falta
```

## 3. Usar

No app: abra o Craft Anything, cole o endereço de um site ou escolha um programa e descreva o que quer.

Na linha de comando:

```sh
# recriar um site
craft-anything-cli rebuild https://example.com "Recrie este site" --project-folder projetos/meu-site

# criar do zero, a partir de uma descrição
craft-anything-cli rebuild - "Um jogo da cobrinha" --project-folder projetos/cobrinha

# continuar um projeto
craft-anything-cli rebuild - "Deixe o cabeçalho azul" --continue-in projetos/meu-site
```

Cada projeto em `projetos/` tem:

| Pasta/arquivo | O que é |
|---|---|
| `app/` | o projeto criado |
| `craft.json` | o pedido, o alvo e o histórico |
| `capture/` | o que foi gravado do original |
| `checks/` | comparações com o original |
| `inbox/` | perguntas em aberto |

## 4. Guardar no GitHub

```sh
git add projetos/meu-site
git commit -m "Novo projeto: meu-site"
git push
```

A pasta `capture/` de cada projeto fica fora do git (veja `.gitignore`), porque é grande e tem material do site original.
