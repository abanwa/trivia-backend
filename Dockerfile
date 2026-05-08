FROM --platform=linux/amd64 node:20

EXPOSE 3000
WORKDIR /app
COPY package.json package-lock.json ./ 
RUN npm install
COPY . . 
#we will add this if we are using AWS DocumentDB for our mongodb database which will download the certificate global-bundle.pem for us
RUN wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

ENTRYPOINT npm run start