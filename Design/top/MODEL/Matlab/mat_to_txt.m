

Data1 = load('i_bit_stream.mat');
DataField1 = fieldnames(Data1);
dlmwrite('bit_stream.txt', (Data1.(DataField1{1})'));

Data2 = load('i_Iif.mat');
DataField2 = fieldnames(Data2);
dlmwrite('Iif.txt', (Data2.(DataField2{1})'));

Data3 = load('o_modu_I.mat');
DataField3 = fieldnames(Data3);
dlmwrite('modu_I_out.txt', (Data3.(DataField3{1})'));

Data4 = load('o_modu_Q.mat');
DataField4 = fieldnames(Data4);
dlmwrite('mudo_Q_out.txt', (Data4.(DataField4{1})'));

Data5 = load('i_Qif.mat');
DataField5 = fieldnames(Data5);
dlmwrite('Qif.txt', (Data5.(DataField5{1})'));

Data6 = load('o_Ibb.mat');
DataField6 = fieldnames(Data6);
dlmwrite('Ibb.txt', (Data6.(DataField6{1})'));

Data7 = load('o_Qbb.mat');
DataField7 = fieldnames(Data7);
dlmwrite('Qbb.txt', (Data7.(DataField7{1})'));

Data8 = load('phi_out.mat');
DataField8 = fieldnames(Data8);
dlmwrite('Phi.txt', (Data8.(DataField8{1})'));