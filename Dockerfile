#SO y Python
FROM python:3.12-slim

#Crear una carpeta de trabajo
WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

#Importar proyecto a la carpeta
COPY . /app

#Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

#Exponer el puerto
EXPOSE 5000

#Ejecutar el proyecto
CMD ["python", "app.py"]