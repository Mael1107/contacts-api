# Contacts API

REST API for a simple contact manager, built with **Ruby on Rails (API mode)** and **PostgreSQL**. It is consumed by the [contacts-web](https://github.com/Mael1107/contacts-web) front-end.

The controller was written by hand (no scaffold) to practice every layer: migration, model, routes and controller.

## Tech stack

- Ruby 3.4
- Rails 8.1 (`--api`)
- PostgreSQL
- rack-cors

## Data model

`Contact`

| Field      | Type    | Rules                          |
|------------|---------|--------------------------------|
| `name`     | string  | required                       |
| `phone`    | string  | required                       |
| `email`    | string  | optional, must be a valid email |
| `notes`    | text    | optional                       |
| `favorite` | boolean | default `false`                |

Validations live in the model (`presence` on name and phone, `URI::MailTo::EMAIL_REGEXP` on email with `allow_blank`), and `null: false` constraints live in the database.

## Endpoints

Base path: `/api/v1`

| Method       | Path             | Action                       | Success status |
|--------------|------------------|------------------------------|----------------|
| GET          | `/contacts`      | List (favorites first, then by name) | 200 |
| GET          | `/contacts/:id`  | Show one contact             | 200            |
| POST         | `/contacts`      | Create                       | 201            |
| PATCH / PUT  | `/contacts/:id`  | Update                       | 200            |
| DELETE       | `/contacts/:id`  | Delete                       | 204            |

Error responses:

- **422 Unprocessable Entity**: validation errors
- **404 Not Found**: contact does not exist (handled with `rescue_from ActiveRecord::RecordNotFound`)

Request body for create/update (required by strong params):

```json
{
  "contact": {
    "name": "Ana Souza",
    "phone": "85988887777",
    "email": "ana@email.com",
    "notes": "Met at the conference"
  }
}
```

## Getting started

Requirements: Ruby 3.4 and PostgreSQL running.

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/rails s -p 3001
```

The API runs on port **3001** (port 3000 is used by the front-end). CORS is configured to allow `http://localhost:3000`.

Quick test:

```bash
curl http://localhost:3001/api/v1/contacts
```

## Next steps

- Search with `ILIKE` and sorting with an allow-list of columns
- Authentication with JWT
- Tests
- Deploy (Render)