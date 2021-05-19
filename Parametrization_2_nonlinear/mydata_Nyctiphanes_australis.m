function [data, auxData, metaData, txtData, weights] = mydata_Nyctiphanes_australis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca';                                          
metaData.order      = 'Euphausiacea'; 
metaData.family     = 'Euphausiidae';
metaData.species    = 'Nyctiphanes_australis'; 
metaData.species_en = 'NZ krill'; 
metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab';'ap'; 'am'; 'Lb';'Lp'; 'Li'; 'Wd0'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L_f';'L-Wd'; 'L-Ww'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Paulo F. Lagos'};    
metaData.date_subm = [2019 04 08];              
metaData.email    = {'lagpa454@student.otago.ac.nz'};            
metaData.address  = {'University of Otago'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 12]; 


%
%% Load parameter estimates from Parameterization_2_dark_compounds
filename = '/Users/Paulo/Documents/Otago University/Dynamic energy budget/Nyctiphanes_australis_compounds/Parametrization_1_control/results_Nyctiphanes_australis.mat';
res = load(filename);

% Get temp correction factors
TC_8   = tempcorr(C2K(8), res.par.T_ref, res.par.T_A);
TC_12  = tempcorr(C2K(12), res.par.T_ref, res.par.T_A);
TC_13  = tempcorr(C2K(13), res.par.T_ref, res.par.T_A);
TC_16  = tempcorr(C2K(16), res.par.T_ref, res.par.T_A);
TC_19  = tempcorr(C2K(19), res.par.T_ref, res.par.T_A);

%
%% Time - FA cncentration
% (MUFA's low and high UV)
% 8 deg C
data.tMUFA_8UVL = [... Time  C-mol MUFA; 8 deg C Low UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_8 % predicted amount at 24h
    1.16   3.79506E-06 % 4H low 
    1.33   2.57134E-06 % 8H low 
    ];
units.tMUFA_8UVL = {'days', 'c-mol/g DW'}; label.tMUFA_8UVL = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_8UVL = C2K(8);  units.temp.tMUFA_8UVL = 'K'; label.temp.tMUFA_8UVL = 'temperature';
bibkey.tMUFA_8UVL = 'Lagos2016';
comment.tMUFA_8UVL = 'Low UV treatment';

data.tMUFA_12UVL = [... Time  C-mol MUFA; 12 deg C Low UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_12 % predicted amount at 24h
    1.16   2.64046E-06  % 4H low  
    1.33   2.60894E-06  % 8H low 
    ];
units.tMUFA_12UVL = {'days', 'c-mol/g DW'}; label.tMUFA_12UVL = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_12UVL = C2K(12);  units.temp.tMUFA_12UVL = 'K'; label.temp.tMUFA_12UVL = 'temperature';
bibkey.tMUFA_12UVL = 'Lagos2016';
comment.tMUFA_12UVL = 'Low UV treatment';

data.tMUFA_13UVL = [... Time  C-mol MUFA; 13 deg C Low UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_13 % predicted amount at 24h
    1.16   2.89226E-06 % 4H low  
    1.33   2.83515E-06 % 8H low   
    ];
units.tMUFA_13UVL = {'days', 'c-mol/g DW'}; label.tMUFA_13UVL = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_13UVL = C2K(13);  units.temp.tMUFA_13UVL = 'K'; label.temp.tMUFA_13UVL = 'temperature';
bibkey.tMUFA_13UVL = 'Lagos2016';
comment.tMUFA_13UVL = 'Low UV treatment';

data.tMUFA_16UVL = [... Time  C-mol MUFA; 16 deg C Low UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_16 % predicted amount at 24h
    1.16   2.21504E-06 % 4H low   
    1.33   2.06274E-06 % 8H low  
    ];
units.tMUFA_16UVL = {'days', 'c-mol/g DW'}; label.tMUFA_16UVL = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_16UVL = C2K(16);  units.temp.tMUFA_16UVL = 'K'; label.temp.tMUFA_16UVL = 'temperature';
bibkey.tMUFA_16UVL = 'Lagos2016';
comment.tMUFA_16UVL = 'Low UV treatment';

data.tMUFA_19UVL = [... Time  C-mol MUFA; 19 deg C Low UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_19 % predicted amount at 24h
    1.16   2.93412E-07 % 4H low  
    1.33   2.29521E-07 % 8H low  
    ];
units.tMUFA_19UVL = {'days', 'c-mol/g DW'}; label.tMUFA_19UVL = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_19UVL = C2K(19);  units.temp.tMUFA_19UVL = 'K'; label.temp.tMUFA_19UVL = 'temperature';
bibkey.tMUFA_19UVL = 'Lagos2016';
comment.tMUFA_19UVL = 'Low UV treatment';
%
data.tMUFA_8UVH = [... Time  C-mol MUFA; 8 deg C High UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_8 % predicted amount at 24h
    1.16   5.17397E-07 % 4H high 
    1.33   2.87652E-07 % 8H high
    ];
units.tMUFA_8UVH = {'days', 'c-mol/g DW'}; label.tMUFA_8UVH = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_8UVH = C2K(8);  units.temp.tMUFA_8UVH = 'K'; label.temp.tMUFA_8UVH = 'temperature';
bibkey.tMUFA_8UVH = 'Lagos2016';
comment.tMUFA_8UVH = 'High UV treatment';

% 12 deg C
data.tMUFA_12UVH = [... Time  C-mol MUFA; 12 deg C High UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_12 % predicted amount at 24h
    1.16   3.56028E-06 % 4H high 
    1.33   2.53328E-06 % 8H high  
    ];
units.tMUFA_12UVH = {'days', 'c-mol/g DW'}; label.tMUFA_12UVH = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_12UVH = C2K(12);  units.temp.tMUFA_12UVH = 'K'; label.temp.tMUFA_12UVH = 'temperature';
bibkey.tMUFA_12UVH = 'Lagos2016';
comment.tMUFA_12UVH = 'High UV treatment';

data.tMUFA_13UVH = [... Time  C-mol MUFA; 13 deg C High UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_13 % predicted amount at 24h
    1.16   6.04327E-06 % 4H high
    1.33   3.67539E-06 % 8H high
    ];
units.tMUFA_13UVH = {'days', 'c-mol/g DW'}; label.tMUFA_13UVH = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_13UVH = C2K(13);  units.temp.tMUFA_13UVH = 'K'; label.temp.tMUFA_13UVH = 'temperature';
bibkey.tMUFA_13UVH = 'Lagos2016';
comment.tMUFA_13UVH = 'High UV treatment';

data.tMUFA_16UVH = [... Time  C-mol MUFA; 16 deg C High UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_16 % predicted amount at 24h
    1.16   2.21504E-06 % 4H high 
    1.33   1.91045E-06 % 8H high 
    ];
units.tMUFA_16UVH = {'days', 'c-mol/g DW'}; label.tMUFA_16UVH= {'Time', 'FA and AA concentrations'};  
temp.tMUFA_16UVH = C2K(16);  units.temp.tMUFA_16UVH = 'K'; label.temp.tMUFA_16UVH = 'temperature';
bibkey.tMUFA_16UVH = 'Lagos2016';
comment.tMUFA_16UVH = 'High UV treatment';

data.tMUFA_19UVH = [... Time  C-mol MUFA; 19 deg C High UV
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_19 % predicted amount at 24h
    1.16   2.16802E-07 % 4H high  
    1.33   9.50983E-08 % 8H high  
    ];
units.tMUFA_19UVH = {'days', 'c-mol/g DW'}; label.tMUFA_19UVH = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_19UVH = C2K(19);  units.temp.tMUFA_19UVH = 'K'; label.temp.tMUFA_19UVH = 'temperature';
bibkey.tMUFA_19UVH = 'Lagos2016';
comment.tMUFA_19UVH = 'High UV treatment';

% (PUFA's low and high UV)
data.tPUFA_8UVL = [... Time  C-mol MUFA; 8 deg C Low UV
    0.00    1.669525e-05 % wild
    1.00    res.par.MC0_PUFA-res.par.JCM_PUFA*TC_8 % predicted amount at 24h
    1.16    5.52937E-06 % 4H low 
    1.33    4.78257E-06 % 8H low 
    ];
units.tPUFA_8UVL = {'days', 'c-mol/g DW'}; label.tPUFA_8UVL = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_8UVL = C2K(8);  units.temp.tPUFA_8UVL = 'K'; label.temp.tPUFA_8UVL = 'temperature';
bibkey.tPUFA_8UVL = 'Lagos2016';
comment.tPUFA_8UVL = 'PUFA at LOW UV treatment';

data.tPUFA_12UVL = [... Time  C-mol MUFA; 12 deg C Low UV
    0.00   1.669525e-05 % wild
    1.00   res.par.MC0_PUFA-res.par.JCM_PUFA*TC_12 % predicted amount at 24h
    1.16   3.69690E-06 % 4H low  
    1.33   3.20668E-06 % 8H low 
    ];
units.tPUFA_12UVL = {'days', 'c-mol/g DW'}; label.tPUFA_12UVL = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_12UVL = C2K(12);  units.temp.tPUFA_12UVL = 'K'; label.temp.tPUFA_12UVL = 'temperature';
bibkey.tPUFA_12UVL = 'Lagos2016';
comment.tPUFA_12UVL = 'PUFA at LOW UV treatment';

data.tPUFA_13UVL = [... Time  C-mol MUFA; 13 deg C Low UV
    0.00   1.669525e-05 % wild
    1.00   res.par.MC0_PUFA-res.par.JCM_PUFA*TC_13 % predicted amount at 24h
    1.16   7.67153E-06 % 4H low 
    1.33   7.28872E-06 % 8H low
    ];
units.tPUFA_13UVL = {'days', 'c-mol/g DW'}; label.tPUFA_13UVL = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_13UVL = C2K(13);  units.temp.tPUFA_13UVL = 'K'; label.temp.tPUFA_13UVL = 'temperature';
bibkey.tPUFA_13UVL = 'Lagos2016';
comment.tPUFA_13UVL = 'PUFA at LOW UV treatment';

data.tPUFA_16UVL = [... Time  C-mol MUFA; 16 deg C Low UV
    0.00  1.669525e-05 % wild
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_16 % predicted amount at 24h
    1.16  5.95187E-06 % 4H low   
    1.33  5.34156E-06 % 8H low 
    ];
units.tPUFA_16UVL = {'days', 'c-mol/g DW'}; label.tPUFA_16UVL = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_16UVL = C2K(16);  units.temp.tPUFA_16UVL = 'K'; label.temp.tPUFA_16UVL = 'temperature';
bibkey.tPUFA_16UVL = 'Lagos2016';
comment.tPUFA_16UVL = 'PUFA at LOW UV treatment';

data.tPUFA_19UVL = [... Time  C-mol MUFA; 19 deg C Low UV
    0.00  1.669525e-05 % wild 
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_19 % predicted amount at 24h
    1.16  8.81981E-07 % 4H low   
    1.33  1.85614E-07 % 8H low  
    ];
units.tPUFA_19UVL = {'days', 'c-mol/g DW'}; label.tPUFA_19UVL = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_19UVL = C2K(19);  units.temp.tPUFA_19UVL = 'K'; label.temp.tPUFA_19UVL = 'temperature';
bibkey.tPUFA_19UVL = 'Lagos2016';
comment.tPUFA_19UVL = 'PUFA at LOW UV treatment';

% 8 deg C
data.tPUFA_8UVH = [... Time  C-mol PUFA; 8 deg C High UV
    0.00  1.669525e-05 % wild 
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_8 % predicted amount at 24h
    1.16  1.34383E-06 % 4H high 
    1.33  9.23846E-07 % 8H high 
    ];
units.tPUFA_8UVH = {'days', 'c-mol/g DW'}; label.tPUFA_8UVH = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_8UVH = C2K(8);  units.temp.tPUFA_8UVH = 'K'; label.temp.tPUFA_8UVH = 'temperature';
bibkey.tPUFA_8UVH = 'Lagos2016';
comment.tPUFA_8UVH = 'PUFA at HIGH UV treatment';

% 12 deg C
data.tPUFA_12UVH = [... Time  C-mol PUFA; 12 deg C High UV
    0.00  1.669525e-05 % wild 
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_12 % predicted amount at 24h
    1.16  5.18443E-06 % 4H high 
    1.33  3.52784E-06 % 8H high  
    ];
units.tPUFA_12UVH = {'days', 'c-mol/g DW'}; label.tPUFA_12UVH = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_12UVH = C2K(12);  units.temp.tPUFA_12UVH = 'K'; label.temp.tPUFA_12UVH = 'temperature';
bibkey.tPUFA_12UVH = 'Lagos2016';
comment.tPUFA_12UVH = 'PUFA at HIGH UV treatment';

data.tPUFA_13UVH = [... Time  C-mol PUFA; 13 deg C High UV
    0.00  1.669525e-05 % wild 
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_13 % predicted amount at 24h
    1.16  7.44600E-06 % 4H high 
    1.33  4.87825E-06 % 8H high 
    ];
units.tPUFA_13UVH = {'days', 'c-mol/g DW'}; label.tPUFA_13UVH = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_13UVH = C2K(13);  units.temp.tPUFA_13UVH = 'K'; label.temp.tPUFA_13UVH = 'temperature';
bibkey.tPUFA_13UVH = 'Lagos2016';
comment.tPUFA_13UVH = 'PUFA at HIGH UV treatment';

data.tPUFA_16UVH = [... Time  C-mol PUFA; 16 deg C High UV
    0.00   1.669525e-05 % wild
    1.00   res.par.MC0_PUFA-res.par.JCM_PUFA*TC_16 % predicted amount at 24h
    1.16   5.95187E-06 % 4H high 
    1.33   4.73124E-06 % 8H high 
    ];
units.tPUFA_16UVH = {'days', 'c-mol/g DW'}; label.tPUFA_16UVH = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_16UVH = C2K(16);  units.temp.tPUFA_16UVH = 'K'; label.temp.tPUFA_16UVH = 'temperature';
bibkey.tPUFA_16UVH = 'Lagos2016';
comment.tPUFA_16UVH = 'PUFA at HIGH UV treatment';

data.tPUFA_19UVH = [... Time  C-mol PUFA; 19 deg C High UV
    0.00   1.669525e-05 % wild
    1.00   res.par.MC0_PUFA-res.par.JCM_PUFA*TC_19 % predicted amount at 24h
    1.16   1.02906E-06 % 4H high  
    1.33   3.36276E-07 % 8H high  
    ];
units.tPUFA_19UVH = {'days', 'c-mol/g DW'}; label.tPUFA_19UVH = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_19UVH = C2K(19);  units.temp.tPUFA_19UVH = 'K'; label.temp.tPUFA_19UVH = 'temperature';
bibkey.tPUFA_19UVH = 'Lagos2016';
comment.tPUFA_19UVH = 'PUFA at HIGH UV';
%
% (SAFA's low and high UV)
% 8 deg C
data.tSAFA_8UVL = [... Time  C-mol SAFA; 8 deg C Low UV
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_8 % predicted amount at 24h
    1.16  5.70854E-07 % 4H low  
    1.33  5.31848E-07 % 8H low   
    ];
units.tSAFA_8UVL   = {'days', 'c-mol/g DW'}; label.tSAFA_8UVL = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_8UVL    = C2K(8);  units.temp.tSAFA_8UVL = 'K'; label.temp.tSAFA_8UVL = 'temperature';
bibkey.tSAFA_8UVL  = 'Lagos2016';
comment.tSAFA_8UVL = 'SAFA at LOW UV';

data.tSAFA_12UVL = [... Time  C-mol SAFA; 12 deg C Low UV
    0.00  5.955717e-06 % wild 
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_12 % predicted amount at 24h
    1.16  6.31462E-08 % 4H low  
    1.33  3.13255E-07 % 8H low 
    ];
units.tSAFA_12UVL   = {'days', 'c-mol/g DW'}; label.tSAFA_12UVL = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_12UVL    = C2K(12);  units.temp.tSAFA_12UVL = 'K'; label.temp.tSAFA_12UVL = 'temperature';
bibkey.tSAFA_12UVL  = 'Lagos2016';
comment.tSAFA_12UVL = 'SAFA at LOW UV';

data.tSAFA_13UVL = [... Time  C-mol SAFA; 13 deg C Low UV
    0.00  5.955717e-06 % wild 
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_13 % predicted amount at 24h
    1.16  1.26585E-06 % 4H low  
    1.33  1.32260E-06 % 8H low  
    ];
units.tSAFA_13UVL   = {'days', 'c-mol/g DW'}; label.tSAFA_13UVL = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_13UVL    = C2K(13);  units.temp.tSAFA_13UVL = 'K'; label.temp.tSAFA_13UVL = 'temperature';
bibkey.tSAFA_13UVL  = 'Lagos2016';
comment.tSAFA_13UVL = 'SAFA at LOW UV';


data.tSAFA_16UVL = [... Time  C-mol SAFA; 16 deg C Low UV
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_16 % predicted amount at 24h
    1.16  3.02731E-07 % 4H low    
    1.33  2.23939E-07 % 8H low
    ];
units.tSAFA_16UVL = {'days', 'c-mol/g DW'}; label.tSAFA_16UVL = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_16UVL = C2K(16);  units.temp.tSAFA_16UVL = 'K'; label.temp.tSAFA_16UVL = 'temperature';
bibkey.tSAFA_16UVL = 'Lagos2016';
comment.tSAFA_16UVL = 'SAFA at LOW UV';

data.tSAFA_19UVL = [... Time  C-mol SAFA; 19 deg C Low UV
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_19 % predicted amount at 24h
    1.16  1.32202E-08 % 4H low   
    1.33  1.51074E-08 % 8H low
    ];
units.tSAFA_19UVL = {'days', 'c-mol/g DW'}; label.tSAFA_19UVL = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_19UVL = C2K(19);  units.temp.tSAFA_19UVL = 'K'; label.temp.tSAFA_19UVL = 'temperature';
bibkey.tSAFA_19UVL = 'Lagos2016';
comment.tSAFA_19UVL = 'SAFA at LOW UV';


% 8 deg C
data.tSAFA_8UVH = [... Time  C-mol SAFA; 8 deg C High UV
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_8 % predicted amount at 24h
    1.16  6.70745E-08 % 4H high
    1.33  2.61268E-08 % 8H high 
    ];
units.tSAFA_8UVH   = {'days', 'c-mol/g DW'}; label.tSAFA_8UVH = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_8UVH    = C2K(8);  units.temp.tSAFA_8UVH = 'K'; label.temp.tSAFA_8UVH = 'temperature';
bibkey.tSAFA_8UVH  = 'Lagos2016';
comment.tSAFA_8UVH = 'SAFA at HIGH UV';

% 12 deg C
data.tSAFA_12UVH = [... Time  C-mol SAFA; 12 deg C High UV
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_12 % predicted amount at 24h
    1.16  1.01832E-07 % 4H high
    1.33  2.74954E-07 % 8H high 
    ];
units.tSAFA_12UVH   = {'days', 'c-mol/g DW'}; label.tSAFA_12UVH = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_12UVH    = C2K(12);  units.temp.tSAFA_12UVH = 'K'; label.temp.tSAFA_12UVH = 'temperature';
bibkey.tSAFA_12UVH  = 'Lagos2016';
comment.tSAFA_12UVH = 'SAFA at HIGH UV';

data.tSAFA_13UVH = [... Time  C-mol SAFA; 13 deg C High UV
    0.00  5.955717e-06 % wild 
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_13 % predicted amount at 24h
    1.16  1.15161E-06 % 4H high 
    1.33  7.84129E-07 % 8H high
    ];
units.tSAFA_13UVH   = {'days', 'c-mol/g DW'}; label.tSAFA_13UVH = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_13UVH    = C2K(13);  units.temp.tSAFA_13UVH = 'K'; label.temp.tSAFA_13UVH = 'temperature';
bibkey.tSAFA_13UVH  = 'Lagos2016';
comment.tSAFA_13UVH = 'SAFA at HIGH UV';

data.tSAFA_16UVH = [... Time  C-mol SAFA; 16 deg C High UV
    0.00  5.955717e-06 % wild 
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_16 % predicted amount at 24h
    1.16  3.02731E-07 % 4H high 
    1.33  1.45146E-07 % 8H high  
    ];
units.tSAFA_16UVH   = {'days', 'c-mol/g DW'}; label.tSAFA_16UVH = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_16UVH    = C2K(16);  units.temp.tSAFA_16UVH = 'K'; label.temp.tSAFA_16UVH = 'temperature';
bibkey.tSAFA_16UVH  = 'Lagos2016';
comment.tSAFA_16UVH = 'SAFA at HIGH UV';

data.tSAFA_19UVH = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  5.955717e-06 % wild 
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_19 % predicted amount at 24h
    1.16  1.25689E-08 % 4H high   
    1.33  1.07086E-08 % 8H high    
    ];
units.tSAFA_19UVH   = {'days', 'c-mol/g DW'}; label.tSAFA_19UVH = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_19UVH    = C2K(19);  units.temp.tSAFA_19UVH = 'K'; label.temp.tSAFA_19UVH = 'temperature';
bibkey.tSAFA_19UVH  = 'Lagos2016';
comment.tSAFA_19UVH = 'SAFA at HIGH UV';
%
data.tUFA_8UVL = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_8 % predicted amount at 24h
    1.16  8.54882E-07 % 4H high   
    1.33  6.16728E-07 % 8H high    
    ];
units.tUFA_8UVL   = {'days', 'c-mol/g DW'}; label.tUFA_8UVL = {'Time', 'FA and AA concentrations'};  
temp.tUFA_8UVL    = C2K(8);  units.temp.tUFA_8UVL = 'K'; label.temp.tUFA_8UVL = 'temperature';
bibkey.tUFA_8UVL  = 'Lagos2016';
comment.tUFA_8UVL = 'UFA at low UV';
%
data.tUFA_12UVL = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_12 % predicted amount at 24h
    1.16  1.09773E-07 % 4H high   
    1.33  9.74991E-08 % 8H high    
    ];
units.tUFA_12UVL   = {'days', 'c-mol/g DW'}; label.tUFA_12UVL = {'Time', 'FA and AA concentrations'};  
temp.tUFA_12UVL    = C2K(12);  units.temp.tUFA_12UVL = 'K'; label.temp.tUFA_12UVL = 'temperature';
bibkey.tUFA_12UVL  = 'Lagos2016';
comment.tUFA_12UVL = 'UFA at low UV';

data.tUFA_13UVL = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_13 % predicted amount at 24h
    1.16  7.13976E-07 % 4H high   
    1.33  7.53633E-07 % 8H high    
    ];
units.tUFA_13UVL   = {'days', 'c-mol/g DW'}; label.tUFA_13UVL = {'Time', 'FA and AA concentrations'};  
temp.tUFA_13UVL    = C2K(13);  units.temp.tUFA_13UVL = 'K'; label.temp.tUFA_13UVL = 'temperature';
bibkey.tUFA_13UVL  = 'Lagos2016';
comment.tUFA_13UVL = 'UFA at low UV';
%
data.tUFA_16UVL = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_16 % predicted amount at 24h
    1.16  3.1831E-07 % 4H high   
    1.33  3.05008E-07 % 8H high    
    ];
units.tUFA_16UVL   = {'days', 'c-mol/g DW'}; label.tUFA_16UVL = {'Time', 'FA and AA concentrations'};  
temp.tUFA_16UVL    = C2K(16);  units.temp.tUFA_16UVL = 'K'; label.temp.tUFA_16UVL = 'temperature';
bibkey.tUFA_16UVL  = 'Lagos2016';
comment.tUFA_16UVL = 'UFA at low UV';
%
data.tUFA_19UVL = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_19 % predicted amount at 24h
    1.16  5.01103E-07 % 4H high   
    1.33  3.72962E-08 % 8H high    
    ];
units.tUFA_19UVL   = {'days', 'c-mol/g DW'}; label.tUFA_19UVL = {'Time', 'FA and AA concentrations'};  
temp.tUFA_19UVL    = C2K(19);  units.temp.tUFA_19UVL = 'K'; label.temp.tUFA_19UVL = 'temperature';
bibkey.tUFA_19UVL  = 'Lagos2016';
comment.tUFA_19UVL = 'UFA at low UV';
%
data.tUFA_8UVH = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_8 % predicted amount at 24h
    1.16  5.7527E-08 % 4H high   
    1.33  5.67735E-07 % 8H high    
    ];
units.tUFA_8UVH   = {'days', 'c-mol/g DW'}; label.tUFA_8UVH = {'Time', 'FA and AA concentrations'};  
temp.tUFA_8UVH    = C2K(8);  units.temp.tUFA_8UVH = 'K'; label.temp.tUFA_8UVH = 'temperature';
bibkey.tUFA_8UVH  = 'Lagos2016';
comment.tUFA_8UVH = 'UFA at low UV';
%
data.tUFA_12UVH = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_12 % predicted amount at 24h
    1.16  7.00847E-08  % 4H high   
    1.33  6.68771E-08  % 8H high    
    ];
units.tUFA_12UVH   = {'days', 'c-mol/g DW'}; label.tUFA_12UVH = {'Time', 'FA and AA concentrations'};  
temp.tUFA_12UVH    = C2K(12);  units.temp.tUFA_12UVH = 'K'; label.temp.tUFA_12UVH = 'temperature';
bibkey.tUFA_12UVH  = 'Lagos2016';
comment.tUFA_12UVH = 'UFA at low UV';
%
data.tUFA_13UVH = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_13 % predicted amount at 24h
    1.16  3.77038E-07 % 4H high   
    1.33  3.96595E-08 % 8H high    
    ];
units.tUFA_13UVH   = {'days', 'c-mol/g DW'}; label.tUFA_13UVH = {'Time', 'FA and AA concentrations'};  
temp.tUFA_13UVH    = C2K(13);  units.temp.tUFA_13UVH = 'K'; label.temp.tUFA_13UVH = 'temperature';
bibkey.tUFA_13UVH  = 'Lagos2016';
comment.tUFA_13UVH = 'UFA at low UV';
%
data.tUFA_16UVH = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_16 % predicted amount at 24h
    1.16  3.18310E-07 % 4H high   
    1.33  1.91705E-07 % 8H high    
    ];
units.tUFA_16UVH   = {'days', 'c-mol/g DW'}; label.tUFA_16UVH = {'Time', 'FA and AA concentrations'};  
temp.tUFA_16UVH    = C2K(16);  units.temp.tUFA_16UVH = 'K'; label.temp.tUFA_16UVH = 'temperature';
bibkey.tUFA_16UVH  = 'Lagos2016';
comment.tUFA_16UVH = 'UFA at low UV';
%
data.tUFA_19UVH = [... Time  C-mol SAFA; 19 deg C High UV
    0.00  6.29169e-06 % wild 
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_19 % predicted amount at 24h
    1.16  2.75166E-08 % 4H high   
    1.33  9.3465E-08 % 8H high    
    ];
units.tUFA_19UVH   = {'days', 'c-mol/g DW'}; label.tUFA_19UVH = {'Time', 'FA and AA concentrations'};  
temp.tUFA_19UVH    = C2K(19);  units.temp.tUFA_19UVH = 'K'; label.temp.tUFA_19UVH = 'temperature';
bibkey.tUFA_19UVH  = 'Lagos2016';
comment.tUFA_19UVH = 'UFA at low UV';

%% Positive (PAR) and negative controls (DARK) at 8,12,13,16,19 deg C for
% (1)MUFA's 
% (2)PUFAS's and 
% (3)SAFA's
% (4)UFA's
% Positive control (PAR)
% (1): MUFA's
data.tMUFA_8PAR = [... Time ~ MUFA (C-mol); 8 deg C
    0.00  9.090193e-06 % wild
    1.00  res.par.MC0_MUFA-res.par.JCM_MUFA*TC_8 % predicted amount at 24h
    1.16  2.17587E-06 % 4H high   
    1.33  2.07263E-06 % 8H high    
    ];
units.tMUFA_8PAR   = {'days', 'c-mol/g DW'}; label.tMUFA_8PAR = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_8PAR    = C2K(8);  units.temp.tMUFA_8PAR = 'K'; label.temp.tMUFA_8PAR = 'temperature';
bibkey.tMUFA_8PAR  = 'Lagos2016';
comment.tMUFA_8PAR = 'MUFA control (+)';

data.tMUFA_12PAR = [... Time ~ MUFA (C-mol); 12 deg C
    0.00  9.090193e-06 % wild
    1.00  res.par.MC0_MUFA-res.par.JCM_MUFA*TC_12 % predicted amount at 24h
    1.16  2.84656E-06 % 4H high   
    1.33  2.65109E-06 % 8H high    
    ];
units.tMUFA_12PAR   = {'days', 'c-mol/g DW'}; label.tMUFA_12PAR = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_12PAR    = C2K(12);  units.temp.tMUFA_12PAR = 'K'; label.temp.tMUFA_12PAR = 'temperature';
bibkey.tMUFA_12PAR  = 'Lagos2016';
comment.tMUFA_12PAR = 'MUFA control (+)';

data.tMUFA_13PAR = [... Time ~ MUFA (C-mol); 13 deg C
    0.00  9.090193e-06 % wild
    1.00  res.par.MC0_MUFA-res.par.JCM_MUFA*TC_13 % predicted amount at 24h
    1.16  5.2449E-06 % 4H high   
    1.33  4.50228E-06 % 8H high    
    ];
units.tMUFA_13PAR   = {'days', 'c-mol/g DW'}; label.tMUFA_13PAR = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_13PAR    = C2K(13);  units.temp.tMUFA_13PAR = 'K'; label.temp.tMUFA_13PAR = 'temperature';
bibkey.tMUFA_13PAR  = 'Lagos2016';
comment.tMUFA_13PAR = 'MUFA control (+)';

data.tMUFA_16PAR = [... Time ~ MUFA (C-mol); 16 deg C
    0.00   9.090193e-06 % wild
    1.00   res.par.MC0_MUFA-res.par.JCM_MUFA*TC_16 % predicted amount at 24h
    1.16   2.39439E-06  % 4H high   
    1.33   2.19331E-06 % 8H high    
    ];
units.tMUFA_16PAR   = {'days', 'c-mol/g DW'}; label.tMUFA_16PAR = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_16PAR    = C2K(16);  units.temp.tMUFA_16PAR = 'K'; label.temp.tMUFA_16PAR = 'temperature';
bibkey.tMUFA_16PAR  = 'Lagos2016';
comment.tMUFA_16PAR = 'MUFA control (+)';

data.tMUFA_19PAR = [... Time ~ MUFA (C-mol); 19 deg C 
    0.00  9.090193e-06 % wild
    1.00  res.par.MC0_MUFA-res.par.JCM_MUFA*TC_19 % predicted amount at 24h
    1.16  4.88674E-07  % 4H high   
    1.33  3.09842E-07  % 8H high    
    ];
units.tMUFA_19PAR   = {'days', 'c-mol/g DW'}; label.tMUFA_19PAR = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_19PAR    = C2K(19);  units.temp.tMUFA_19PAR = 'K'; label.temp.tMUFA_19PAR = 'temperature';
bibkey.tMUFA_19PAR  = 'Lagos2016';
comment.tMUFA_19PAR = 'MUFA control (+)';

% 2(PUFA's)
data.tPUFA_8PAR = [... Time ~ PUFA (C-mol); 8 deg C  
    0.00  1.669525e-05 % wild
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_8 % predicted amount at 24h
    1.16  4.76387E-06   % 4H high   
    1.33  3.48475E-06   % 8H high    
    ];
units.tPUFA_8PAR   = {'days', 'c-mol/g DW'}; label.tPUFA_8PAR = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_8PAR    = C2K(8);  units.temp.tPUFA_8PAR = 'K'; label.temp.tPUFA_8PAR = 'temperature';
bibkey.tPUFA_8PAR  = 'Lagos2016';
comment.tPUFA_8PAR = 'MUFA control (+)';

data.tPUFA_12PAR = [... Time ~ PUFA (C-mol); 12 deg C
    0.00  1.669525e-05 % wild
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_12 % predicted amount at 24h
    1.16  4.94267E-06  % 4H high   
    1.33  3.59834E-06  % 8H high    
    ];
units.tPUFA_12PAR   = {'days', 'c-mol/g DW'}; label.tPUFA_12PAR = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_12PAR    = C2K(12);  units.temp.tPUFA_12PAR = 'K'; label.temp.tPUFA_12PAR = 'temperature';
bibkey.tPUFA_12PAR  = 'Lagos2016';
comment.tPUFA_12PAR = 'MUFA control (+)';

data.tPUFA_13PAR = [... Time ~ PUFA (C-mol); 13 deg C
    0.00  1.669525e-05 % wild
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_13 % predicted amount at 24h
    1.16  6.4601E-06  % 4H high   
    1.33  5.6985E-06  % 8H high    
    ];
units.tPUFA_13PAR   = {'days', 'c-mol/g DW'}; label.tPUFA_13PAR = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_13PAR    = C2K(13);  units.temp.tPUFA_13PAR = 'K'; label.temp.tPUFA_13PAR = 'temperature';
bibkey.tPUFA_13PAR  = 'Lagos2016';
comment.tPUFA_13PAR = 'MUFA control (+)';

data.tPUFA_16PAR = [... Time ~ PUFA (C-mol); 16 deg C
    0.00  1.669525e-05 % wild
    1.00  res.par.MC0_PUFA-res.par.JCM_PUFA*TC_16 % predicted amount at 24h
    1.16  6.23511E-06   % 4H high   
    1.33  5.06659E-06 % 8H high    
    ];
units.tPUFA_16PAR   = {'days', 'c-mol/g DW'}; label.tPUFA_16PAR = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_16PAR    = C2K(16);  units.temp.tPUFA_16PAR = 'K'; label.temp.tPUFA_16PAR = 'temperature';
bibkey.tPUFA_16PAR = 'Lagos2016';
comment.tPUFA_16PAR = 'MUFA control (+)';

data.tPUFA_19PAR = [... Time ~ PUFA (C-mol); 19 deg C
    0.00   1.669525e-05 % wild
    1.00   res.par.MC0_PUFA-res.par.JCM_PUFA*TC_19 % predicted amount at 24h
    1.16   1.26552E-06  % 4H high   
    1.33   8.95937E-07 % 8H high    
    ];
units.tPUFA_19PAR   = {'days', 'c-mol/g DW'}; label.tPUFA_19PAR = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_19PAR    = C2K(19);  units.temp.tPUFA_19PAR = 'K'; label.temp.tPUFA_19PAR = 'temperature';
bibkey.tPUFA_19PAR  = 'Lagos2016';
comment.tPUFA_19PAR = 'MUFA control (+)';

% (3) SAFA's
data.tSAFA_8PAR = [... Time ~ SAFA (C-mol); 8 deg C
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_8 % predicted amount at 24h
    1.16  8.03151E-07   % 4H high   
    1.33  3.35048E-07 % 8H high    
    ];
units.tSAFA_8PAR   = {'days', 'c-mol/g DW'}; label.tSAFA_8PAR = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_8PAR    = C2K(8);  units.temp.tSAFA_8PAR = 'K'; label.temp.tSAFA_8PAR = 'temperature';
bibkey.tSAFA_8PAR  = 'Lagos2016';
comment.tSAFA_8PAR = 'MUFA control (+)';

data.tSAFA_12PAR = [... Time ~ SAFA (C-mol); 12 deg C
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_12 % predicted amount at 24h
    1.16  2.87998E-07   % 4H high   
    1.33  1.73655E-07  % 8H high    
    ];
units.tSAFA_12PAR   = {'days', 'c-mol/g DW'}; label.tSAFA_12PAR = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_12PAR    = C2K(12);  units.temp.tSAFA_12PAR = 'K'; label.temp.tSAFA_12PAR = 'temperature';
bibkey.tSAFA_12PAR  = 'Lagos2016';
comment.tSAFA_12PAR = 'MUFA control (+)';

data.tSAFA_13PAR = [... Time ~ SAFA (C-mol); 13 deg C
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_13 % predicted amount at 24h
    1.16  1.43062E-06   % 4H high   
    1.33  1.51416E-06  % 8H high    
    ];
units.tSAFA_13PAR   = {'days', 'c-mol/g DW'}; label.tSAFA_13PAR = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_13PAR    = C2K(13);  units.temp.tSAFA_13PAR = 'K'; label.temp.tSAFA_13PAR = 'temperature';
bibkey.tSAFA_13PAR  = 'Lagos2016';
comment.tSAFA_13PAR = 'MUFA control (+)';

data.tSAFA_16PAR = [... Time ~ SAFA (C-mol); 16 deg C
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_16 % predicted amount at 24h
    1.16  4.03321E-07   % 4H high   
    1.33  4.37711E-07  % 8H high    
    ];
units.tSAFA_16PAR   = {'days', 'c-mol/g DW'}; label.tSAFA_16PAR = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_16PAR    = C2K(16);  units.temp.tSAFA_16PAR = 'K'; label.temp.tSAFA_16PAR = 'temperature';
bibkey.tSAFA_16PAR  = 'Lagos2016';
comment.tSAFA_16PAR = 'MUFA control (+)';

data.tSAFA_19PAR = [... Time ~ SAFA (C-mol); 19 deg C
    0.00  5.955717e-06 % wild
    1.00  res.par.MC0_SAFA-res.par.JCM_SAFA*TC_19 % predicted amount at 24h
    1.16  4.15103E-08   % 4H high   
    1.33  1.95828E-08  % 8H high    
    ];
units.tSAFA_19PAR   = {'days', 'c-mol/g DW'}; label.tSAFA_19PAR = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_19PAR    = C2K(19);  units.temp.tSAFA_19PAR = 'K'; label.temp.tSAFA_19PAR = 'temperature';
bibkey.tSAFA_19PAR  = 'Lagos2016';
comment.tSAFA_19PAR = 'MUFA control (+)';
%
% (4) UFA's
data.tUFA_8PAR = [... Time ~ UFA (C-mol); 8 deg C
    0.00  6.29169e-06 % wild
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_8 % predicted amount at 24h
    1.16  5.05820E-07  % 4H high   
    1.33  3.76212E-07  % 8H high    
    ];
units.tUFA_8PAR   = {'days', 'c-mol/g DW'}; label.tUFA_8PAR = {'Time', 'FA and AA concentrations'};  
temp.tUFA_8PAR    = C2K(19);  units.temp.tUFA_8PAR = 'K'; label.temp.tUFA_8PAR = 'temperature';
bibkey.tUFA_8PAR  = 'Lagos2016';
comment.tUFA_8PAR = 'UFA control (+)';
%
data.tUFA_12PAR = [... Time ~ UFA (C-mol); 12 deg C
    0.00  6.29169e-06 % wild
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_12 % predicted amount at 24h
    1.16  2.54699E-07   % 4H high   
    1.33  3.9152E-07  % 8H high    
    ];
units.tUFA_12PAR   = {'days', 'c-mol/g DW'}; label.tUFA_12PAR = {'Time', 'FA and AA concentrations'};  
temp.tUFA_12PAR    = C2K(12);  units.temp.tUFA_12PAR = 'K'; label.temp.tUFA_12PAR = 'temperature';
bibkey.tUFA_12PAR  = 'Lagos2016';
comment.tUFA_12PAR = 'UFA control (+)';
%
data.tUFA_13PAR = [... Time ~ UFA (C-mol); 13 deg C
    0.00  6.29169e-06 % wild
    1.00  res.par.MC0_UFA-res.par.JCM_UFA*TC_13 % predicted amount at 24h
    1.16  4.22221E-07   % 4H high   
    1.33  5.02786E-07  % 8H high    
    ];
units.tUFA_13PAR   = {'days', 'c-mol/g DW'}; label.tUFA_13PAR = {'Time', 'FA and AA concentrations'};  
temp.tUFA_13PAR    = C2K(13);  units.temp.tUFA_13PAR = 'K'; label.temp.tUFA_13PAR = 'temperature';
bibkey.tUFA_13PAR  = 'Lagos2016';
comment.tUFA_13PAR = 'UFA control (+)';
%
data.tUFA_16PAR = [... Time ~ UFA (C-mol); 16 deg C
    0.00  6.29169e-06 % wild
    1.00  res.par.MC0_UFA-res.par.JCM_UFA * TC_16 % predicted amount at 24h
    1.16  2.82312E-07   % 4H high   
    1.33  2.77723E-07  % 8H high    
    ];
units.tUFA_16PAR   = {'days', 'c-mol/g DW'}; label.tUFA_16PAR = {'Time', 'FA and AA concentrations'};  
temp.tUFA_16PAR    = C2K(16);  units.temp.tUFA_16PAR = 'K'; label.temp.tUFA_16PAR = 'temperature';
bibkey.tUFA_16PAR  = 'Lagos2016';
comment.tUFA_16PAR = 'UFA control (+)';
%
data.tUFA_19PAR = [... Time ~ UFA (C-mol); 19 deg C
    0.00  6.29169e-06 % wild
    1.00  res.par.MC0_UFA-res.par.JCM_UFA * TC_19 % predicted amount at 24h
    1.16  6.21043E-07   % 4H high   
    1.33  4.23864E-07  % 8H high    
    ];
units.tUFA_19PAR   = {'days', 'c-mol/g DW'}; label.tUFA_19PAR = {'Time', 'FA and AA concentrations'};  
temp.tUFA_19PAR    = C2K(19);  units.temp.tUFA_19PAR = 'K'; label.temp.tUFA_19PAR = 'temperature';
bibkey.tUFA_19PAR  = 'Lagos2016';
comment.tUFA_19PAR = 'UFA control (+)';

%% Time - AA concentration (c-mol)
% reduction in time of all esseantial amino acids (EAA) and non-essential amino acids (NEAA) for low and
% high UV treatments plus positve (PAR) and negative (DARK) control treatments

data.tEAA_8UVL = [...n = 5
      0.00   8.07417E-06  % wild
      1.00   res.par.MC0_EAA-res.par.JCM_EAA*TC_8 % predicted amount at 24h
      1.16   3.911957e-06  % 4h low
      1.33   3.447254e-06  % 8h low
      ];
units.tEAA_8UVL = {'days', 'c-mol/g DW'}; label.tEAA_8UVL = {'Time', 'FA and AA concentrations'};  
temp.tEAA_8UVL  = C2K(8);  units.temp.tEAA_8UVL = 'K'; label.temp.tEAA_8UVL = 'temperature';
bibkey.tEAA_8UVL = 'Lagos2016';
comment.tEAA_8UVL = 'EAA low UV';
%
data.tEAA_8UVH = [...n = 5
      0.00   8.07417E-06 % wild
      1.00   res.par.MC0_EAA-res.par.JCM_EAA*TC_8 % predicted amount at 24h
      1.16   4.285701e-06 % 4h high
      1.33   3.838385e-06 % 8h high
      ];
units.tEAA_8UVH = {'days', 'c-mol/g DW'}; label.tEAA_8UVH = {'Time', 'FA and AA concentrations'};  
temp.tEAA_8UVH  = C2K(8);  units.temp.tEAA_8UVH = 'K'; label.temp.tEAA_8UVH = 'temperature';
bibkey.tEAA_8UVH = 'Lagos2016';
comment.tEAA_8UVH = 'EAA high UV';
%
data.tEAA_8PAR = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_8 % predicted amount at 24h
      1.16    3.429410e-06 % 4h 
      1.33    3.480313e-06 % 8h 
      ];
units.tEAA_8PAR = {'days', 'c-mol/g DW'}; label.tEAA_8PAR = {'Time', 'FA and AA concentrations'};  
temp.tEAA_8PAR  = C2K(8);  units.temp.tEAA_8PAR = 'K'; label.temp.tEAA_8PAR = 'temperature';
bibkey.tEAA_8PAR = 'Lagos2016';
comment.tEAA_8PAR = 'EAA PAR';
%
data.tNEAA_8UVL = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_8 % predicted amount at 24h
      1.16    2.425796e-06 % 4h low
      1.33    2.345977e-06 % 8h low
      ];
units.tNEAA_8UVL = {'days', 'c-mol/g DW'}; label.tNEAA_8UVL = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_8UVL  = C2K(8);  units.temp.tNEAA_8UVL = 'K'; label.temp.tNEAA_8UVL = 'temperature';
bibkey.tNEAA_8UVL = 'Lagos2016';
comment.tNEAA_8UVL = 'NEAA low UV at 8ºC';
%
data.tNEAA_8UVH = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_8 % predicted amount at 24h
      1.16    2.407840e-06 % 4h high
      1.33    2.350418e-06 % 8h high
      ];
units.tNEAA_8UVH = {'days', 'c-mol/g DW'}; label.tNEAA_8UVH = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_8UVH  = C2K(8);  units.temp.tNEAA_8UVH = 'K'; label.temp.tNEAA_8UVH = 'temperature';
bibkey.tNEAA_8UVH = 'Lagos2016';
comment.tNEAA_8UVH = 'NEAA high UV at 8ºC';
%        
data.tNEAA_8PAR = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_8 % predicted amount at 24h
      1.16    2.442093e-06 % 4h
      1.33    2.436431e-06 % 8h 
      ];
units.tNEAA_8PAR = {'days', 'c-mol/g DW'}; label.tNEAA_8PAR = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_8PAR  = C2K(8);  units.temp.tNEAA_8PAR = 'K'; label.temp.tNEAA_8PAR = 'temperature';
bibkey.tNEAA_8PAR = 'Lagos2016';
comment.tNEAA_8PAR= 'NEAA for PAR at 8ºC';
%  
data.tEAA_12UVL = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_12 % predicted amount at 24h
      1.16    5.913380e-06 % 4h low
      1.33    5.113380e-06 % 8h low
      ];
units.tEAA_12UVL = {'days', 'c-mol/g DW'}; label.tEAA_12UVL = {'Time', 'FA and AA concentrations'};  
temp.tEAA_12UVL  = C2K(12);  units.temp.tEAA_12UVL = 'K'; label.temp.tEAA_12UVL = 'temperature';
bibkey.tEAA_12UVL = 'Lagos2016';
comment.tEAA_12UVL = 'EAA for low UV at 12ºC';
%
data.tEAA_12UVH = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_12 % predicted amount at 24h
      1.16    5.808984e-06 % 4h high
      1.33    3.288422e-06 % 8h high
      ];
units.tEAA_12UVH = {'days', 'c-mol/g DW'}; label.tEAA_12UVH = {'Time', 'FA and AA concentrations'};  
temp.tEAA_12UVH  = C2K(12);  units.temp.tEAA_12UVH = 'K'; label.temp.tEAA_12UVH = 'temperature';
bibkey.tEAA_12UVH = 'Lagos2016';
comment.tEAA_12UVH = 'EAA for  high UV at 12ºC';
%
data.tEAA_12PAR = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_12 % predicted amount at 24h
      1.16    3.217575e-06 % 4h 
      1.33    3.749473e-06 % 8h 
      ];
units.tEAA_12PAR = {'days', 'c-mol/g DW'}; label.tEAA_12PAR = {'Time', 'FA and AA concentrations'};  
temp.tEAA_12PAR  = C2K(12);  units.temp.tEAA_12PAR = 'K'; label.temp.tEAA_12PAR = 'temperature';
bibkey.tEAA_12PAR = 'Lagos2016';
comment.tEAA_12PAR = 'EAA for PAR at 12ºC';
%
data.tNEAA_12UVL = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_12 % predicted amount at 24h
      1.16    1.081630e-06 % 4h low
      1.33    1.025778e-06 % 8h low
      ];
units.tNEAA_12UVL = {'days', 'c-mol/g DW'}; label.tNEAA_12UVL = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_12UVL  = C2K(12);  units.temp.tNEAA_12UVL = 'K'; label.temp.tNEAA_12UVL = 'temperature';
bibkey.tNEAA_12UVL = 'Lagos2016';
comment.tNEAA_12UVL = 'NEAA for low UV at 12ºC';
%
data.tNEAA_12UVH = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_12 % predicted amount at 24h
      1.16    2.323030e-06 % 4h high
      1.33    2.528579e-06 % 8h high
      ];
units.tNEAA_12UVH = {'days', 'c-mol/g DW'}; label.tNEAA_12UVH = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_12UVH  = C2K(12);  units.temp.tNEAA_12UVH = 'K'; label.temp.tNEAA_12UVH = 'temperature';
bibkey.tNEAA_12UVH = 'Lagos2016';
comment.tNEAA_12UVH = 'NEAA for high UV at 12ºC';
%
data.tNEAA_12PAR = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_12 % predicted amount at 24h
      1.16    1.145533e-06 % 4h 
      1.33    3.100946e-06 % 8h 
      ];
units.tNEAA_12PAR = {'days', 'c-mol/g DW'}; label.tNEAA_12PAR = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_12PAR  = C2K(12);  units.temp.tNEAA_12PAR = 'K'; label.temp.tNEAA_12PAR = 'temperature';
bibkey.tNEAA_12PAR = 'Lagos2016';
comment.tNEAA_12PAR = 'NEAA for PAR at 12ºC';
%
data.tEAA_13UVL = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_13 % predicted amount at 24h
      1.16    5.666282e-06 % 4h low
      1.33    5.610042e-06 % 8h low
      ];
units.tEAA_13UVL = {'days', 'c-mol/g DW'}; label.tEAA_13UVL = {'Time', 'FA and AA concentrations'};  
temp.tEAA_13UVL  = C2K(13);  units.temp.tEAA_13UVL = 'K'; label.temp.tEAA_13UVL = 'temperature';
bibkey.tEAA_13UVL = 'Lagos2016';
comment.tEAA_13UVL = 'EAA for low UV at 13ºC';
%
data.tEAA_13UVH = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_13 % predicted amount at 24h
      1.16    5.36734e-06 % 4h high
      1.33    5.25035e-06 % 8h high
      ];
units.tEAA_13UVH = {'days', 'c-mol/g DW'}; label.tEAA_13UVH = {'Time', 'FA and AA concentrations'};  
temp.tEAA_13UVH  = C2K(13);  units.temp.tEAA_13UVH = 'K'; label.temp.tEAA_13UVH = 'temperature';
bibkey.tEAA_13UVH = 'Lagos2016';
comment.tEAA_13UVH = 'EAA for high UV at 13ºC';
%    
data.tEAA_13PAR = [...
      0.00     8.07417E-06 % wild
      1.00     res.par.MC0_EAA-res.par.JCM_EAA*TC_13 % predicted amount at 24h
      1.16     6.423538e-06 % 4h 
      1.33     6.521168e-06 % 8h 
      ];
units.tEAA_13PAR = {'days', 'c-mol/g DW'}; label.tEAA_13PAR = {'Time', 'FA and AA concentrations'};  
temp.tEAA_13PAR  = C2K(13);  units.temp.tEAA_13PAR = 'K'; label.temp.tEAA_13PAR = 'temperature';
bibkey.tEAA_13PAR = 'Lagos2016';
comment.tEAA_13PAR = 'EAA for PAR at 13ºC';
%
data.tNEAA_13UVL = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_13 % predicted amount at 24h
      1.16    3.529061e-06 % 4h 
      1.33    3.436968e-06 % 8h 
      ];
units.tNEAA_13UVL = {'days', 'c-mol/g DW'}; label.tNEAA_13UVL = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_13UVL  = C2K(13);  units.temp.tNEAA_13UVL = 'K'; label.temp.tNEAA_13UVL = 'temperature';
bibkey.tNEAA_13UVL = 'Lagos2016';
comment.tNEAA_13UVL = 'NEAA for low UV at 13ºC';
%
data.tNEAA_13UVH = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_13 % predicted amount at 24h
      1.16    3.520656e-06 % 4h 
      1.33    3.425030e-06 % 8h 
      ];
units.tNEAA_13UVH = {'days', 'c-mol/g DW'}; label.tNEAA_13UVH = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_13UVH  = C2K(13);  units.temp.tNEAA_13UVH = 'K'; label.temp.tNEAA_13UVH = 'temperature';
bibkey.tNEAA_13UVH = 'Lagos2016';
comment.tNEAA_13UVH = 'NEAA for high UV at 13ºC';
%
data.tNEAA_13PAR = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_13 % predicted amount at 24h
      1.16    3.418815e-06 % 4h 
      1.33    3.327312e-06 % 8h 
      ];
units.tNEAA_13PAR = {'days', 'c-mol/g DW'}; label.tNEAA_13PAR = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_13PAR  = C2K(13);  units.temp.tNEAA_13PAR = 'K'; label.temp.tNEAA_13PAR = 'temperature';
bibkey.tNEAA_13PAR = 'Lagos2016';
comment.tNEAA_13PAR = 'NEAA for PAR at 13ºC';
%
data.tEAA_16UVL = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_16 % predicted amount at 24h
      1.16    6.891311e-06% 4h 
      1.33    6.153472e-06% 8h 
      ];
units.tEAA_16UVL = {'days', 'c-mol/g DW'}; label.tEAA_16UVL = {'Time', 'FA and AA concentrations'};  
temp.tEAA_16UVL  = C2K(16);  units.temp.tEAA_16UVL = 'K'; label.temp.tEAA_16UVL = 'temperature';
bibkey.tEAA_16UVL = 'Lagos2016';
comment.tEAA_16UVL = 'EAA for low UV at 16ºC';  

data.tEAA_16UVH = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_16 % predicted amount at 24h
      1.16    3.559413e-06% 4h 
      1.33    3.347531e-06% 8h 
      ];
units.tEAA_16UVH = {'days', 'c-mol/g DW'}; label.tEAA_16UVH = {'Time', 'FA and AA concentrations'};  
temp.tEAA_16UVH  = C2K(16);  units.temp.tEAA_16UVH = 'K'; label.temp.tEAA_16UVH = 'temperature';
bibkey.tEAA_16UVH = 'Lagos2016';
comment.tEAA_16UVH = 'EAA for high UV at 16ºC';    
%
data.tEAA_16PAR = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_16 % predicted amount at 24h
      1.16    6.271921e-06 % 4h 
      1.33    6.031003e-06 % 8h 
      ];
units.tEAA_16PAR = {'days', 'c-mol/g DW'}; label.tEAA_16PAR = {'Time', 'FA and AA concentrations'};  
temp.tEAA_16PAR  = C2K(16);  units.temp.tEAA_16PAR = 'K'; label.temp.tEAA_16PAR = 'temperature';
bibkey.tEAA_16PAR = 'Lagos2016';
comment.tEAA_16PAR = 'EAA for PAR at 16ºC'; 
%
data.tNEAA_16UVL = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_16 % predicted amount at 24h
      1.16    3.110453e-06 % 4h 
      1.33    2.914113e-06 % 8h 
      ];
units.tNEAA_16UVL = {'days', 'c-mol/g DW'}; label.tNEAA_16UVL = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_16UVL  = C2K(16);  units.temp.tNEAA_16UVL = 'K'; label.temp.tNEAA_16UVL = 'temperature';
bibkey.tNEAA_16UVL = 'Lagos2016';
comment.tNEAA_16UVL = 'NEAA for low UV at 16ºC';  

data.tNEAA_16UVH = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_16 % predicted amount at 24h
      1.16    2.950562e-06 % 4h 
      1.33    2.718217e-06 % 8h 
      ];
units.tNEAA_16UVH = {'days', 'c-mol/g DW'}; label.tNEAA_16UVH = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_16UVH  = C2K(16);  units.temp.tNEAA_16UVH = 'K'; label.temp.tNEAA_16UVH = 'temperature';
bibkey.tNEAA_16UVH = 'Lagos2016';
comment.tNEAA_16UVH = 'NEAA for high UV at 16ºC';     
%
data.tNEAA_16PAR = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_16 % predicted amount at 24h
      1.16    3.131888e-06 % 4h 
      1.33    2.728964e-06 % 8h 
      ];
units.tNEAA_16PAR = {'days', 'c-mol/g DW'}; label.tNEAA_16PAR = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_16PAR  = C2K(16);  units.temp.tNEAA_16PAR = 'K'; label.temp.tNEAA_16PAR = 'temperature';
bibkey.tNEAA_16PAR = 'Lagos2016';
comment.tNEAA_16PAR = 'NEAA for PAR at 16ºC';
%
data.tEAA_19UVL = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_19 % predicted amount at 24h
      1.16    1.514756e-06 % 4h low
      1.33    1.008968e-06 % 8h low
      ];
units.tEAA_19UVL = {'days', 'c-mol/g DW'}; label.tEAA_19UVL = {'Time', 'FA and AA concentrations'};  
temp.tEAA_19UVL  = C2K(19);  units.temp.tEAA_19UVL = 'K'; label.temp.tEAA_19UVL = 'temperature';
bibkey.tEAA_19UVL = 'Lagos2016';
comment.tEAA_19UVL = 'EAA for low UV at 19ºC';
% 
data.tEAA_19UVH = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_19 % predicted amount at 24h
      1.16    2.467909e-06 % 4h high
      1.33    1.123847e-06 % 8h high
      ];
units.tEAA_19UVH  = {'days', 'c-mol/g DW'}; label.tEAA_19UVH  = {'Time', 'FA and AA concentrations'};  
temp.tEAA_19UVH   = C2K(19);  units.temp.tEAA_19UVH  = 'K'; label.temp.tEAA_19UVH  = 'temperature';
bibkey.tEAA_19UVH  = 'Lagos2016';
comment.tEAA_19UVH  = 'EAA for high UV at 19ºC';
%
data.tEAA_19PAR = [...
      0.00    8.07417E-06 % wild
      1.00    res.par.MC0_EAA-res.par.JCM_EAA*TC_19 % predicted amount at 24h
      1.16    6.692181e-06 % 4h 
      1.33    6.690317e-06 % 8h 
      ];
units.tEAA_19PAR  = {'days', 'c-mol/g DW'}; label.tEAA_19PAR  = {'Time', 'FA and AA concentrations'};  
temp.tEAA_19PAR   = C2K(19);  units.temp.tEAA_19PAR  = 'K'; label.temp.tEAA_19PAR  = 'temperature';
bibkey.tEAA_19PAR  = 'Lagos2016';
comment.tEAA_19PAR  = 'EAA for PAR at 19ºC';
%    
data.tNEAA_19UVL = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_19 % predicted amount at 24h
      1.16    4.977793e-06 % 4h 
      1.33    3.275565e-06 % 8h 
      ];
units.tNEAA_19UVL = {'days', 'c-mol/g DW'}; label.tNEAA_19UVL = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_19UVL   = C2K(19);  units.temp.tNEAA_19UVL  = 'K'; label.temp.tNEAA_19UVL  = 'temperature';
bibkey.tNEAA_19UVL  = 'Lagos2016';
comment.tNEAA_19UVL  = 'NEAA for low UV at 19ºC';
%
data.tNEAA_19UVH = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_19 % predicted amount at 24h
      1.16    2.745820e-06 % 4h 
      1.33    2.194606e-06 % 8h 
      ];
units.tNEAA_19UVH = {'days', 'c-mol/g DW'}; label.tNEAA_19UVH = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_19UVH   = C2K(19);  units.temp.tNEAA_19UVH  = 'K'; label.temp.tNEAA_19UVH  = 'temperature';
bibkey.tNEAA_19UVH  = 'Lagos2016';
comment.tNEAA_19UVH  = 'NEAA for high UV at 19ºC';  
%
data.tNEAA_19PAR = [...
      0.00    3.815797e-06 % wild
      1.00    res.par.MC0_NEAA-res.par.JCM_NEAA*TC_19 % predicted amount at 24h
      1.16    3.552263e-06 % 4h 
      1.33    3.287277e-06 % 8h 
      ];
units.tNEAA_19PAR  = {'days', 'c-mol/g DW'}; label.tNEAA_19PAR  = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_19PAR    = C2K(19);  units.temp.tNEAA_19PAR   = 'K'; label.temp.tNEAA_19PAR   = 'temperature';
bibkey.tNEAA_19PAR   = 'Lagos2016';
comment.tNEAA_19PAR   = 'NEAA for PAR at 19ºC';

%% Check data sets
% 
% cnames = {'MUFA', 'PUFA', 'SAFA', 'EAA', 'NEAA'};
% temps = {'8','12','13','16','19'};
% lights = {'UVL','UVH','PAR'};
% 
% for i = 1:length(cnames)
%     for j = 1:length(temps)
%         for k = 1:length(lights)
%             dataname = ['data.t',cnames{i}, '_',temps{j},lights{k}];
%             mydata = eval(dataname);
%             disp(mydata)
%             plot(mydata(:,1),mydata(:,2),'bo-')
%             titlename = [cnames{i}, ' ',temps{j}, ' ', lights{k}];
%             title(titlename,'FontSize', 20)
%             pause
%         end
%     end
% end
%  
% clear res temps
% 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots


set6 = {'tMUFA_8UVL','tPUFA_8UVL','tSAFA_8UVL','tUFA_8UVL','tEAA_8UVL','tNEAA_8UVL',}; 
comment6 = {'set6, FA and AA at 8ºC, low UV'};

set7 = {'tMUFA_8UVH','tPUFA_8UVH','tSAFA_8UVH','tUFA_8UVH','tEAA_8UVH','tNEAA_8UVH'}; 
comment7 = {'set7, FA and AA at 8ºC, high UV'};

set8 = {'tMUFA_8PAR','tPUFA_8PAR','tSAFA_8PAR','tUFA_8PAR','tEAA_8PAR','tNEAA_8PAR'}; 
comment8 = {'set8, FA and AA at 8ºC, Par'};

set10 = {'tMUFA_12UVL','tPUFA_12UVL','tSAFA_12UVL','tUFA_12UVL','tEAA_12UVL','tNEAA_12UVL'}; 
comment10 = {'set10, FA and AA at 12ºC, Low UV'};

set11 = {'tMUFA_12UVH','tPUFA_12UVH','tSAFA_12UVH','tUFA_12UVH','tEAA_12UVH','tNEAA_12UVH'}; 
comment11 = {'set11, FA and AA at 12ºC, high UV'};

set12 = {'tMUFA_12PAR','tPUFA_12PAR','tSAFA_12PAR','tUFA_12PAR','tEAA_12PAR','tNEAA_12PAR'}; 
comment12 = {'set12, FA and AA at 12ºC, for PAR'};

set14 = {'tMUFA_13UVL','tPUFA_13UVL','tSAFA_13UVL','tUFA_13UVL','tEAA_13UVL','tNEAA_13UVL'};
comment14 = {'set14, FA and AA at 13ºC, low UV'};

set15 = {'tMUFA_13UVH','tPUFA_13UVH','tSAFA_13UVH','tUFA_13UVH','tEAA_13UVH','tNEAA_13UVH'};
comment15 = {'set15, FA and AA at 13ºC, high UV'};

set16 = {'tMUFA_13PAR','tPUFA_13PAR','tSAFA_13PAR','tUFA_13PAR','tEAA_13PAR','tNEAA_13PAR'};
comment16 = {'set16, FA and AA at 13ºC,  PAR'};

set18 = {'tMUFA_16UVL','tPUFA_16UVL','tSAFA_16UVL','tUFA_16UVL','tEAA_16UVL','tNEAA_16UVL'};
comment18 = {'set18, FA and AA at 16ºC, Low UV'};

set19 = {'tMUFA_16UVH','tPUFA_16UVH','tSAFA_16UVH','tUFA_16UVH','tEAA_16UVH','tNEAA_16UVH'};
comment19 = {'set19, FA and AA at 16ºC, high UV'};

set20 = {'tMUFA_16PAR','tPUFA_16PAR','tSAFA_16PAR','tUFA_16PAR','tEAA_16PAR','tNEAA_16PAR'};
comment20 = {'set20, FA and AA at 16ºC, PAR '};

set22 = {'tMUFA_19UVL','tPUFA_19UVL','tSAFA_19UVL','tUFA_19UVL','tEAA_19UVL','tNEAA_19UVL'};
comment22 = {'set22, FA and AA at 19ºC, Low UV'};

set23 = {'tMUFA_19UVH','tPUFA_19UVH','tSAFA_19UVH','tUFA_19UVH','tEAA_19UVH','tNEAA_19UVH'};
comment23 = {'set23, FA and AA at 19ºC, High UV'};

set24 = {'tMUFA_19PAR','tPUFA_19PAR','tSAFA_19PAR','tUFA_19PAR','tEAA_19PAR','tNEAA_19PAR'};
comment24 = {'set24, FA and AA at 19ºC, PAR'};

set25 = {'tMUFA_19UVH', 'tMUFA_16UVH', 'tMUFA_13UVH', 'tMUFA_12UVH', 'tMUFA_8UVH','tMUFA_19PAR','tMUFA_16PAR','tMUFA_13PAR','tMUFA_12PAR','tMUFA_8PAR' };
comment25 = {'set25, temperature'};


metaData.grp.sets = {set6,  set7,  set8, ...
                    set10, set11, set12, ... 
                    set14, set15, set16, ...
                    set18, set19, set20, ...
                    set22, set23, set24, set25}; 
                 
metaData.grp.comment = {comment6,  comment7,  comment8,  ...
                        comment10, comment11, comment12, ...
                        comment14, comment15, comment16, ... 
                        comment18, comment19, comment20, ...
                        comment22, comment23, comment24, comment25};

%% Discussion points
D1 = 'Metamorphosis is assumed to not affect morphology, not metabolism';
D2 = 'Males are assumed to have the same parameters as females';     
D3 = ['weight 0 is given to age at birth, length at birth, ultimate physical length.'...
    'Age at birth is unknown and we do not have yet a good guess. '...
    'shape changes so we think a different shape coeff in the early stages would be different.'...
    'Wwi corresponds to heaviest individual measured by Lago2016, and the Li was from the literature-'...
    'as we have weight-length we prioritize a good fit for Wwi over that of Li. The Ni data is an assumption from Hosi1982, more realistic implementation of modelling original data should be implemented in a future version. The egg dry weight is an actual measurment and so is given more weight.'];
D4 = 'v, kap and p_M are given more weight to account for the paucity of information on this species life-cycle.';
D5 = 'we accept a loss of fit in the initial part of the t-L curves which we attribute to changes in shape';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'Production of mature ova is continuous and oviposition takes place roughly every 30 days.';
metaData.bibkey.F1 = 'Hosi1982'; 
F2 = 'Feeding starts at stage Calyptopsis I';
metaData.bibkey.F2 = 'Hosi1982'; 
F3 = 'Intermoult time is temperature dependant.';
metaData.bibkey.F3 = 'Hosi1982';   
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nyctiphanes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lagos2016'; type = 'Misc'; bib = [ ... 
'author = {Paulo F.Lagos}, ' ...
'year = {2016}, ' ...
'note  = {unpublished data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hosi1982'; type = 'Thesis'; bib = [... %used for growth and dry weight data
'author = {Hosie, W.},'...
'year = {1982},'...
'title = {Biology and production of \emph{Nyctiphanes australis} {G}.{O}. {S}ars, in the coastal waters of {S}.{E}. {T}asmania},'...
'Publisher = {University of Tasmania},'...
'pages = {21--44},'...
'howpublished = {\url{http://eprints.utas.edu.au/20108/1/whole_HosieGrahamWilliam1983_thesis.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaywBurn2003'; type = 'Article'; bib = [... 
'author = {Haywood, G.J. and Burns, C.W.},'...
'year = {2003},'...
'title = {Growth of \emph{Nyctiphanes} ({E}uphausiacea) on different diets},'...
'Journal = {J Exp Mar Biol & Ecol},'...
'pages = {139--151},'...
'volume = {289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%



