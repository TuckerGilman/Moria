function moria_caller(seed) %collect simulation results

seednum = str2double(seed);
rng(seednum+10);

if seednum<4
    ph=0.0397;
    pf=0.0397;
    pt=0.0067;
    pm=0.006;
else
    ph=0.33;
    pf=0.407;
    pt=0.099;
    pm=0.017;
end

if rem(seednum,4)<2
    lr1=0.02;
    lr2=0.1;
    lrtol=0.0101;
else
    lr1=0.05;
    lr2=0.2;
    lrtol=0.0113;
end

if rem(seednum,2)>0
    lrtol=lrtol*2;
end


simdat=[];
ts_tot=[];
for i=1:100
    %i=i
    sdr=zeros(1,8);
    [sdr(1),sdr(2),sdr(3),sdr(4),sdr(5),sdr(6),sdr(7),sdr(8),ts]=moria_condor_sect4(ph,pf,pt,pm,lr1,lr2,lrtol);
    simdat=[simdat;sdr];
    if i==1
        ts_tot=ts;
    else
        ts_tot=cat(3,ts_tot,ts);
    end
end

outname=strcat('sect4_',seed,'_r10.mat');

save(outname,'simdat','ts_tot')



    