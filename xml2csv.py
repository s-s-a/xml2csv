# -*- coding=windows-1251
# noinspection PyCompatibility
import csv
import os
from xml.dom.minidom import parse

aFiles:list = [x for x in os.listdir() if x.endswith("z.xml")]

for xFile in aFiles:
    with open(xFile[0:8] + '.csv', 'w', encoding='cp1251', errors='replace', newline='') as csvfile:
        csv_file = csv.writer(csvfile, delimiter=';')
        DOMTree = parse(xFile)
        count:int = 0
        for sotr in DOMTree.getElementsByTagName('���������'):
            count += 1
            # print (sotr)
            LC = FM = IM = OT = SS = ''
            LC = sotr.getElementsByTagName('�����������').item(0).firstChild.nodeValue
            FM = sotr.getElementsByTagName('�������').item(0).firstChild.nodeValue
            IM = sotr.getElementsByTagName('���').item(0).firstChild.nodeValue
            try:
                OT = sotr.getElementsByTagName('��������').item(0).firstChild.nodeValue
            except AttributeError:
                pass #  ���������� ������ ��������� � �����������
            #  replace'��� ������� ����������� ��������� "������������������"
            SS = sotr.getElementsByTagName('�����').item(0).firstChild.nodeValue.replace('\t', '').replace('\n', '')
            if len(SS) == 0:
                SS = sotr.getElementsByTagName('�����').item(1).firstChild.nodeValue
            print(LC, FM, IM, OT, SS)
            csv_file.writerow([LC, FM, IM, OT, SS])

    print(f'������� � ����� {xFile}: {count}')
