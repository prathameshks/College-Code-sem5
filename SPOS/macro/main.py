
def pass1():
    code_file = open("code.txt", "r")
    code = code_file.readlines()
    mnt = []
    # mnt = [[macro name, mdt index],...]
    mdt = []
    #mdt = [[index,macro def,args],...]
    intermediate_code = []

    i = 0
    while i < len(code):
        if "macro" in code[i].lower():
            macro_name = code[i].split(" ")[0]
            macro_args = code[i].strip('\n').split(" ")[2:]
            macro_def = []
            i+=1
            while "mend" not in code[i].lower():
                macro_def.append(code[i].strip('\n'))
                i += 1
            mnt.append([macro_name, len(mdt)])
            mdt.append([len(mdt), macro_def, macro_args])
            i+=1
        else:
            if(code[i] != '\n'):
                intermediate_code.append(code[i].strip('\n'))
            i+=1
    code_file.close()
    return mnt, mdt, intermediate_code


def pass2():
    output = []
    for line in intermediate_code:
        for m_name, m_index in mnt:
            if m_name in line:
                mdt_index = m_index
                break
        else:
            output.append(line)
            continue
        macro_def = mdt[mdt_index][1]
        macro_args = mdt[mdt_index][2]
        params = line.strip('\n').split(" ")[1:]
        print('*',macro_args, params)
        for def_line in macro_def:
            for i in range(len(macro_args)):
                def_line = def_line.replace(' '+macro_args[i]+' ',' '+ params[i]+' ')
            output.append(def_line)
    return output

mnt,mdt,intermediate_code = pass1()
output = pass2()

# display mnt in tabular form
print("MNT")
print("Macro name\tMDT index")
for macro_name, mdt_index in mnt:
    print(macro_name, '\t\t', mdt_index)

# display mdt in tabular form
print("\nMDT")
print("Index\tMacro def\tMacro args")
for index, macro_def, macro_args in mdt:
    print(index, '\t', macro_def, '\t', macro_args)

# display intermediate code
print("\nIntermediate code")
for line in intermediate_code:
    print(line)
    
# write output to file
output_file = open("output.txt", "w")
for line in output:
    output_file.write(line+'\n')
output_file.close()

# display output
print("\nOutput")
for line in output:
    print(line)