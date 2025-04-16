# Usa una imagen base ligera con Python 3.9
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos necesarios
COPY requirements.txt .
COPY app.py .
COPY static ./static
COPY templates ./templates

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Variables de entorno (se sobrescriben en Render)
ENV FLASK_APP=app.py
ENV FLASK_ENV=production
ENV DATABASE_URL="postgresql://darkness:03tppNTXMmrzFDFriBfPGpaQ99VDrTYr@dpg-cvmpkk6mcj7s73bqum8g-a.oregon-postgres.render.com/test_ww0l"  


EXPOSE 10000

# Comando de inicio
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "app:app"]