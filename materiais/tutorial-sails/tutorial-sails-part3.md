# Tutorial de implementação de CRUD com Sails.js do Backend ao Frontend - Parte 3

Acesse os tutoriais anteriores:
1. [Parte 1 do tutorial](https://github.com/kterra/Inteli-2024-1B/tree/main/materiais/tutorial-sails/tutorial-sails-part1.md)
2. [Parte 2 do tutorial](https://github.com/kterra/Inteli-2024-1B/tree/main/materiais/tutorial-sails/tutorial-sails-part2.md)


Adicionando um novo model e relacionado models:

## Passo 1: Criar model `api/models/Grupo.js`
No terminal, utilize o comando `sails generate model grupo`.

## Passo 2: Adicionar os atributos no arquivo gerado `api/models/Grupo.js`


Este model representará a entidade Grupo com campos para color e tutor obrigatórios. 

O tutor deve ser uma chave estrangeira para a tabela de Usuario.

Edite o arquivo `Grupo.js` gerado em `api/models`:
```
/**
 * Grupo.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {
    color: {
      type: 'string',
      required: true
    },

    //Relacionamento com model Usuario
    id_tutor: {
      model: 'usuario',
      required: true,
    }
  },

};

```
Os desenhos Sails que estão em forma de comentários, você pode apagar.

## Passo 5: Adicione a referência na tabela `Usuario.js`
```
/**
 * Usuario.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */


module.exports = {

  attributes: {
    name: {
      type: 'string',
      required: true
    },
    email: {
      type: 'string',
      required: true,
      unique: true
    },
    password: {
      type: 'string',
      required: true
    }
  },

  //Associacao
  grupo: {
    collection: 'grupo',
    via: 'id_tutor'
  }

};
```

## Passo 6: Valide a funcionalidade do site
Utilize o comando `sails lift` no terminal para renderizar a versão atualizada do site.






