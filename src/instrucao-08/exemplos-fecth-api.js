
const userId = 1; // Substitua pelo ID real do usuário

fetch(`/user/${userId}`)
  .then(response => {
    if (!response.ok) {
      throw new Error('Erro ao obter informações do usuário!');
    }
    return response.json();
  })
  .then(user => {
    console.log('Informações do usuário:', user);
  })
  .catch(error => {
    console.error('Erro:', error);
  });






