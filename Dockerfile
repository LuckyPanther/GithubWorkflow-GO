# Étape de construction de l'image Go
FROM golang:1.23.1 AS gobuild

# Définir le GOPATH et le répertoire de travail
ENV GOPATH=/workspace/go
WORKDIR /workspace

# Copier uniquement les fichiers sources
COPY . .

# Initialiser les modules Go et installer les dépendances
RUN go mod init cowsay && \
    go mod tidy

# Compiler le projet Go en désactivant VCS (a creuser pour mieux comprendre)
RUN go build -o app .

# Commande par défaut pour exécuter l'application
CMD ["./app"]

