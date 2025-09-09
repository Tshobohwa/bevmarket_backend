<img width="1839" height="1271" alt="bevmarket" src="https://github.com/user-attachments/assets/ae824a61-5025-4a8c-beb3-0d6f2dd1e9d3" />

# BevMarket

BevMarket is a Point of Sale (POS) system designed for wholesale sales of soft drinks and beers.  
It allows distributors to manage inventory, process transactions, and handle clients efficiently.  

## 🚀 Features
- Multi-tenant architecture for multiple distributors.
- Secure authentication (JWT).
- Inventory and transactions management.
- API built with **Ruby on Rails** and frontend in **React**.
- Optimized endpoints for high performance.

## 🛠️ Tech Stack
- Ruby on Rails (API backend)
- PostgreSQL (database)
- React (frontend)
- Docker (for containerization)

## ⚙️ Setup & Run

### Backend (Rails API)
```bash
# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Run server
rails s
