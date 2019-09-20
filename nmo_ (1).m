%% calculate each cmp from the cell
clear dx dt x;
clear newcmpgth;
NX=299;
for i=1:NX
    num_=size(cmpgth{i});
    num(i)=num_(2);
    clear num_;
end

dx=15;%%
dt=0.004;

clear newcmpgth;
newcmpgth=cell(1,NX);
for i=1:NX
    newcmpgth{i}=zeros(size(cmpgth{i}));
end

for i=1:NX
    for j=1:num(i)
        x=dx*(j-0.5*(num(i)+1));
        %disp(x);
        for nt=1:501
            delta_t=x^2/(2*vrms(nt,i)^2*nt*dt);
            %%nt
            %aa=ceil(delta_t/dt)
           % if ((nt+floor(delta_t/dt))>501)
            %    delta_t=0;
            %end
            %if floor(delta_t/dt) ~= 0
             %   floor(delta_t/dt)
             %   nt
           % end
           % newcmpgth{i}(nt,j)=cmpgth{i}((nt+floor(delta_t/dt)),j);
           if ((nt+delta_t/dt)<501)
                newcmpgth{i}(nt,j)=cmpgth{i}((nt+ceil(delta_t/dt)),j);
            else
                newcmpgth{i}(nt,j)=cmpgth{i}(nt,j);
            end
        end
        clear x;
    end
end
figure(1);
imagesc(cmpgth{149});
title('No.75 cmp gather before nmo');
figure(2);
imagesc(newcmpgth{149});
title('No.75 cmp gather after nmo');