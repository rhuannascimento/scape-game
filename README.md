# Scape Game

## Descrição

Scape Game é um jogo desenvolvido como segundo trabalho da disciplina de **Desenvolvimento de Jogos**. O projeto utiliza a engine Godot e apresenta mecânicas clássicas de plataforma com foco em gameplay envolvente e polido.

## Requisitos do Projeto

### ✓ Tela Inicial
- Menu inicial com opção de iniciar o jogo
- Interface intuitiva para navegação

### ✓ Animações de Sprites e Tiles
- Animações de sprites para personagens e inimigos
- Uso de tiles animados nos cenários

### ✓ Animações Gerais
- Animações que não envolvem sprites (transições, efeitos visuais, etc.)

### ✓ Detecção e Tratamento de Colisões
- Colisões detectadas via sistema de física do Godot
- Tratamento de colisões entre player, inimigos, plataformas e objetos

### ✓ Áudio e HUD
- Efeitos sonoros para ações do jogo
- Música de fundo
- Interface gráfica (HUD) exibindo informações importantes do jogo

### ✓ Controle de Câmera
- Câmera dinâmica que segue o player
- Deslocamento contínuo da câmera durante a gameplay

### ✓ Objetivo do Jogo
- Escapar dos perigos e alcançar a saída
- Progressão através de fases com dificuldade crescente

### ✓ Tela de Créditos
- Exibição de informações do grupo
- Referência a fontes de assets utilizados

## Padrões de Desenvolvimento

### Estrutura do Código

```
src/
├── Main.tscn                 # Cena principal do jogo
├── modules/
│   ├── player/
│   │   ├── Player.tscn      # Cena do personagem
│   │   └── scripts/
│   │       └── player.gd    # Script de controle do player
│   ├── world/
│   │   └── World.tscn       # Cena do mundo/fase
│   ├── enemy/               # (futuro) Módulo de inimigos
│   │   ├── Enemy.tscn
│   │   └── scripts/
│   │       └── enemy.gd
│   ├── ui/                  # (futuro) Módulo de interface
│   │   ├── HUD.tscn
│   │   └── scripts/
│   │       └── hud.gd
│   └── [novo-modulo]/       # Padrão para novos módulos
│       ├── [Componente].tscn
│       └── scripts/
│           └── [componente].gd
```

#### Como Replicar para Futuros Módulos

1. **Criar a pasta do módulo**: `src/modules/[nome-do-modulo]/`
2. **Criar a cena principal**: `src/modules/[nome-do-modulo]/[NomeComponente].tscn`
3. **Criar a pasta de scripts**: `src/modules/[nome-do-modulo]/scripts/`
4. **Seguir a convenção de nomenclatura**:
   - Arquivos `.tscn` em PascalCase
   - Arquivos `.gd` em snake_case
   - Nomes de classes em PascalCase
5. **Instanciar o módulo** na cena pai quando necessário

### Padrão de Commits

Todos os commits devem seguir o padrão Conventional Commits com descrições em português:

```
FEAT: Adiciona nova funcionalidade
FIX: Corrige bug ou problema existente
CHORE: Alterações em configuração, dependências ou estrutura
REFACT: Refatoração de código sem mudança de funcionalidade
```

#### Exemplos:
- `FEAT: Adiciona sistema de pulo do player`
- `FIX: Corrige colisão com player`
- `CHORE: Reorganiza estrutura de pastas`
- `REFACT: Melhora lógica de controle de câmera`

### Padrão de Branches

As branches devem seguir o padrão:

```
feat/[descrição-da-funcionalidade]
fix/[descrição-do-problema]
chore/[descrição-da-tarefa]
refact/[descrição-da-refatoração]
```

#### Exemplos:
- `feat/sistema-de-vidas`
- `feat/inimigo-voador`
- `fix/bug-de-colisao-com-parede`
- `fix/audio-nao-reproduz-corretamente`
- `chore/atualizar-versao-godot`
- `refact/melhorar-sistema-de-eventos`

#### Regras para Branches:
1. Use hífen (`-`) para separar palavras
2. Use apenas letras minúsculas
3. Crie uma branch por feature/fix
4. Fazer Pull Request para master
5. Sempre crie a branch a partir da `master`

## Como Executar

1. Abra o projeto no Godot Engine
2. Clique em "Run" ou pressione `F5` para iniciar o jogo
3. Navegue pelo menu inicial para começar


## Grupo

- Rhuan Nascimento Ferreira
- Mario Henrrique
- Alfredo Lucas
- ???



**Desenvolvido para a disciplina de Desenvolvimento de Jogos**
