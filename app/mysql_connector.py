import MySQLdb

class MySQLConnector(object):
        
    def __init__(self, properties):
        self.host = properties['db.connection.host']
        self.name = properties['db.connection.name']
        self.user = properties['db.connection.user']
        self.password = properties['db.connection.password']
        self.port = properties['db.connection.port']
        
    def insert(self, table, values):
        connection = MySQLdb.connect(host = self.host, db = self.name, user = self.user, passwd = self.password)

        cursor = connection.cursor()
        values_str = '(' + len(values)*'%s, ' + ')'
        cursor.execute('INSERT INTO ' + table + ' VALUES ' + values_str, values)
        connection.commit()

        connection.close()
    
# con = MySQLConnector()