clear all
close all

m=8;

for i=1:m
    ms(i)=2^(5+i);
    A{i}=rand(ms(i),ms(i));
    MA{i}=A{i}.*A{i};
end

