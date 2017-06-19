

Data1 = load('bit_sequence.mat');
DataField1 = fieldnames(Data1);
dlmwrite('bit_sequence.txt', (Data1.(DataField1{1})'));

Data2 = load('Q_out.mat');
DataField2 = fieldnames(Data2);
dlmwrite('Q_out.txt', (Data2.(DataField2{1})'));

Data3 = load('modu_out_I.mat');
DataField3 = fieldnames(Data3);
dlmwrite('modu_out_I.txt', (Data3.(DataField3{1})'));

Data4 = load('modu_out_Q.mat');
DataField4 = fieldnames(Data4);
dlmwrite('modu_out_Q.txt', (Data4.(DataField4{1})'));

Data5 = load('Q_in.mat');
DataField5 = fieldnames(Data5);
dlmwrite('Q_in.txt', (Data5.(DataField5{1})'));

Data6 = load('I_in.mat');
DataField6 = fieldnames(Data6);
dlmwrite('I_in.txt', (Data6.(DataField6{1})'));

Data7 = load('I_out.mat');
DataField7 = fieldnames(Data7);
dlmwrite('I_out.txt', (Data7.(DataField7{1})'));

Data8 = load('phi_out.mat');
DataField8 = fieldnames(Data8);
dlmwrite('phi_out.txt', (Data8.(DataField8{1})'));