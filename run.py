# -*- coding: utf-8 -*-

from app import app
# app.run(debug = True)
app.run(port=12200, threaded=True)
