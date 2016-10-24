begin mrbayes;
set autoclose=yes nowarn=yes;
execute primates.nex;
lset nst=6 rates=gamma;
mcmc nruns=1 ngen=10000 samplefreq=10 file=primates.nex1;
mcmc file=primates.nex2;
mcmc file=primates.nex3;
end;
