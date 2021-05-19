function [par, metaPar, txtPar] = pars_init_Nyctiphanes_australis(metaData)

%% Load parameter estimates from Parameterization_2_dark_compounds
filename = '/Users/Paulo/Documents/Otago University/Dynamic energy budget/Nyctiphanes_australis_compounds/Parametrization_1_control/results_Nyctiphanes_australis.mat';
res = load(filename);

par  = res.par;

free = res.par.free;
fnames = fieldnames(free);
for i = 1:length(fnames)
    eval(['free.',fnames{i}, '=0;'])
end

units = res.txtPar.units;

label = res.txtPar.label;

metaPar.model = 'std'; 

%% Arrhenius parametetrs
% par.T_A   = 7273;      free.T_A   = 1;   units.T_A   = 'K';        label.T_A   = 'Arrhenius temperature'; 
% par.T_L   = 280;       free.T_L   = 1;   units.T_L   = 'K';        label.T_L   = 'lower boundary tolerance range';
% par.T_H   = 294;       free.T_H   = 1;   units.T_H   = 'K';        label.T_H   = 'upper boundary tolerance range';
% par.T_AL  = 6.259e+02; free.T_AL  = 1;   units.T_AL  = 'K';        label.T_AL  = 'Arrh. temp for lower boundary';
% par.T_AH  = 4.765e+05; free.T_AH  = 1;   units.T_AH  = 'K';        label.T_AH  = 'Arrh. temp for upper boundary';

%% parameters for acceleration factor of UV light

par.mufa_UVH  = 0.0051; free.mufa_UVH = 1;  units.mufa_UVH = '-';  label.mufa_UVH = 'Coefficient of UV light at high dose for MUFA';
par.mufa_UVL  = 0.0041; free.mufa_UVL = 1;  units.mufa_UVL = '-';  label.mufa_UVL = 'Coefficient of UV light at low dose for MUFA';
par.mufa_PAR  = 0.0037; free.mufa_PAR = 1;  units.mufa_PAR = '-';  label.mufa_PAR = 'Coefficient of PAR light for MUFA';

par.pufa_UVH  = 0.0097; free.pufa_UVH = 1;  units.pufa_UVH = '-';  label.pufa_UVH = 'Coefficient of UV light at high dose for PUFA';
par.pufa_UVL  = 0.0085; free.pufa_UVL = 1;  units.pufa_UVL = '-';  label.pufa_UVL = 'Coefficient of UV light at low dose for PUFA';
par.pufa_PAR  = 0.0071; free.pufa_PAR = 1;  units.pufa_PAR = '-';  label.pufa_PAR = 'Coefficient of PAR light for PUFA';

par.safa_UVH  = 0.0044; free.safa_UVH = 1;  units.safa_UVH = '-';  label.safa_UVH = 'Coefficient of UV light at high dose for SAFA';
par.safa_UVL  = 0.0031; free.safa_UVL = 1;  units.safa_UVL = '-';  label.safa_UVL = 'Coefficient of UV light at low dose for SAFA';
par.safa_PAR  = 0.0041; free.safa_PAR = 1;  units.safa_PAR = '-';  label.safa_PAR = 'Coefficient of PAR light for SAFA';

par.ufa_UVH  = 0.0038; free.ufa_UVH = 1;  units.ufa_UVH = '-';  label.ufa_UVH = 'Coefficient of UV light at high dose for SAFA';
par.ufa_UVL  = 0.0021; free.ufa_UVL = 1;  units.ufa_UVL = '-';  label.ufa_UVL = 'Coefficient of UV light at low dose for SAFA';
par.ufa_PAR  = 0.0015; free.ufa_PAR = 1;  units.ufa_PAR = '-';  label.ufa_PAR = 'Coefficient of PAR light for SAFA';

par.eaa_UVH   = 0.0042; free.eaa_UVH  = 1;  units.eaa_UVH  = '-';  label.eaa_UVH  = 'Correction factor for high doses of UVR for EAA';
par.eaa_UVL   = 0.0022; free.eaa_UVL  = 1;  units.eaa_UVL  = '-';  label.eaa_UVL  = 'Correction factor for low doses of UVR for EAA';
par.eaa_PAR   = 0.0020; free.eaa_PAR  = 1;  units.eaa_PAR  = '-';  label.eaa_PAR  = 'Correction factor for PAR light for EAA';

par.neaa_UVH  = 0.031; free.neaa_UVH = 1;  units.neaa_UVH = '-';  label.neaa_UVH = 'Correction factor for high doses of UVR for NEAA';
par.neaa_UVL  = 0.028; free.neaa_UVL = 1;  units.neaa_UVL = '-';  label.neaa_UVL = 'Correction factor for low doses of UVR for NEAA';
par.neaa_PAR  = 0.021; free.neaa_PAR = 1;  units.neaa_PAR = '-';  label.neaa_PAR = 'Correction factor for PAR light for NEAA';

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
