// Criar um novo usuário
//Usuario.create({ nome, email, senha }).fetch();
async function criarUsuario(name, email, password) {
  try {
    const novoUsuario = await Usuario.create({ name, email, password }).fetch();
    console.log("Novo usuário criado:", novoUsuario);
  } catch (err) {
    console.error("Erro ao criar usuário:", err);
  }
}

async function criarUsuarioPorId(id, name, email, password) {
    try {
      const novoUsuario = await Usuario.create({ id, name, email, password }).fetch();
      console.log("Novo usuário criado:", novoUsuario);
    } catch (err) {
      console.error("Erro ao criar usuário:", err);
    }
  }



// Encontrar todos os usuários
async function encontrarTodosUsuarios() {
  try {
    const usuarios = await Usuario.find();
    console.log("Todos os usuários:", usuarios);
  } catch (err) {
    console.error("Erro ao buscar usuários:", err);
  }
}

// Encontrar um usuário por ID
async function encontrarUsuarioPorId(id) {
  try {
    const usuario = await Usuario.findOne({ id });
    if (usuario) {
      console.log("Usuário encontrado:", usuario);
    } else {
      console.log("Usuário não encontrado");
    }
  } catch (err) {
    console.error("Erro ao buscar usuário:", err);
  }
}

// Atualizar um usuário por ID
async function atualizarUsuarioPorId(id, novosDados) {
  try {
    const usuarioAtualizado = await Usuario.updateOne({ id }).set(novosDados);
    if (usuarioAtualizado) {
      console.log("Usuário atualizado:", usuarioAtualizado);
    } else {
      console.log("Usuário não encontrado");
    }
  } catch (err) {
    console.error("Erro ao atualizar usuário:", err);
  }
}

// Deletar um usuário por ID
async function deletarUsuarioPorId(id) {
  try {
    const usuarioDeletado = await Usuario.destroyOne({ id });
    if (usuarioDeletado) {
      console.log("Usuário deletado:", usuarioDeletado);
    } else {
      console.log("Usuário não encontrado");
    }
  } catch (err) {
    console.error("Erro ao deletar usuário:", err);
  }
}

// Use as funções conforme necessário
// Exemplo de uso:
criarUsuario("Kizzy", "kizzy.terra@prof.inteli.edu.br", "senha123");
encontrarTodosUsuarios();
encontrarUsuarioPorId(5);
deletarUsuarioPorId(1);
