# Usa uma imagem base oficial do Python (mais leve que a completa)
FROM python:3.11-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências e instala as dependências
# O 'pip install --no-cache-dir' e o 'slim' sao boas praticas de seguranca e tamanho
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do codigo para o diretorio de trabalho
# 'app.py' e a pasta 'tests/'
COPY . .

# Expõe a porta que o Flask vai usar
EXPOSE 5000

# Define o comando que sera executado quando o container iniciar
# Atenção usamos Gunicorn (ou outro WSGI) para producao, nao o 'app.run()' nativo do Flask
CMD ["python", "app.py"] 
# Nota: Para producao real, voce instalaria Gunicorn (ou uvicorn/waitress) e o usaria aqui.
