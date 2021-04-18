y = input('Enter the name of y variable\n');
indp = input('Enter the name of x variable\n');

x=[ones([length(indp),1]),indp];
reg=x\y;

yfit = indp * reg(2) + reg(1);


SSE=0;
SST=0;
for i=1:1:length(indp)
    SSE=SSE+(y(i)-yfit(i))^2;
    SST=SST+(y(i)-mean(y))^2;
end
Rsqr=1-SSE/SST
plot(indp,y,indp,yfit);
legend("measured data","linear fit data")

dim = [.2 .5 .3 .3];
if reg(1)<0
    str=["y = "+num2str(reg(2))+" X "+num2str(reg(1));"R^2 = "+num2str(Rsqr)];
else
    str=["y = "+num2str(reg(2))+" X + "+num2str(reg(1));"R^2 = "+num2str(Rsqr)];
end
%str1="y = "+num2str(reg(2))+" * X + "+num2str(reg(1));
%str2="R^2 = "+num2str(Rsqr);
%str=[str1;str2];
annotation('textbox', dim, 'String',str,'FitBoxToText','on');
