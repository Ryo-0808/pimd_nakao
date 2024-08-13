%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initialize_para.m
%軌道関数のパラメータ
%機構系パラメータ
%電気系パラメータ
%減速機パラメータ
%PID制御パラメータ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%軌道関数のパラメータ
delta=0.25;%Δ

%機構系パラメータ
l1 = 0.2;%リンク1の長さ[m]
w1 = 0.01;%リンク1の幅[m]
h1 = 0.004;%リンク1の高さ[m]
r1 = 0.1;%リンク1の端点から重心までの長さ[m]
ro = 2.69*1e-3*1e6;%リンク1の材料密度[Kg*m^(-3)]
m1 = l1*w1*h1*ro;%リンク1の質量[Kg]
Izzg1 = (1/12)*m1*(w1^2+l1^2);%リンク1の慣性モーメント zz[kg*m^2]
Ixxg1 = (1/12)*m1*(w1^2+h1^2);%リンク1の慣性モーメント xx[kg*m^2]
Iyyg1 = (1/12)*m1*(l1^2+h1^2);%リンク1の慣性モーメント yy[kg*m^2]
c1 = 0.001;%リンク1の粘性係数[N*s/rad]

%電気系パラメータ
Ra = 10;%電機子抵抗[Ω]
La = 4.4e-3;%電機子インダクタンス[H]
Kt = 0.05;%トルク定数[N*m/A]
Ke = Kt;%逆起電力定数[V*s/rad]
J = 1e-5;%電機子の慣性モーメント[kg*m^2]
Bm = 1e-6;% 電機子の粘性トルク係数[N*s/rad]

%減速機パラメータ
N = 100;%ギア比[-]
E = 0.7;%伝達効率[-]

%PID制御パラメータ
Kp =100;%比例ゲイン
Ti =0.1;%積分時間
Td =3;%微分時間
eta=0.1;%近似微分パラメータη
l1= 0.2; 

figure(1)
axis square

for ii=1:length(t)
    xt = l1 * cos(theta);
    yt = l1 * sin(theta);
    x1=[0 xt(ii)];
    y1=[0 yt(ii)];
    h1= line(x1,y1);
    if 0<=t(ii)&&t(ii)<=0.5
    set(h1,'color','r');
    set(h1,'lineWidth',2);
    end
    if 0.5<=t(ii)&&t(ii)<=2.0
    set(h1,'color','g');
    set(h1,'lineWidth',2);
    end
    if 2.0<=t(ii)&&t(ii)<=2.5
    set(h1,'color','b');
    set(h1,'lineWidth',2);
    end
end
for ii=1:length(t)-1
x2=[xt(ii) xt(ii+1)];
y2=[yt(ii) yt(ii+1)];
h2= line(x2,y2);
set(h2,'color','k');
set(h2,'lineWidth',1);
end
%x軸
h3=line([-0.3 0.3],[0 0]);
set(h3,'color','k');
set(h3,'lineWidth',1);
%y軸
h4=line([0 0],[-0.3 0.3]);
set(h4,'color','k');
set(h4,'lineWidth',1);
xlim([-0.3 0.3])
ylim([-0.3 0.3])
