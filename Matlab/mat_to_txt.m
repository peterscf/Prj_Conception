

Data1 = load('Iout.mat');
DataField1 = fieldnames(Data1);
dlmwrite('Iout.txt', (Data1.(DataField1{1})'));

Data2 = load('BitStream.mat');
DataField2 = fieldnames(Data2);
dlmwrite('BitStream.txt', (Data2.(DataField2{1})'));

Data3 = load('Qout.mat');
DataField3 = fieldnames(Data3);
dlmwrite('Qout.txt', (Data3.(DataField3{1})'));