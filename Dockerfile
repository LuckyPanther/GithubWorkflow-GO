# Étape de construction de l'image Go
FROM golang:1.23.1 AS gobuild

# Définir le GOPATH et le répertoire de travail
ENV GOPATH=/workspace/go
WORKDIR /workspace

# Création d'un utilisateur non-root et configuration des permissions
# L'image fonctionne sans la definition de l utilisateur mais pas le devcontainer ! (a creuser pour mieux comprendre)
RUN useradd -m -s /bin/bash vscode \
     && mkdir -p /workspace \
     && chown vscode:vscode /workspace

# Copier uniquement les fichiers sources
COPY . .

# Changer l'utilisateur actif pour éviter d'utiliser root
USER vscode

# Initialiser les modules Go et installer les dépendances
RUN go mod init cowsay && \
    go mod tidy

# Compiler le projet Go en désactivant VCS (a creuser pour mieux comprendre)
RUN go build -o app -buildvcs=false .

# Commande par défaut pour exécuter l'application
CMD ["./app"]


