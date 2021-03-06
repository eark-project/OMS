from oms import db_model
from sqlalchemy import join
from sqlalchemy.sql import or_, and_

Person = db_model.Person
EndUser = db_model.EndUser
Archivist = db_model.Archivist
Orders = db_model.Orders
OrderItems = db_model.OrderItems

# Relationships - see E/R diagram
OrderedBy = db_model.OrderedBy
Responsible = db_model.Responsible
BelongsTo = db_model.BelongsTo

# q = join(Person, EndUser, EndUser.c.userName).select()
# Person.select('sds').execute()
# Orders.join(OrderedBy).select().where(Orders.c.orderId == OrderedBy.c.orderId and OrderedBy.userName == 'userName1').execute().fetchall()
q = Orders.select(and_(Orders.c.orderStatus != 'new', Orders.c.orderStatus != 'open', Orders.c.orderStatus != 'closed')).execute().fetchall()