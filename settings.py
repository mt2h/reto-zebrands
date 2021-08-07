SCHEMA = {
    'item_title': 'Product data ',
    'schema': {
        'sku': dict(type='string', required=True),
        'name': dict(type='string', required=True),
        'brand': dict(type='string', required=True),
        'model': dict(type='string', required=True),
        'price': dict(type='number', required=True),
        'description': dict(type='string', required=True),
        }
    }

DOMAIN = {
    'product': SCHEMA
    }

SETTINGS = {
    'DOMAIN': DOMAIN,
    #'MONGO_HOST': 'localhost',
    #'MONGO_PORT': 27017,
    #'MONGO_DBNAME': 'zebrands',
    'RESOURCE_METHODS': ['GET', 'POST', 'DELETE'], #CRUD
    'PAGINATION': False, #enable pagination whitout limit
    'DEBUG': True, #enable debbing in log API
    'XML': False, #change XML to JSON format
}
