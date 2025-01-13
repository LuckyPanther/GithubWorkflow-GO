# Étape 1 : Utiliser une image officielle Go
FROM golang:1.20

# Définir le répertoire de travail dans le conteneur
WORKDIR /workspace

# Copier uniquement les fichiers de configuration nécessaires
COPY go.mod go.sum ./

# Télécharger les dépendances
RUN go mod tidy

# Copier tout le code source dans le conteneur
COPY . .

# Compiler l'application et placer le binaire dans /usr/local/bin
RUN go build -v -o /usr/local/bin/app ./...

# Définir la commande par défaut pour démarrer le conteneur
CMD ["/usr/local/bin/app"]
