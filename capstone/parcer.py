def get_ID(line,start):

    i = start
    str_id = ""
    while (line[i] != '@'):
        str_id += line[i]
        i += 1

    return str_id

def get_Name (line):
    name = ""
    i = 7
    while (line[i]!='/'):
        name += line[i]
        i+=1
    i+=1
    while (line[i]!='/'):
        name += line[i]
        i+=1
    return name

def get_Sex(line):
    if (line[6]=='M'):
        return 1
    elif (line[6] == 'F'):
        return 2
    else:
        return 0;

def get_Element(array,element,index):

    if (array[index]['id'] != element):
        return get_Element(array,element,index+1)
    if (index == (len(array)/len(array) -1 )):
        return index
    return index

def main():
    fout  = open('generated1.pl','w')
    fin = open('my_tree.geb','r')
    persons = []
    person = {}
    childs = []
    men = -1
    woman = -1
    for line in fin:
        if (line[0] == '0' and line[3] == 'I'):  # до 27 пропуск
            person['id'] = get_ID(line,4)
            break;

    for line in fin:

        if(line[0] == '0'):
            if(line[3] == 'I'):
                person['id'] = get_ID(line,4)
            else :
                break;

        elif (line[0] == '1'):
            if (line[2:6] == 'NAME'):
                person['name'] = get_Name(line)
            elif (line[2:5] == 'SEX'):
                sex = get_Sex(line)
                if (sex == 1):
                    person['sex'] = 1
                elif (sex  == 2):
                    person['sex'] = 2
                persons.append(person)
                person = {}

    for line in fin:

        if (line[0] == '1'):
            if (line[2:6] == 'HUSB'):
                men = get_ID(line, 9)
            elif (line[2:6] == 'WIFE'):
                woman = get_ID(line, 9)
            elif (line[2:6] == 'CHIL'):
                childs.append(get_ID(line, 9))
        elif (line[0] == '0'):

            for i in range(len(childs)):
                if(woman!=-1):
                    index = get_Element(persons, woman,0)
                    index_child = get_Element(persons,childs[i],0)
                    fout.write('mother("{}","{}").\n'.format(persons[index]['name'],persons[index_child]['name']))
                if (men!=-1):
                    index = get_Element(persons, men,0)
                    index_child = get_Element(persons,childs[i],0)
                    fout.write('father("{}","{}").\n'.format(persons[index]['name'],persons[index_child]['name']))

            men = -1
            woman = -1

    for person in persons:
        if (person['sex']== 1):
            fout.write('male("{}").\n'.format(person['name']))
        elif (person['sex'] ==2):
            fout.write('female("{}").\n'.format(person['name']))

    fout.close()
    fin.close()




if __name__ == '__main__':
    main()
