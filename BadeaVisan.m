P=40;
f=1/P;
t=-2*P:0.05:2*P;
D=0.15;%am ales duty 0.15=6/40 pentru ca suntem echipa 6
N=50;
w=2*pi*f;%pulsatie
xi=sawtooth(w*t,D);%semnal initial
functie0=@(t)sawtooth(w*t,D);
cc=1/P*integral(functie0,0,P);%componenta continua
Ck=ones(1,N);%vector de coeficienti SFC
Ak=ones(1,N);%vector de coeficienti amplitudine
xr=0;%semnal refacut
functie=@(t,k)sawtooth(2*pi*f*t,D).*exp(-1j*k*w*t);%functie cu 2 parametri pentru a putea apela in for
for (k=-24:1:25)
   Ck(k+25)=1/P*integral(@(t)functie(t,k),0,P);%calcul coeficienti
   Ak(k+26)=2*abs(Ck(k+25));%calcul amplitudine
   xr=xr+Ck(k+25)*exp(t*w*1j*k);%calcul semnal refacut
end
figure(1);
plot(t,xr,t,xi);
figure(3);
Ak(1)=cc;%componenta continua pe grafic
stem([0:N],Ak);
