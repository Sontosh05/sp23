clear all
close all

readM=fopen('allTerms.txt','r');
maxv=0;
stepcount=0;
M=zeros(9075,9075);
while(~feof(readM))
    step=fgetl(readM);
    tes=split(step,{'(', ',', ')'});
    stepcount=stepcount+1;
    row=str2num(tes{2});
    column=str2num(tes{3});
    maxv=max(row, column);
end

n=maxv+1;
M=zeros(n,n);
fclose(readM);

readM=fopen('allTerms.txt','r');
readMout=fopen('outputMatrix.mtx','w');

fprintf(readMout,'MatrixMarket matrix array real general\n')
fprintf(readMout, '%d, %d, %d\n',round(n), round(n), round(stepcount))
while(~feof(readM))
    step=fgetl(readM);
    tes=split(step,{'(', ',', ')'});
    stepcount=stepcount+1;
    row=str2num(tes{2});
    column=str2num(tes{3});
    value=str2num(tes{4});
    M(row+1, column+1)=value;
end
fclose(readM);
spy(M);
saveas(gcf,'sparsemat.pdf')