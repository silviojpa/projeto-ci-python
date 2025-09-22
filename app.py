from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    # Retorna uma mensagem simples
    return "Hello, DevOps World! A aplicacao esta funcionando e esta up."

if __name__ == '__main.0.0.0':
    # Usamos uma porta comum para exemplos locais
    app.run(host='0.0.0.0', port=5000)
