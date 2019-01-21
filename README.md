## About project

# What is
* It`s a simple blog that contains user, posts and post_comments
* Regular user is able to:
  - login and logout.
  - Create, update, show and delete own Posts.
  - Reads posts from users that he follows
  - Create and Read comments on his own posts or from users that he follows
  - Follow or unfollow a user.
  - List all users
* Admin user is able to:
  - Do everything

# Access:
* POST URL: /api/login
* Format:
{
  "auth": {
    "email": "email"
    "password": "pass"
  }
}

* Admin:
  - username: `admin@admin.com.br`
  - password: 123456
* Regular user:
  - username: `regular@regular.com.br`
  - password: 123456

* A jwt token will be returned, use it on request header:
  - `Authorization: Bearer token-here`

# Architecture
* All endpoints responses are sanitized to follow https://jsonapi.org/ specification.
* Stateless with JWT authentication.
  - Token lifetime was set to 1 day.
* Using cancan to ACL with CASL integration (Permissions sharing between UI and API.)
* Using rspec fully configured to test both integration and unit.
  - Run `rspec` on terminal to execute available tests.
* Using concerns to share code between project.
* Native active record model validations to avoid writing methods. (do not reinvent the wheel)
* Using rails i18n to centralize string messages.
* Using Postgres as sql database.
* Project configured to run on docker-compose creating linked containers to database and application scalable.
  - Run `docker-compose up --build` to execute project without needing to have any dependencies installed on machine.
  - All rails tasks will be executed after env being built, so no needed to execute commands after compose up.
* Using routes constraints to avoid writing code to validate params.
* Soft delete on sensitive models to avoid FK restrictions.
* Using OpenBSD bcrypt() password hashing algorithm.