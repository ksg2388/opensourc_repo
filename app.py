#!/usr/bin/python3
#-*- coding: utf-8 -*-

import argparse
import subprocess
import re
import requests
from bs4 import BeautifulSoup
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/crawling', methods=['POST'])
def crawling():
    if request.method == 'POST':
        url = request.form['url']
        if url == "https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States":
            res = requests.get(url)
            soup = BeautifulSoup(res.content, "html.parser")
            tb = soup.find('table', class_='wikitable')
            namelist = []

            for link in tb.find_all('b'):
                name = link.find('a')
                if name != None:
                    namelist.append(name.get_text('title'))
                    print(name.get_text('title'))
#            print("namelist : ", namelist)
            return render_template("hw08_1.html", list = namelist)

        elif url == "https://finance.naver.com/sise/":

            res = requests.get(url)
            soup = BeautifulSoup(res.content, "html.parser")
            price = soup.find('span', id = 'KOSPI_now')
            change = soup.find('span', id = 'KOSPI_change')

            changelist = change.text.split()
            changelist[1] = changelist[1][:-2]

            mylist = []

            mylist.append(price.text)
            mylist.extend(changelist)

#            print(mylist)
#            print(price.text)
#            print(change.text)

            return render_template("hw08_2.html", list = mylist)

        return "잘못된 주소입니다."

@app.route('/', methods=['GET'])
def test():
    return render_template('crawlinghome.html')
