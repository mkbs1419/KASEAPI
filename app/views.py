# -*- coding: utf-8 -*-
# File: views.py 2018-01-04
# DB: localhost MariaDB / demov3
# 1. website
# 2. API
from flask import render_template, request, abort, jsonify, redirect
from app import app
import pymysql
from datetime import date, datetime
import random
import json
from bson import json_util


def ele_val():  #1
    a = datetime.now()
    b = datetime(a.year, a.month, a.day, 0, 0, 0)
    return int((round((a - b).total_seconds(), 2)))+random.randint(0,10)


def out_temp():  #2
    return round(random.uniform(10, 16), 1)


def in_temp():  #3
    return round(random.uniform(20, 26), 1)


def env_tem():  #4
    return round(random.uniform(26, 28), 1)


def ahu_co2():  #5
    return random.randint(400, 1000)


def ahu_pre():  #6
    return random.randint(760, 1200)


def ahu_two():  #7
    return random.randint(0, 100)


def ahu_inv():  #8
    return random.randint(0, 100)


def ahu_air():  #9
    return random.randint(0, 100)


def ahu_sta():  #10
    return random.random() < 0.9


def ahu_loa():  #11
    return random.random() < 0.1


def ahu_smo():  #12
    return random.random() < 0.1


def ahu_fpr():  #13
    return random.randint(0, 1000)


def light():  #14
    return random.random() < 0.8


def wind_s():  #15
    return random.random() < 0.8


def wind_l():  #16
    return random.random() < 0.8


def door():  #17
    return random.random() < 0.1


def emc():  #18
    return random.random() < 0.05


def smoke_s():  #19
    return random.random() < 0.05


def smoke_l():  #20
    return random.random() < 0.05


def switch(random_type):
    return {
        'ele_val': ele_val(),
        'out_temp': out_temp(),
        'in_temp': in_temp(),
        'env_tem': env_tem(),
        'ahu_co2': ahu_co2(),
        'ahu_pre': ahu_pre(),
        'ahu_two': ahu_two(),
        'ahu_inv': ahu_inv(),
        'ahu_air': ahu_air(),
        'ahu_sta': ahu_sta(),
        'ahu_loa': ahu_loa(),
        'ahu_smo': ahu_smo(),
        'ahu_fpr': ahu_fpr(),
        'light': light(),
        'wind_s': wind_s(),
        'wind_l': wind_l(),
        'door': door(),
        'emc': emc(),
        'smoke_s': smoke_s(),
        'smoke_l': smoke_l()
    }.get(random_type, None)    # None is default if random_type not found


#####################


def get_conn(dbname):
    conn = pymysql.connect(
        host='localhost',
        user='jerry',
        passwd='jerry',
        db=dbname,
        use_unicode=True,
        charset='utf8')
    cursor = conn.cursor()
    return conn, cursor


'''sql worker'''


def execute_sql(cursor):
    columns = [column[0] for column in cursor.description]
    results = []
    for row in cursor.fetchall():
        results.append(dict(zip(columns, row)))
    return results


'''update output table'''


def update_dataV2(data_list):
    conn, cursor = get_conn('kase')
    cursor.execute("SET NAMES utf8")
    list_counts = len(data_list)
    sql = "INSERT INTO `demov3` (`_id`, `time_stamp`, `description`, `type`, `value`, `tag`) VALUES "

    # for data table
    for i in range(list_counts):
        sql2 = "INSERT INTO `tag_data` (`description`, `type`, `value`, `tag`) VALUES "
        sql_data2 = "( \"" + data_list[i]['description'] + "\", \"" + data_list[i]['type'] + "\", \"" + data_list[i]['value'] + "\", \"" + data_list[i]['tag'] + "\") ON DUPLICATE KEY UPDATE `description`= \"" + data_list[i]['description'] + "\", `type`= \"" + data_list[i]['type'] + "\", `value`= \"" + data_list[i]['value'] + "\""
        sql2 = sql2 + sql_data2
        cursor.execute(sql2)

    # for storage table
    for i in range(list_counts):

        sql_data = "(NULL, CURRENT_TIMESTAMP, \"" + data_list[i]['description'] + "\", \"" + data_list[i]['type'] + "\", \"" + data_list[i]['value'] + "\", \"" + data_list[i]['tag'] + "\"),"
        sql = sql + sql_data

    sql = sql[:-1]

    cursor.execute(sql)
    conn.commit()
    cursor.close()
    conn.close()
    return list_counts


'''clean history table'''


def clean_data():
    print 'clean_data function'
    conn, cursor = get_conn('kase')
    cursor.execute("Truncate table `demov3`")
    conn.commit()
    cursor.close()
    conn.close()


'''for viewer website'''


def get_data():  # from tag_data
    results = []
    conn, cursor = get_conn('kase')
    cursor.execute(
        "SELECT tag, description, type, value, time_stamp FROM `tag_data` ORDER BY tag ASC"
    )
    results = execute_sql(cursor)
    cursor.close()
    conn.close()
    return results

def get_data_old():  # old version
    results = []
    conn, cursor = get_conn('kase')
    cursor.execute(
        "SELECT * FROM `demov3` ORDER BY `_id` DESC LIMIT 57"
    )
    results = execute_sql(cursor)
    cursor.close()
    conn.close()
    return results


# Website ####
# index
@app.route('/')
@app.route('/index')
def index():
    print 'Website index'
    results = get_data_old()
    return render_template("index.html", JSON_data=results)


# Website ####
# index
@app.route('/index2')
def index2():
    print 'Website index'
    results = get_data()
    return render_template("index2.html", JSON_data=results)


# Clean DB
@app.route("/clean/", methods=['POST'])
def clean():
    clean_data()
    return redirect("/", code=302)


# Templates Page
@app.route('/<string:page_name>/')
def render_static(page_name):
    return render_template('%s.html' % page_name)


# API ####
@app.route('/s', methods=['GET'])
def api_s():
    return '<h1>API is runnung OK</h1>'


@app.route('/send', methods=['POST'])
def api_send():
    if not request.json:
        print "Require json format, abort."
        abort(400)

    data_list = request.json['status']
    counts = update_dataV2(data_list)
    data_log = {'count': counts, 'response': 'OK'}
    print 'Got ' + str(counts) + ' datas.'
    return jsonify(data_log), 201


@app.route('/data', methods=['GET'])  # status
def api_get():
    print 'api_get function'
    conn, cursor = get_conn('kase')
    cursor.execute(
        "SELECT tag, description, type, value, time_stamp FROM `tag_data`")

    r = [
        dict((cursor.description[i][0], value) for i, value in enumerate(row))
        for row in cursor.fetchall()
    ]

    return jsonify({'count': len(r), 'status': r})


'''update output table with random value'''


@app.route('/data_random', methods=['GET'])  # status
def api_get_random():
    print 'api_get_random function'
    conn, cursor = get_conn('kase')
    cursor.execute("SELECT tag, description, type, value, time_stamp, random_type FROM `tag_data_random`")

    r = [
        dict((cursor.description[i][0], value) for i, value in enumerate(row))
        for row in cursor.fetchall()
    ]

    for i in range(len(r)):
        value = switch(r[i]['random_type'])
        r[i]['value'] = value
        r[i].pop('random_type', None)

    return jsonify({'count': len(r), 'status': r})