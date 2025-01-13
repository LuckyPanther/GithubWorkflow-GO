# Image Go de base
FROM golang:1.20

# Création de l'utilisateur vscode et définition du répertoire de travail
RUN useradd -m -s /bin/bash vscode \
    && mkdir -p /workspace \
    && chown vscode:vscode /workspace

WORKDIR /workspace

# Copie des fichiers source dans le conteneur
COPY . .

# Définition des droits pour l'utilisateur vscode
USER vscode

# Commande par défaut pour exécuter l'application
CMD ["go", "run", "main.go"]


