# CineBox 🎬

CineBox é um aplicativo desenvolvido em Flutter que consome a API do TMDB (The Movie Database) para listar filmes por categorias como Mais Populares, Em Cartaz, Top Rated, além de exibir filmes por gêneros.

O projeto foi criado com o objetivo de praticar conhecimentos em Flutter, incluindo padrões de arquitetura, gerenciamento de estado com Riverpod, consumo de APIs usando Dio, e organização de código em camadas.

## Screenshots

### 1 - Splash

<img width="400" height="900" alt="Screenshot_1757249388" src="https://github.com/user-attachments/assets/3907bb69-9271-4ad8-88c7-e03c4782242e" />

### 2 - Home

<img width="400" height="900" alt="Screenshot_1757249201" src="https://github.com/user-attachments/assets/c2bf0a1b-94dc-4766-9fe0-363932a8857f" />

### 3 - Filmes por gêneros

<img width="400" height="900" alt="Screenshot_1757249295" src="https://github.com/user-attachments/assets/b1d67fd3-42f5-4024-b7d7-c54f45eeef07" />

### 4 - Busca de filmes

<img width="400" height="900" alt="Screenshot_1757249307" src="https://github.com/user-attachments/assets/c6b7c011-10b8-48d8-b104-1262a7ef1bf4" />

### 5 - Detalhes do filmes

<img width="400" height="900" alt="Screenshot_1757249277" src="https://github.com/user-attachments/assets/813fd97c-1883-4260-8e5a-b238634864a0" />

### 6 - Filmes favoritos (em construção...)

## Funcionalidades

Listar filmes por categorias: Mais Populares, Em Cartaz, Top Rated.

Filtrar filmes por gêneros.

Exibição de detalhes de cada filme.

Consumo de API de forma assíncrona e organizada.

Gerenciamento de estado utilizando Riverpod.

Filmes Favoritos (em construção...)

Dark Mode (em construção...)

## Tecnologias Utilizadas

Flutter
 – Framework para desenvolvimento mobile.

Dio
 – Cliente HTTP para consumo de APIs.

Riverpod
 – Gerenciamento de estado.

Firebase
 - Google Auth.
 - Firestore (em construção...)

TMDB API – Fonte de dados para filmes e gêneros.

## Estrutura do Projeto

O projeto segue uma arquitetura organizada com separação de responsabilidades:

models/ – Classes de dados que representam filmes, gêneros, etc.

usecases/ - Regras de negócios.

repositories/ - Intermediador para a chamada externa (API).

services/ – Classes responsáveis pelo consumo da API (Dio).

providers/ – Riverpod providers para gerenciamento de estado.

screens/ – Telas do aplicativo.

widgets/ – Componentes reutilizáveis da UI.

## Aprendizados

Este projeto me permitiu praticar:

Consumo de APIs REST e tratamento de dados assíncronos.

Gerenciamento de estado com Riverpod.

Organização de código seguindo boas práticas de arquitetura.

Criação de UI responsiva em Flutter.




