__author__ = 'Andreas Kring <andreas@magenta.dk>'

from flask import jsonify, request, abort
from oms import app
from db_model import *
from sqlalchemy import exc
import uuid

@app.route('/deleteOrder', methods = ['DELETE'])
def delete_order():
    order_id = request.args.get('orderId')
    print order_id
    order_items = BelongsTo.select(BelongsTo.c.orderId == order_id).execute().fetchall()
    try:
        Orders.delete().where(Orders.c.orderId == order_id).execute()
        for item in order_items:
            OrderItems.delete().where(OrderItems.c.refCode == item['refCode']).execute()
        return jsonify({'status': 'ok'})
    except exc.SQLAlchemyError as e:
        return jsonify({'status': 'error',
                        'message': e.message})
    

@app.route('/getOrders', methods = ['GET'])
def get_orders():
    try:
        # order_id = request.args.get('orderId')
        status = request.args.get('status')
        not_status = request.args.get('notStatus')
        print not_status
        assignee = request.args.get('assignee')
        uid = request.args.get('uid')
        
        # Further filtering should be done from the front-end
        if status:
            orders = Orders.select(Orders.c.orderStatus == status).execute().fetchall()
        elif not_status:
            orders = Orders.select(Orders.c.orderStatus != not_status).execute().fetchall()
        elif assignee:
            orders = Responsible.select(Responsible.c.uid == assignee).execute().fetchall()
        elif uid:
            orders = OrderedBy.select(OrderedBy.c.uid == uid).execute().fetchall()
        else:
            orders = Orders.select().execute().fetchall()
        order_ids = [order['orderId'] for order in orders]
        return jsonify({'orders': order_ids})
    except exc.SQLAlchemyError as e:
        return jsonify({'status': 'error',
                        'message': e.message})


@app.route('/getOrderData', methods = ['GET'])
def get_order_data():
    order_id = request.args.get('orderId')
    try:
        order = Orders.select(Orders.c.orderId == order_id).execute().first()
        ordered_by = OrderedBy.select(OrderedBy.c.orderId == order_id).execute().first()
        responsible = Responsible.select(Responsible.c.uid == order_id).execute().first()
        belongs_to = BelongsTo.select(BelongsTo.c.orderId == order_id).execute().fetchall()
        
        order_dict = dict(zip(order.keys(), order.values()))
        sql_table_to_dict(belongs_to)
        order_dict['endUserId'] = ordered_by['uid']
        if responsible:
            order_dict['assignee'] = responsible['uid']
        else:
            order_dict['assignee'] = 'none'
        
        order_dict['itemRefCodes'] = [b['refCode'] for b in belongs_to] 
        
        return jsonify(order_dict)
    except exc.SQLAlchemyError as e:
        return jsonify({'status': 'error',
                        'message': e.message})


@app.route('/newOrder', methods = ['POST'])
def new_order():
    if not request.json:
        abort(400)

    order = request.json['order']
    user = order.pop('user', None)
    items = order.pop('items', None) 
    endUserOrderNote = order.pop('endUserOrderNote', None)
    
    try:
        # Check, if the user is aldready in the DB - and insert user if not
        insert_user(user)
    
        # Insert order itself    
        order['orderId'] = uuid.uuid4().hex
        order['orderStatus'] = 'new'
        # order['orderId'] = 'fixedUUID'
        Orders.insert(order).execute()
        
        # Insert the order items
        for item in items:
            item['refCode'] = uuid.uuid4().hex
            OrderItems.insert(item).execute()
            BelongsTo.insert({'orderId': order['orderId'], 'refCode': item['refCode']}).execute()
            
        # Relations
        OrderedBy.insert({'orderId': order['orderId'], 'uid': user['uid'], 'endUserOrderNote': endUserOrderNote}).execute()
                
        return jsonify({'status': 'ok',
                        'orderId': order['orderId']})
         
    except exc.SQLAlchemyError as e:
        return jsonify({'status': 'error',
                        'message': e.message})


@app.route('/test', methods = ['GET'])
def test():
    return jsonify({'foo': 'bar'})

       
@app.route('/updateOrder', methods = ['PUT'])
def update_order():
    if not request.json:
        abort(400)
    order = request.json
    try:
        for key in order:
            print key
            if key in Orders.c.keys() and key != 'orderId':
                Orders.update().where(Orders.c.orderId == order['orderId']).values({key: order[key]}).execute()
            if key == 'endUserOrderNote':
                OrderedBy.update().where(OrderedBy.c.orderId == order['orderId']).values({key: order[key]}).execute()
            if key in Responsible.c.keys() and key != 'orderId':
                Responsible.update().where(OrderedBy.c.orderId == order['orderId']).values({key: order[key]}).execute()
    
        return jsonify({'status': 'ok'})

    except exc.SQLAlchemyError as e:
        return jsonify({'status': 'error',
                        'message': e.message})
        
