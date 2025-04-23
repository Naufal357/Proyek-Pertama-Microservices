# Menggunakan base image Node.js 14
FROM node:14

# Membuat working directory di dalam container
WORKDIR /app

# Melakukan copy source code ke dalam container
COPY . .

# Menentukan environtment untuk production dan database
ENV NODE_ENV=production 
ENV DB_HOST=item-db

# Menginstall dependencies dan melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# mengekspos port yang digunakan oleh aplikasi
EXPOSE 8080

# Menjalankan server setelah container diluncurkan
CMD ["npm", "start"]