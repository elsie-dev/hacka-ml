## Creating RESTful Endpoint for Backend
Creating Backend Api and securing API

## Requirements
- Python and Pip Installed
- Docker Installed

``` pip install Flask ```

## Running the API
To issue requests to the API
```
# get expenses
curl http://localhost:5000/expenses

# add a new expense
curl -X POST -H "Content-Type: application/json" -d '{
    "amount": 20,
    "description": "lottery ticket"
}' http://localhost:5000/expenses

# get incomes
curl http://localhost:5000/incomes

# add a new income
curl -X POST -H "Content-Type: application/json" -d '{
    "amount": 300.0,
    "description": "loan payment"
}' http://localhost:5000/incomes
```