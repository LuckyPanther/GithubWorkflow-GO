# Image Go
FROM golang:1.23.1 AS gobuild

# Création de l'utilisateur vscode et définition du répertoire de travail
# -m crée un repertoire personnel pour l'utilisateur
# -s definition de basch comme shell
# attribut le repertoire à l utilisateur vscode
ENV GOPATH=/workspace/go

RUN useradd -m -s /bin/bash vscode \
    && mkdir -p /workspace \
    && chown vscode:vscode /workspace


    # Initialisation du go.mod&go.sum
RUN go mod init cowsay && go mod tidy

# Copie de tous les fichiers du repertoire dans le devconteneur
COPY . .

# Espace de travail dans le devconteneur ou toute les commande seront executées
WORKDIR /workspace


# Change l'utilisateur actif par vscode
USER vscode

RUN go build -o app .

# Commande par défaut pour exécuter l'application
CMD ["go", "run", "app"]


