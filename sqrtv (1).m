
%%iv interval velocity
dx=5;
%% v stacking velocity
ivv=load('velModel.mat');
iv=ivv.vel_true;
vrms=iv*0;
vrms(1,:)=iv(1,:);
%% 时深转换
it=0*iv;
h=meshgrid(1:1:251,1:1:448)';
dz=5;%%%%%
for j=1:448
    for k=2:251
        it(k,j)=2*(h(k,j)-h(k-1,j))*dz/iv(k-1,j);
    end
end
t=cumsum(it,1);

%% 插值 interpolate
dt=0.004;
nt=501;
t_axis=0:dt:dt*(nt-1);
tv=zeros(nt,448);
for j=1:448
    tv(:,j)=interp1(t(1:251,j),iv(1:251,j),t_axis,'pchip');
end
%%need smooth
    


%% RMS velocity vrms
for nx=1:448
    
    for tt=1:nt
        sum=0;
        for k=1:tt
            sum=sum+tv(k,nx)^2*dt;
        end
            sumt=dt*(tt);
            vrms(tt,nx)=sqrt(sum/sumt);
        
    end
end

%% interp
x=0:dx:447*dx;
x_axis=0:dx*447/298:dx*447;
Vrms=zeros(nt,299);
for t=1:501
    Vrms(t,:)=interp1(0:dx:447*dx,vrms(t,1:448),x_axis,'pchip');
end
%%need smooth

figure(1);
imagesc(Vrms);
xlabel('ns');
ylabel('time');

title('VRMS');

