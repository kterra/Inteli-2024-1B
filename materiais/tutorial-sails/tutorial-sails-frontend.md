# O que precisamos saber para iniciar nosso FrontEnd no Sails.js?

## Compreendendo a Estrutura do Projeto
Um projeto típico do Sails.js inclui os seguintes diretórios e arquivos principais:

- `api/`: Contém a lógica de backend da sua aplicação.
    - `controllers/`: Lida com requisições e respostas.
    - `models/`: Define a estrutura de dados e as interações com o banco de dados.
    - `policies/`: Contém a lógica de autorização.
    - `services/`: Mantém a lógica de negócios reutilizável.
- `assets/`: Contém arquivos estáticos como JavaScript, CSS e imagens.
- `config/`: Inclui arquivos de configuração para rotas, políticas, conexões de banco de dados, etc.
- `views/`: Mantém seus modelos de visualização (se estiver usando renderização do lado do servidor).

## Usando as Visualizações Incorporadas do Sails.js
O Sails.js pode renderizar visualizações do lado do servidor usando o modelo EJS.

- `views/`: Crie seus modelos HTML no diretório `views/`.
- `assets/`:  Coloque seu CSS, JavaScript e imagens no diretório `assets/`.

Por exemplo, você pode criar uma visualização `home.ejs` no diretório `views/`:

```html
<!-- views/home.ejs -->
<!DOCTYPE html>
<html>
<head>
    <title>My Sails.js App</title>
    <link rel="stylesheet" href="/styles/style.css">
</head>
<body>
    <h1>Welcome to Sails.js!</h1>
    <script src="/js/app.js"></script>
</body>
</html>
```
## O layout.ejs
No Sails.js, o `layout.ejs` é um arquivo especial usado para definir a estrutura de layout que envolve suas visualizações. Ele atua como um modelo que fornece uma estrutura consistente para todas as suas páginas HTML.

Aqui está uma análise do propósito e funcionalidade do `layout.ejs`:

### Definição de Layout Centralizada:
O `layout.ejs` permite que você defina a estrutura de layout comum (como cabeçalho, rodapé, navegação) que deve estar presente em várias páginas do seu site ou aplicativo da web. Isso ajuda a manter a consistência no design e na experiência do usuário.

### Inserção de Conteúdo Dinâmico:
Dentro do `layout.ejs`, você pode definir espaços reservados onde o conteúdo das visualizações individuais será inserido dinamicamente. Esses espaços reservados são geralmente indicados por tags EJS `<%- body %>` ou `<%- yield %>`. Quando uma visualização é renderizada, seu conteúdo substitui esses espaços reservados no layout.

### Exemplo:
Aqui está um exemplo simples de um arquivo `layout.ejs`:

```ejs
<!-- views/layout.ejs -->
<!DOCTYPE html>
<html>
<head>
    <title><%= title %></title>
    <link rel="stylesheet" href="/styles/style.css">
</head>
<body>
    <header>
        <h1>My Website</h1>
        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/about">About</a></li>
                <li><a href="/contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <%- body %> <!-- Placeholder for dynamic content -->
    </main>

    <footer>
        &copy; 2024 My Website
    </footer>
</body>
</html>
```

Agora, queremos criar novas views usando o layout ejs, home.ejs e about.ejs:
```ejs
<!-- views/home.ejs -->
<%- include('layout', { title: 'Home' }) %> <!-- Include the layout and set the title -->
<div class="content">
    <h2>Welcome to our website!</h2>
    <p>This is the home page content.</p>
</div>
```

```ejs
<!-- views/about.ejs -->
<%- include('layout', { title: 'About' }) %> <!-- Include the layout and set the title -->
<div class="content">
    <h2>About Us</h2>
    <p>This is the about page content.</p>
</div>
```
Nesta estrutura de layout:

- O espaço reservado `<%- body %>` dentro da tag `<main>` é onde o conteúdo de cada visualização será inserido dinamicamente.
- O `<%= title %>` dentro da tag `<title>` garante que o título de cada página seja definido dinamicamente com base no título fornecido na visualização.
- O cabeçalho contém o título do site e links de navegação.
- O rodapé inclui informações de direitos autorais ou qualquer outro conteúdo relevante.
Com essa estrutura de layout, o conteúdo das visualizações `home.ejs` e `about.ejs` substituirá o espaço reservado `<%- body %>` no layout, fornecendo uma estrutura consistente em todas as páginas do seu site ou aplicativo da web.
