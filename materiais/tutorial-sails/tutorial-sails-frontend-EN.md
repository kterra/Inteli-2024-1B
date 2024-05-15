# What do we need to know to start our FrontEnd in Sails.js?

## Understanding the Project Structure
A typical Sails.js project includes the following key directories and files:

- api/: Contains your application's backend logic.
    - controllers/: Handles requests and responses.
    - models/: Defines data structure and interactions with the database.
    - policies/: Contains authorization logic.
    - services/: Holds reusable business logic.
- assets/: Contains static files like JavaScript, CSS, and images.
- config/: Includes configuration files for routes, policies, database connections, etc.
- views/: Holds your view templates (if you are using server-side rendering).


## Using Sails.js Built-in Views
Sails.js can render server-side views using EJS templating.

- Views: Create your HTML templates in the views/ directory.
- Assets: Place your CSS, JavaScript, and images in the assets/ directory.

For example, you can create a view home.ejs in the views/ directory:
```
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

## The layout.ejs
In Sails.js, layout.ejs is a special file used for defining the layout structure that wraps around your views. It acts as a template that provides a consistent structure for all your HTML pages.

Here's a breakdown of the purpose and functionality of layout.ejs:

### Centralized Layout Definition:
layout.ejs allows you to define the common layout structure (such as header, footer, navigation) that should be present across multiple pages of your website or web application. This helps in maintaining consistency in the design and user experience.

### Dynamic Content Insertion:
Within layout.ejs, you can define placeholders where the content of individual views will be inserted dynamically. These placeholders are typically denoted by EJS tags <%- body %> or <%- yield %>. When a view is rendered, its content replaces these placeholders in the layout.

### Example:
Here's a simple example of a layout.ejs file:
```
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

Now, we want to create to views using the layout ejs, `home.ejs` and  `about.ejs`: 
```
<!-- views/home.ejs -->
<%- include('layout', { title: 'Home' }) %> <!-- Include the layout and set the title -->
<div class="content">
    <h2>Welcome to our website!</h2>
    <p>This is the home page content.</p>
</div>
```

```
<!-- views/about.ejs -->
<%- include('layout', { title: 'About' }) %> <!-- Include the layout and set the title -->
<div class="content">
    <h2>About Us</h2>
    <p>This is the about page content.</p>
</div>
```

In this layout structure:

The <%- body %> placeholder within the <main> tag is where the content of each view will be dynamically inserted.
The <%= title %> within the <title> tag ensures that the title of each page is dynamically set based on the title provided in the view.
The header contains the website's title and navigation links.
The footer includes copyright information or any other relevant content.
With this layout structure, the content from the home.ejs and about.ejs views will replace the <%- body %> placeholder in the layout, providing a consistent structure across all pages of your website or web application.