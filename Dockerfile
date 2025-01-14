# Image Go
FROM golang:1.23.x AS gobuild

# Création de l'utilisateur vscode et définition du répertoire de travail
# -m crée un repertoire personnel pour l'utilisateur
# -s definition de basch comme shell
# attribut le repertoire à l utilisateur vscode
RUN useradd -m -s /bin/bash vscode \
    && mkdir -p /workspace \
    && chown vscode:vscode /workspace

    # Initialisation du go.mod&go.sum
RUN if [ -f go.mod ]; then rm go.mod; fi && go mod init cowsay && go mod tidy

# Espace de travail dans le devconteneur ou toute les commande seront executées
WORKDIR /workspace

# Copie de tous les fichiers du repertoire dans le devconteneur
COPY . .

# Change l'utilisateur actif par vscode
USER vscode

# Commande par défaut pour exécuter l'application
CMD ["go", "run", "main.go"]


