# CineBox 🎬

CineBox é um aplicativo desenvolvido em Flutter que consome a API do TMDB (The Movie Database) para listar filmes por categorias como Mais Populares, Em Cartaz, Top Rated, além de exibir filmes por gêneros.

O projeto foi criado com o objetivo de praticar conhecimentos em Flutter, incluindo padrões de arquitetura, gerenciamento de estado com Riverpod, consumo de APIs usando Dio, e organização de código em camadas.

## Funcionalidades

Listar filmes por categorias: Mais Populares, Em Cartaz, Top Rated.

Filtrar filmes por gêneros.

Exibição de detalhes de cada filme.

Consumo de API de forma assíncrona e organizada.

Gerenciamento de estado utilizando Riverpod.

## Tecnologias Utilizadas

Flutter
 – Framework para desenvolvimento mobile.

Dio
 – Cliente HTTP para consumo de APIs.

Riverpod
 – Gerenciamento de estado.

 Firebase - Google Auth.

TMDB API – Fonte de dados para filmes e gêneros.

## Estrutura do Projeto

O projeto segue uma arquitetura organizada com separação de responsabilidades:

models/ – Classes de dados que representam filmes, gêneros, etc.

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
