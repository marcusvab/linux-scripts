#!/bin/bash

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <1|2>"
    exit 1
fi

# Define os valores fixos de chave e salt
chave="surfer123"
salt="surfer1234"

# Define o modo de operação
modo=$1

# Solicita ao usuário o texto interativamente com múltiplas linhas
if [ "$modo" == "1" ]; then
    echo "Digite o texto para criptografar (pressione Ctrl+D para finalizar):"
    texto=$(cat)
elif [ "$modo" == "2" ]; then
    echo "Digite o texto para descriptografar (Base64) (pressione Ctrl+D para finalizar):"
    texto=$(cat)
else
    echo "Opção inválida! Use '1' para criptografar ou '2' para descriptografar."
    exit 1
fi

# Deriva uma chave e um IV seguros a partir da senha e do salt
# A chave é derivada com SHA256 e o IV é o mesmo derivado do salt + chave
chave_derivada=$(echo -n "$chave$salt" | openssl dgst -sha256 | awk '{print $2}')
iv_derivado=$(echo -n "$salt$chave" | openssl dgst -sha256 | awk '{print $2}' | cut -c1-32)

if [ "$modo" == "1" ]; then
    # Criptografa o texto e converte para Base64
    echo -n "$texto" | openssl enc -aes-256-cbc -pbkdf2 -K "$chave_derivada" -iv "$iv_derivado" | base64
elif [ "$modo" == "2" ]; then
    # Decodifica Base64 e descriptografa
    echo "$texto" | base64 --decode | openssl enc -d -aes-256-cbc -pbkdf2 -K "$chave_derivada" -iv "$iv_derivado"
    echo # Adiciona uma linha em branco
