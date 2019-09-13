#!/usr/bin/python3
# coding=windows-1251
from xml.dom.minidom import parse
import xml.dom.minidom
import os
import csv

aFiles = [x for x in os.listdir() if x.endswith("z.xml")]
print(aFiles)

# Open XML document using minidom parser
for xFile in aFiles:
  #print (xFile)
  with open(xFile[0:8]+'.csv', 'w', encoding='cp1251', errors='replace', newline='') as csvfile:
    csv_file = csv.writer(csvfile, delimiter=';')
    #print (csvfile.name)
    DOMTree = xml.dom.minidom.parse(xFile)
    #print (DOMTree.childNodes.item(0).childNodes.item(0).childNodes)
    for sotr in DOMTree.childNodes.item(0).childNodes.item(0).childNodes:
      #print (sotr)
      LC = FM = IM = OT = SS = ''
      for attr in sotr.childNodes:
        #print (attr)
        for xvalue in attr.childNodes:
          #print (str(xvalue))
          if attr.tagName in ['ЛицевойСчет','Фамилия','Имя','Отчество','Сумма']:
            if attr.tagName == 'ЛицевойСчет':
              LC = str(xvalue.nodeValue)
            if attr.tagName == 'Фамилия':
              FM = str(xvalue.nodeValue)
            if attr.tagName == 'Имя':
              IM = str(xvalue.nodeValue)
            if attr.tagName == 'Отчество':
              OT = str(xvalue.nodeValue)
            if attr.tagName == 'Сумма':
              SS = str(xvalue.nodeValue)
      csv_file.writerow([LC,FM,IM,OT, SS])
