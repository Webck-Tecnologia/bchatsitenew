# Use uma imagem base oficial do Node.js
FROM docker.io/node:lts-hydrogen

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie todos os arquivos do projeto para o diretório de trabalho
COPY . .

# Construa o aplicativo Next.js para produção
RUN npm run build

# Exponha a porta em que a aplicação será executada
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
