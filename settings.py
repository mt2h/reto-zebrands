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
    'RESOURCE_METHODS': ['GET', 'POST', 'DELETE'], #CRUD
    'PAGINATION': False, #enable pagination whitout limit
    'HATEOAS': True, #view data product schema when there aren't records 
    'DEBUG': True, #enable debbing in log API
    'XML': False, #change XML to JSON format
}
