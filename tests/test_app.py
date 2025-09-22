import pytest
from app import app

@pytest.fixture
def client():
    # Configura o cliente de teste do Flask
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_homepage(client):
    """Testa se a rota '/' retorna a mensagem correta e status 200."""
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello, DevOps World! A aplicacao esta funcionando e está UP." in response.data
