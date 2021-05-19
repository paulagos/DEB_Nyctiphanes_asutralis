function [par, metaPar, txtPar] = pars_init_Nyctiphanes_australis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;    free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A   = 7273;      free.T_A   = 0;   units.T_A   = 'K';        label.T_A   = 'Arrhenius temperature'; 
par.T_L   = 280;       free.T_L   = 0;   units.T_L   = 'K';        label.T_L   = 'lower boundary tolerance range';
par.T_H   = 294;       free.T_H   = 0;   units.T_H   = 'K';        label.T_H   = 'upper boundary tolerance range';
par.T_AL  = 6.259e+02; free.T_AL  = 0;   units.T_AL  = 'K';        label.T_AL  = 'Arrh. temp for lower boundary';
par.T_AH  = 4.765e+05; free.T_AH  = 0;   units.T_AH  = 'K';        label.T_AH  = 'Arrh. temp for upper boundary';
par.z     = 1.62525;   free.z     = 1;   units.z     = '-';        label.z     = 'zoom factor'; 
par.F_m   = 6.5;       free.F_m   = 0;   units.F_m   = 'l/d.cm^2'; label.F_m   = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;       free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;       free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v     = 0.024664;  free.v     = 1;   units.v = 'cm/d';         label.v     = 'energy conductance'; 
par.kap   = 0.80166;   free.kap   = 1;   units.kap = '-';          label.kap   = 'allocation fraction to soma'; 
par.kap_R = 0.95;      free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M   = 418;       free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M   = '[p_M], vol-spec somatic maint'; 
par.p_T   = 0;         free.p_T   = 1;   units.p_T = 'J/d.cm^2';   label.p_T   = '{p_T}, surf-spec somatic maint'; 
par.k_J   = 0.002;     free.k_J   = 0;   units.k_J = '1/d';        label.k_J   = 'maturity maint rate coefficient'; 
par.E_G   = 3846.78;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G   = '[E_G], spec cost for structure';  
par.E_Hb  = 20.42;     free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb  = 'maturity at birth';
par.E_Hp  = 6.501e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp  = 'maturity at puberty'; 
par.h_a   = 3.001e-07; free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a   = 'Weibull aging acceleration'; 
par.s_G   = 0.0001;    free.s_G   = 0;   units.s_G = '-';          label.s_G   = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.11519;    free.del_M = 1;   units.del_M = '-';    label.del_M    = 'shape coefficient'; 
par.del_Y = 0.2596;     free.del_Y = 1;   units.del_Y = '-';    label.del_Y    = 'shape coefficient for the egg';
par.S_f   = 40;         free.S_f   = 1;   units.S_f   = '-';    label.S_f      = 'Spawning frecuency';
par.f     = 1;          free.f     = 1;   units.f =     '-';    label.f        = 'scaled functional response for 0-var data'; 
par.f_tL1 = 0.70016;    free.f_tL1 = 1;   units.f_tL1 = '-';    label.f_tL1    = 'scaled functional response for tL_1 data'; 
par.f_tL2 = 0.43988;    free.f_tL2 = 1;   units.f_tL2 = '-';    label.f_tL2    = 'scaled functional response for tL_2 data'; 
par.f_tL3 = 0.34042;    free.f_tL3 = 1;   units.f_tL3 = '-';    label.f_tL3    = 'scaled functional response for tL_3 data';
%% parameters for acceleration factor of UV light
par.UV_L    = 2.153;   free.UV_L   = 1;  units.UV_L    = '-';   label.UV_L     = 'Coefficient of UV light at low dose  for respiration';
par.UV_H    = 2.642;   free.UV_H   = 1;  units.UV_H    = '-';   label.UV_H     = 'Coefficient of UV light at high dose for respiration';
par.PAR_L   = 1.589;   free.PAR_L  = 1;  units.PAR_L   = '-';   label.PAR_L    = 'Coefficient of PAR light at low dose for respiration';
par.PAR_H   = 1.804;   free.PAR_H  = 1;  units.PAR_H   = '-';   label.PAR_H    = 'Coefficient of PAR light at high dose for respiration';

%% parameters for reduction of FA and AA with time (Linear respose)
par.MC0_MUFA = 9.090193e-06; free.MC0_MUFA = 0;  units.MC0_MUFA = 'mol/g DW';  label.MC0_MUFA = 'Initial amount of MUFA';
par.JCM_MUFA = 1.431e-05;    free.JCM_MUFA = 1;  units.JCM_MUFA = 'mol/d';     label.JCM_MUFA = 'rate of decrease of MUFA in reserve reserve';

par.MC0_PUFA = 1.669525e-05; free.MC0_PUFA = 0;  units.MC0_PUFA = 'mol/g DW';  label.MC0_PUFA = 'Initial amount of PUFA';
par.JCM_PUFA = 3.682e-05;    free.JCM_PUFA = 1;  units.JCM_PUFA = 'mol/d';     label.JCM_PUFA = 'rate of decrease of PUFA in reserve reserve';

par.MC0_SAFA = 5.955717e-06; free.MC0_SAFA = 0;  units.MC0_SAFA = 'mol/g DW';  label.MC0_SAFA = 'Initial amount of SAFA';
par.JCM_SAFA = 1.478e-06;    free.JCM_SAFA = 1;  units.JCM_SAFA = 'mol/d';     label.JCM_SAFA = 'density of SAFA in reserve and structure';

par.MC0_UFA = 6.29169e-06;   free.MC0_UFA = 0;  units.MC0_UFA = 'mol/g DW';  label.MC0_UFA = 'Initial amount of SAFA';
par.JCM_UFA = 1.478e-06;     free.JCM_UFA = 1;  units.JCM_UFA = 'mol/d';     label.JCM_UFA = 'density of SAFA in reserve and structure';

par.MC0_EAA  = 8.07417E-06;  free.MC0_EAA = 0;  units.MC0_EAA   = 'mol/g DW';   label.MC0_EAA = 'Initial amount of EAA';
par.JCM_EAA  = 1.478e-06;    free.JCM_EAA = 1;  units.JCM_EAA   = 'mol/d';      label.JCM_EAA = 'density of EAA in reserve and structure';

par.MC0_NEAA = 3.8157e-06;   free.MC0_NEAA = 0; units.MC0_NEAA  = 'mol/g DW';   label.MC0_NEAA = 'Initial amount of NEAA';
par.JCM_NEAA = 1.723e-06;    free.JCM_NEAA = 1; units.JCM_NEAA  = 'mol/d';      label.JCM_NEAA = 'density of NEAA in reserve and structure';

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
