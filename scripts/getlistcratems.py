from dosql import *
import cgi
import json

def index(req):
    a = doSql()
    items = a.execqry("select * from getlist();", False)
    result = []
    for its in items:
        stringed = map(str, its)
        result.append(stringed)
    return json.dumps(result)
