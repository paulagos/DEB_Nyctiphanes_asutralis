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

%% set data
% zero-variate data

data.ab = 5;       units.ab = 'd';      label.ab = 'age at birth';                   bibkey.ab = 'Lagos2016';
temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'we do not know the incubation time of eggs and weight zero is given to this data.';

data.tp = 115;        units.tp = 'd';      label.tp = 'time since birth at puberty';    bibkey.tp = 'Hosi1982';
temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.am = 365;        units.am = 'd';      label.am = 'life span';                      bibkey.am = 'Hosi1982';
temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'authors says it appears unlikely that N. australis lives longer than one year';

data.Lb  = 0.045;  units.Lb  = 'cm';    label.Lb = 'total length at birth';                 bibkey.Lb = 'Hosi1982';

data.Lp  = 1.163;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';              bibkey.Lp  = 'HaywBurn2003';

data.Li  = 2.21;   units.Li  = 'cm';    label.Li  = 'ultimate total length';                bibkey.Li  = 'Lagos2016';
comment.Li = 'Largest krill captured in Otago';

data.Wd0 = 8.6E-06;      units.Wd0 = 'g';  label.Wd0 = 'egg dry weight';            bibkey.Wd0 = 'Hosi1982';
comment.Wd0 = 'pp 70  - quote: The average dry weights of the egg and developing nauplius for N. australis were 0.0086 and 0.0081 mg respectively. The egg weight is similar to that recorded by Nemoto et al. (1972) for Euphausia pacifica';

data.Lw0 = 0.0378;     units.Lw0 = 'cm';     label.Lw0 = 'egg diameter';               bibkey.Lw0 = 'Ross2008';
comment.Lw0 = 'average size range from 378-405 um, which is smaller than the eggs of E.pacifica';

data.Vegg = 2.82e-05;     units.Vegg = 'cm^3';     label.Vegg = 'egg volume';         bibkey.Vegg = 'Ross2008';
comment.Vegg = 'calculated using V = (4/3) * 3.14 * (Lw_0 / 2)^3';

data.Wwi  = 0.08;    units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';              bibkey.Wwi  = 'Lagos2016';

data.Wd14 = 0.003051; units.Wd14 = 'g';    label.Wd14 = 'Dry weight at 1.45cm';            bibkey.Wd14 = 'Lagos2016';

data.Ni  = 1100;      units.Ni  = '#';     label.Ni  = 'life time reproductive output';   bibkey.Ni  = 'Hosi1982';
temp.Ni = C2K(12);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
comment.Ni = 'The total number of eggs produced by a female in a lifetime was calculated by the authors as 1100 (Table 3.5). The authors assumed that a female produces a batch of eggs every 30 days over a season of approximately 240 days';

data.Ri = 4.75;     units.Ri = '#/d';   label.Ri = 'maximun reproduction rate';         bibkey.Ri = 'Hosi1982';
temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'maximun reproduction rate assuming 9 Sapawning episodes per lifetime and a maximun of 194 eggs per batch';
%
% uni-variate data
% time-length
data.tL_1 = [ ... % time (d),  length (mm)
3	1.007
6	1.573
14	4.048
14	4.002
23	4.943
29	5.561
39	7.258
47	7.847
55	8.262
60	8.802
85	7.829
100	9.619
];
data.tL_1(:,2) = data.tL_1(:,2)/10; % convert mm to cm
units.tL_1   = {'d','cm'};  label.tL_1 = {'time since birth', 'length'};  
temp.tL_1 = C2K(16);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = {'HaywBurn2003'};
comment.tL_1 = 'on diet of Thalassiosira';
%
data.tL_2 = [ ... % time (d),  length (mm)
4	0.721
25	2.983
28	2.961
38	3.819
47	4.562
54	5.050
60	5.642
73	6.500
14	2.690
85	8.310
91	8.547
99	9.114
];
data.tL_2(:,2) = data.tL_2(:,2)/10; % convert mm to cm
units.tL_2   = {'d','cm'};  label.tL_2 = {'time since birth', 'length'};  
temp.tL_2 = C2K(16);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = {'HaywBurn2003'};
comment.tL_2 = 'on diet of Phaeocystis';
%
data.tL_3 = [ ... % time (d),  length (mm)
5	1.132
9	1.565
10	2.177
15	2.35
25	2.65
28	2.754
38	3.593
47	4.485
55	4.843
61	5.537
74	6.024
93	7.063
95	7.179
];
data.tL_3(:,2) = data.tL_3(:,2)/10; % convert mm to cm
units.tL_3   = {'d','cm'};  label.tL_3 = {'time since birth', 'length'};  
temp.tL_3 = C2K(16);  units.temp.tL_3 = 'K'; label.temp.tL_3 = 'temperature';
bibkey.tL_3 = {'HaywBurn2003'};
comment.tL_3 = 'on diet of Heterocaspa';

% length-dry weight (New Zealand)
data.LWd = [... % lenght (cm), dry weight (g)
0.4129	0.000064
0.4354	0.000047
0.45	0.000117
0.4596	0.000092
0.4971	0.000134
0.5018	0.00011
0.5018	0.000122
0.5349	0.000158
0.5776	0.000162
0.5965	0.000156
0.606	0.000179
0.669	0.000304
0.7063	0.000276
0.7249	0.000274
0.8554	0.000442
0.8728	0.000532
0.9156	0.000855
0.9775	0.00085
1.0333	0.001116
1.0715	0.001275
1.0842	0.001179
1.1478	0.001644
1.2428	0.001777
1.2487	0.001936
1.268	0.001942
1.2705	0.002703
1.3153	0.002257
1.3535	0.002326
1.398	0.002368
1.4559	0.003051
1.6141	0.003997
1.6332	0.003942
1.7161	0.004734
1.735	0.004692
1.7416	0.004664
];
units.LWd = {'cm','g'}; label.LWd = {'length','dry weight'};
temp.LWd = C2K(12); units.temp.LWd = 'K'; label.temp.LWd = 'temperature';
bibkey.LWd = 'Lagos2016';
comment.LWd = 'measurements from summer 2016';

% length-wet weight (New Zealand)
data.LWw = [
0.01532	0.01043	0.01025	0.01149	0.01343	0.01364	0.01063	0.01695	0.01209	0.01278	0.0154	0.00935	0.0191	0.01785	0.01524	0.02051	0.0171	0.01737	0.01443	0.01551	0.01857	0.0177	0.01477	0.0152	0.01766	0.01586	0.01694	0.01843	0.01317	0.01375	0.01705	0.01713	0.01723	0.01927	0.02037	0.0201	0.01751	0.01815	0.01939	0.01968	0.01896	0.02199	0.01205	0.02409	0.0258	0.01981	0.02872	0.02716	0.02047	0.03655;
14.63447	11.2182	12.30985	12.55719	12.80903	12.87113	12.90684	12.91977	13.09832	13.11312	13.14989	13.31463	13.50397	13.56371	13.56666	13.62564	13.67236	13.77719	13.80687	13.86429	13.88543	13.93272	13.99591	14.04773	14.10469	14.15596	14.1806	14.19364	14.26946	14.31545	14.43865	14.46686	14.48307	14.52374	14.60027	14.67803	14.68163	14.69251	14.73709	14.90141	14.90735	14.94663	14.98145	15.04835	15.25361	15.28364	15.87316	16.33135	17.21109	17.25719]';
data.LWw = [data.LWw(:,2), data.LWw(:,1)]; % re-order column to length mm and wet weight g
data.LWw(:,1) = data.LWw(:,1)/ 10; % mm to cm
units.LWw = {'cm','g'}; label.LWw = {'length','wet weight'};
bibkey.LWw = 'Lagos2016';
comment.LWw = 'measurements from summer 2016';

% lenght-dry weight (Australia)
data.LWd_2 = [...
11.00 1.43
13.67 2.7714
15.10 3.7520
16.45 4.8697
17.47 5.8487
18.26 6.6918
19.05 7.1612
19.84 8.6156
20.03 9.7025
];
data.LWd_2(:,1) = data.LWd_2(:,1)/10; % convert mm to cm
data.LWd_2(:,2) = data.LWd_2(:,2)/1000; % convert mg to g
units.LWd_2 = {'cm','g'}; label.LWd_2 = {'length','dry weight'};
temp.LWd_2 = C2K(12); units.temp.LWd_2 = 'K'; label.temp.LWd_2 = 'temperature';
bibkey.LWd_2 = 'Hosi1982';
comment.LWd_2 = 'measurements from table 3.5';
%
data.tW = [ ... % time (d), dry weight (g)
0   1E-06
33  7.08E-05
96  0.0010895
139 0.0028967
209 0.0054213
249 0.0063626
275 0.0069632
];
units.tW   = {'d', 'g'};  label.tW = {'Days', 'Dry weight'};  
temp.tW    = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'Hosi1982'};
comment.tW = 'from table 5.3';
%
data.LN = [ ...dry weight krill (mg), number of eggs (#)
8.01    167.21
7.08    104.90
6.89    126.10
6.44    134.95
5.90    134.66
5.90    118.55
3.83    131.91
4.48    122.26
4.52    116.90
2.45    71.19
2.68    77.10
2.96    61.27
3.01    66.91
3.42    59.95
4.60    66.70
4.92    75.03
3.27    77.66
3.10    107.18
3.10    109.06
3.43    108.00
3.58    88.95
3.70    85.46
3.91    87.35
3.98    82.78
4.01    94.87
4.39    95.68
4.62    93.01
4.69    95.96
4.80    98.11
4.95    103.49	
];
W = (data.LN(:,1)/1000); % converting mg to g
N = data.LN(:,2);  
[Y,I] = sort(W); N = N(I); %sort rows
data.LN = [Y, N];
units.LN = {'g','# eggs'}; label.LN = {'Weigth','eggs per female'};
temp.LN = C2K(12); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Hosi1982';
comment.LN = 'Data from figure 3.3';
%
data.tN = [... time (d), #eggs
    0   0
    100 49
    130 72
    160 89
    190 109
    220 126
    250 140
    280 156
    310 174
    340 193];
data.tN = [data.tN(:,1), cumsum(data.tN(:,2))];
units.tN   = {'d','cm'};  label.tN = {'time since start', 'cumulated number of eggs'};  
temp.tN   = C2K(12);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = {'Hosi1982'};
comment.tN = 'from table 3.5'; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Temperature - oxygen consumption data  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%      1) Negative Control (Dark)        %%%%

%%% DARK-LOW dose
data.TJO_LD = [...Temp(K)-O2 Consumption
281.15	17.0776
281.15	16.0876
281.15	36.7654
281.15	19.8644
281.15	21.8754
281.15	19.5433
285.15	29.9876
285.15	19.8764
285.15	18.7655
285.15	31.5544
285.15	23.7544
285.15	19.8765
286.15	46.1462
286.15	43.9957
286.15	42.159
286.15	28.3795
289.15	58.4157
289.15	48.221
289.15	39.9068
289.15	30.5892
289.15	35.2278
292.15  46.9410
292.15  47.7745
292.15  57.8120
292.15  52.8348
292.15  56.5898
];
data.TJO_LD(:,2) = data.TJO_LD(:,2)/3; % oxygen for 3 individuals brought down to one individual
units.TJO_LD = {'K', 'ug/h.g'}; label.TJO_LD = {'Temperature', 'O2 consumption'};  
bibkey.TJO_LD = 'Lagos2016';
comment.TJO_LD = 'Low-DARK treatment';
%
% %%% DARK-HIGH
data.TJO_HD = [...Temp(K)-O2 Consumption
281.15	33.7656
281.15	37.7554
281.15	37.7655
281.15	30.9877
281.15	31.9877
281.15	24.7655
285.15	28.9779
285.15	26.9766
285.15	31.0876
285.15	31.7553
285.15	20.9766
285.15	21.7556
286.15	62.8000
286.15	56.2725
286.15	64.4389
286.15	62.8000
286.15	56.2725
286.15	64.4389
289.15  37.4358
289.15  21.4787
289.15  26.7570
289.15  36.7142
289.15  38.7698
289.15  31.8652
292.15  48.4868
292.15  40.1469
292.15  61.3015
292.15  57.4898
292.15  53.9485
];
data.TJO_HD(:,2) = data.TJO_HD(:,2)/3; % oxygen for 3 individuals brought down to one individual
units.TJO_HD = {'K', 'ug/h.g'}; label.TJO_HD = {'Temperature', 'O2 consumption'};  
bibkey.TJO_HD = 'Lagos2016';
comment.TJO_HD = 'High-DARK treatment';
%
% 
% %%%%     2) Positive control (PAR)    %%%%
%%% PAR-LOW dose 
data.TJO_LP = [...Temp(K)-O2 Consumption
281.15	21.8767
281.15	20.8654
281.15	27.6544
281.15	23.7544
281.15	21.0965
281.15	22.497
285.15	30.9766
285.15	31.9876
285.15	31.4457
285.15	28.8654
285.15	35.7655
285.15	32.7442
286.15	50.9463
286.15	56.2342
286.15	44.3927
286.15	51.4883
286.15	45.2342
286.15	50.022
289.15	70.1617
289.15	72.755
289.15	73.9906
289.15	70.2172
289.15	72.864
289.15	73.2706  
292.15  92.4255
292.15  58.1256
292.15  54.7010
292.15  83.5287
292.15  55.2613
];
data.TJO_LP(:,2) = data.TJO_LP(:,2)/3; % oxygen for 3 individuals brought down to one individual
units.TJO_LP = {'K', 'ug/h.g'}; label.TJO_LP = {'Temperature', 'O2 consumption'};  
bibkey.TJO_LP = 'Lagos2016';
comment.TJO_LP = 'Low PAR treatments';
% %
% %%% PAR-HIGH
data.TJO_HP = [...Temperature (K) - O2 consumption-High dose PAR treatment
281.15	44.6558
281.15	44.7654
281.15	26.8766
281.15	40.9777
281.15	38.5446
281.15	32.8766
285.15	41.9687
285.15	35.6547
285.15	41.0745
285.15	38.4887
285.15	34.7555
285.15	30.7657
286.15	66.0851
286.15	71.9686
286.15	59.6607
286.15	66.0851
286.15	71.9686
286.15	59.6607
289.15	34.3217
289.15	33.2588
289.15	17.8485
289.15	27.7315
289.15	31.7778
289.15	52.6753
289.15	51.4345
289.15	50.2413
289.15	49.1341
289.15	57.2349
289.15	61.4423
289.15	47.3341
292.15	121.022
292.15	118.380
292.15	115.652
292.15	86.6833
292.15	84.892
292.15	94.1876
];
data.TJO_HP(:,2) = data.TJO_HP(:,2)/3; % oxygen for 3 individuals brought down to one individual
units.TJO_HP = {'K', 'ug/h.g'}; label.TJO_HP = {'Temperature', 'O2 consumption'};  
bibkey.TJO_HP = 'Lagos2016';
comment.TJO_HP = 'High PAR treatments';
% % 
% 
% %%%%    3) Experimental treatment (UV)    %%%%
% %%% LOW-UV
data.TJO_LUV = [...Temp(ºK)-O2 Consumption
281.15	42.4764
281.15	43.8767
281.15	43.7545
281.15	31.7667
281.15	33.7654
281.15	27.6544
285.15	40.9766
285.15	44.7656
285.15	46.8766
285.15	35.7552
285.15	40.7545
285.15	41.6444
286.15	72.4687
286.15	73.701
286.15	65.218
286.15	68.0145
286.15	60.0107
286.15	42.091
289.15	90.3417
289.15	93.7334
289.15	70.1897
289.15	83.2143
289.15	80.0597
289.15	70.1891
292.15  118.85
292.15  119.58
292.15  116.49
292.15  103.41
292.15  99.32
292.15  85.97

];
data.TJO_LUV(:,2) = data.TJO_LUV(:,2)/3; % oxygen for 3 individuals brought down to one individual
units.TJO_LUV = {'K', 'ug/h.g'}; label.TJO_LUV = {'Temperature', 'O2 consumption'};  
bibkey.TJO_LUV = 'Lagos2016';
comment.TJO_LUV = 'Low UV treatments';
% %
%%% HIGH-UV
data.TJO_HUV = [...Temp(K)-O2 consumption
281.15	58.9866
281.15	59.7655
281.15	39.8756
281.15	50.9866
281.15	48.7655
281.15	41.9407
285.15	61.529
285.15	64.2042
285.15	64.0324
285.15	65.7552
285.15	71.4698
285.15	50.7568
286.15	60.3294
286.15	93.6255
286.15	87.1467
286.15	59.888
286.15	64.6452
286.15	87.0881
289.15	49.5272
289.15	50.231
289.15	52.8546
289.15	74.8524
289.15	73.9111
289.15	85.1198
289.15	69.3414
289.15	77.2342
289.15	83.2342
289.15	65.2341
289.15	70.2341
289.15	71.9345
292.15	159.9808
292.15	165.3449
292.15	152.2342
292.15	138.8598
292.15	184.5832
292.15	156.4996
];
data.TJO_HUV(:,2) = data.TJO_HUV(:,2)/3; % oxygen for 3 individuals brought down to one individual
units.TJO_HUV = {'K', 'ug/h.g'}; label.TJO_HUV = {'Temperature', 'O2 consumption'};  
bibkey.TJO_HUV = 'Lagos2016';
comment.TJO_HUV = 'High UV treatments';
%
%% Time - FA cncentration
% Negative control (DARK)
% (1) MUFA's
data.tMUFA_DARK8 = [... Time ~ MUFA (C-mol); 8 deg C
    0.00  9.090193e-06 % wild
    1.16  2.23268E-06  % 4H high   
    1.33  2.06566E-06  % 8H high    
    ];
units.tMUFA_DARK8   = {'days', 'c-mol/g DW'}; label.tMUFA_DARK8 = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_DARK8    = C2K(8);  units.temp.tMUFA_DARK8 = 'K'; label.temp.tMUFA_DARK8 = 'temperature';
bibkey.tMUFA_DARK8  = 'Lagos2016';
comment.tMUFA_DARK8 = 'MUFA control (-)';

data.tMUFA_DARK12 = [... Time ~ MUFA (C-mol); 12 deg C
    0.00  9.090193e-06 % wild
    1.16  3.16099E-06  % 4H high   
    1.33  3.19796E-06 % 8H high    
    ];
units.tMUFA_DARK12   = {'days', 'c-mol/g DW'}; label.tMUFA_DARK12 = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_DARK12    = C2K(12);  units.temp.tMUFA_DARK12 = 'K'; label.temp.tMUFA_DARK12 = 'temperature';
bibkey.tMUFA_DARK12  = 'Lagos2016';
comment.tMUFA_DARK12 = 'MUFA control (-)';

data.tMUFA_DARK13 = [... Time ~ MUFA (C-mol); 13 deg C
    0.00  9.090193e-06 % wild
    1.16  5.77219E-06  % 4H high   
    1.33  4.76609E-06 % 8H high    
    ];
units.tMUFA_DARK13   = {'days', 'c-mol/g DW'}; label.tMUFA_DARK13 = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_DARK13    = C2K(13);  units.temp.tMUFA_DARK13 = 'K'; label.temp.tMUFA_DARK13 = 'temperature';
bibkey.tMUFA_DARK13  = 'Lagos2016';
comment.tMUFA_DARK13= 'MUFA control (-)';

data.tMUFA_DARK16 = [... Time ~ MUFA (C-mol); 16 deg C
    0.00  9.090193e-06 % wild
    1.16  4.04167E-06   % 4H high   
    1.33  4.0374E-06   % 8H high    
    ];
units.tMUFA_DARK16   = {'days', 'c-mol/g DW'}; label.tMUFA_DARK16 = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_DARK16    = C2K(16);  units.temp.tMUFA_DARK16 = 'K'; label.temp.tMUFA_DARK16 = 'temperature';
bibkey.tMUFA_DARK16  = 'Lagos2016';
comment.tMUFA_DARK16 = 'MUFA control (-)';

data.tMUFA_DARK19 = [... Time ~ MUFA (C-mol); 19 deg C 
    0.00  9.090193e-06 % wild
    1.16  5.18692E-07   % 4H high   
    1.33  4.60124E-07   % 8H high    
    ];
units.tMUFA_DARK19   = {'days', 'c-mol/g DW'}; label.tMUFA_DARK19 = {'Time', 'FA and AA concentrations'};  
temp.tMUFA_DARK19    = C2K(19);  units.temp.tMUFA_DARK19 = 'K'; label.temp.tMUFA_DARK19 = 'temperature';
bibkey.tMUFA_DARK19  = 'Lagos2016';
comment.tMUFA_DARK19 = 'MUFA control (-)';

% (2) PUFA's
data.tPUFA_DARK8 = [... Time ~ PUFA (C-mol); 8 deg C
    0.00  1.669525e-05 % wild
    1.16  4.42406E-06  % 4H high   
    1.33  3.80011E-06  % 8H high    
    ];
units.tPUFA_DARK8   = {'days', 'c-mol/g DW'}; label.tPUFA_DARK8 = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_DARK8    = C2K(8);  units.temp.tPUFA_DARK8 = 'K'; label.temp.tPUFA_DARK8 = 'temperature';
bibkey.tPUFA_DARK8 = 'Lagos2016';
comment.tPUFA_DARK8 = 'PUFA control (-)';

data.tPUFA_DARK12 = [... Time ~ PUFA (C-mol); 12 deg C
    0.00  1.669525e-05 % wild
    1.16  5.73064E-06   % 4H high   
    1.33  5.32996E-06   % 8H high    
    ];
units.tPUFA_DARK12   = {'days', 'c-mol/g DW'}; label.tPUFA_DARK12 = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_DARK12    = C2K(12);  units.temp.tPUFA_DARK12 = 'K'; label.temp.tPUFA_DARK12 = 'temperature';
bibkey.tPUFA_DARK12 = 'Lagos2016';
comment.tPUFA_DARK12 = 'PUFA control (-)';

data.tPUFA_DARK13 = [... Time ~ PUFA (C-mol); 13 deg C
    0.00  1.669525e-05 % wild
    1.16  9.63395E-06  % 4H high   
    1.33  7.27957E-06 % 8H high    
    ];
units.tPUFA_DARK13   = {'days', 'c-mol/g DW'}; label.tPUFA_DARK13 = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_DARK13    = C2K(13);  units.temp.tPUFA_DARK13 = 'K'; label.temp.tPUFA_DARK13 = 'temperature';
bibkey.tPUFA_DARK13 = 'Lagos2016';
comment.tPUFA_DARK13 = 'PUFA control (-)';

data.tPUFA_DARK16 = [... Time ~ PUFA (C-mol); 16 deg C
    0.00  1.669525e-05 % wild
    1.16  4.97394E-06   % 4H high   
    1.33  5.76187E-06  % 8H high    
    ];
units.tPUFA_DARK16   = {'days', 'c-mol/g DW'}; label.tPUFA_DARK16 = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_DARK16    = C2K(16);  units.temp.tPUFA_DARK16 = 'K'; label.temp.tPUFA_DARK16 = 'temperature';
bibkey.tPUFA_DARK16 = 'Lagos2016';
comment.tPUFA_DARK16 = 'PUFA control (-)';

data.tPUFA_DARK19 = [... Time ~ PUFA (C-mol); 19 deg C
    0.00  1.669525e-05 % wild
    1.16  1.41825E-06  % 4H high   
    1.33  1.26259E-06 % 8H high    
    ];
units.tPUFA_DARK19   = {'days', 'c-mol/g DW'}; label.tPUFA_DARK19 = {'Time', 'FA and AA concentrations'};  
temp.tPUFA_DARK19    = C2K(19);  units.temp.tPUFA_DARK19 = 'K'; label.temp.tPUFA_DARK19 = 'temperature';
bibkey.tPUFA_DARK19  = 'Lagos2016';
comment.tPUFA_DARK19 = 'PUFA control (-)';

% (3) SAFA`s
data.tSAFA_DARK8 = [... Time ~ SAFA (C-mol); 8 deg C
    0.00   5.955717e-06 % wild
    1.16   7.65115E-07  % 4H high   
    1.33   6.02597E-07   % 8H high    
    ];
units.tSAFA_DARK8   = {'days', 'c-mol/g DW'}; label.tSAFA_DARK8 = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_DARK8   = C2K(8);  units.temp.tSAFA_DARK8 = 'K'; label.temp.tSAFA_DARK8 = 'temperature';
bibkey.tSAFA_DARK8 = 'Lagos2016';
comment.tSAFA_DARK8 = 'SAFA control (-)';

data.tSAFA_DARK12 = [... Time ~ SAFA (C-mol); 12 deg C
    0.00   5.955717e-06 % wild
    1.16   1.38836E-07 % 4H high   
    1.33   1.48189E-07 % 8H high    
    ];
units.tSAFA_DARK12   = {'days', 'c-mol/g DW'}; label.tSAFA_DARK12 = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_DARK12   = C2K(12);  units.temp.tSAFA_DARK12 = 'K'; label.temp.tSAFA_DARK12 = 'temperature';
bibkey.tSAFA_DARK12 = 'Lagos2016';
comment.tSAFA_DARK12 = 'SAFA control (-)';

data.tSAFA_DARK13 = [... Time ~ SAFA (C-mol); 13 deg C
    0.00   5.955717e-06 % wild
    1.16   1.70627E-06   % 4H high   
    1.33   1.64058E-06   % 8H high    
    ];
units.tSAFA_DARK13   = {'days', 'c-mol/g DW'}; label.tSAFA_DARK13 = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_DARK13   = C2K(13);  units.temp.tSAFA_DARK13 = 'K'; label.temp.tSAFA_DARK13 = 'temperature';
bibkey.tSAFA_DARK13 = 'Lagos2016';
comment.tSAFA_DARK13 = 'SAFA control (-)';

data.tSAFA_DARK16 = [... Time ~ SAFA (C-mol); 16 deg C
    0.00   5.955717e-06 % wild
    1.16   3.66342E-07   % 4H high   
    1.33   1.9666E-07   % 8H high    
    ];
units.tSAFA_DARK16   = {'days', 'c-mol/g DW'}; label.tSAFA_DARK16 = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_DARK16   = C2K(16);  units.temp.tSAFA_DARK16 = 'K'; label.temp.tSAFA_DARK16 = 'temperature';
bibkey.tSAFA_DARK16 = 'Lagos2016';
comment.tSAFA_DARK16 = 'SAFA control (-)';
%
data.tSAFA_DARK19 = [... Time ~ SAFA (C-mol); 19 deg C
    0.00   5.955717e-06 % wild
    1.16   3.21187E-08   % 4H high   
    1.33   1.99257E-08  % 8H high    
    ];
units.tSAFA_DARK19   = {'days', 'c-mol/g DW'}; label.tSAFA_DARK19 = {'Time', 'FA and AA concentrations'};  
temp.tSAFA_DARK19    = C2K(19);  units.temp.tSAFA_DARK19 = 'K'; label.temp.tSAFA_DARK19 = 'temperature';
bibkey.tSAFA_DARK19  = 'Lagos2016';
comment.tSAFA_DARK19 = 'SAFA control (-)';
%
data.tUFA_DARK8 = [... Time ~ UFA (C-mol); 8 deg C
    0.00    6.29169e-06 % wild
    1.16    3.63168E-07 % 4H high   
    1.33    4.32733E-07 % 8H high    
    ];
units.tUFA_DARK8   = {'days', 'c-mol/g DW'}; label.tUFA_DARK8 = {'Time', 'FA and AA concentrations'};  
temp.tUFA_DARK8    = C2K(8);  units.temp.tUFA_DARK8 = 'K'; label.temp.tUFA_DARK8 = 'temperature';
bibkey.tUFA_DARK8  = 'Lagos2016';
comment.tUFA_DARK8 = 'SAFA control (-)';
%
data.tUFA_DARK12 = [... Time ~ UFA (C-mol); 12 deg C
    0.00    6.29169e-06 % wild
    1.16    1.71591E-07 % 4H high   
    1.33    1.6691E-07  % 8H high    
    ];
units.tUFA_DARK12   = {'days', 'c-mol/g DW'}; label.tUFA_DARK12 = {'Time', 'FA and AA concentrations'};  
temp.tUFA_DARK12    = C2K(12);  units.temp.tUFA_DARK12 = 'K'; label.temp.tUFA_DARK12 = 'temperature';
bibkey.tUFA_DARK12  = 'Lagos2016';
comment.tUFA_DARK12 = 'SAFA control (-)';
%
data.tUFA_DARK13 = [... Time ~ UFA (C-mol); 13 deg C
    0.00    6.29169e-06 % wild
    1.16    4.79705E-07 % 4H high   
    1.33    5.54745E-07 % 8H high    
    ];
units.tUFA_DARK13   = {'days', 'c-mol/g DW'}; label.tUFA_DARK13 = {'Time', 'FA and AA concentrations'};  
temp.tUFA_DARK13    = C2K(13);  units.temp.tUFA_DARK13 = 'K'; label.temp.tUFA_DARK13 = 'temperature';
bibkey.tUFA_DARK13  = 'Lagos2016';
comment.tUFA_DARK13 = 'SAFA control (-)';
%
data.tUFA_DARK16 = [... Time ~ UFA (C-mol); 16 deg C
    0.00    6.29169e-06 % wild
    1.16    3.22282E-07 % 4H high   
    1.33    3.43229E-07 % 8H high    
    ];
units.tUFA_DARK16   = {'days', 'c-mol/g DW'}; label.tUFA_DARK16 = {'Time', 'FA and AA concentrations'};  
temp.tUFA_DARK16    = C2K(16);  units.temp.tUFA_DARK16 = 'K'; label.temp.tUFA_DARK16 = 'temperature';
bibkey.tUFA_DARK16  = 'Lagos2016';
comment.tUFA_DARK16 = 'SAFA control (-)';
%
data.tUFA_DARK19 = [... Time ~ UFA (C-mol); 19 deg C
    0.00    6.29169e-06 % wild
    1.16    9.61194E-07 % 4H high   
    1.33    1.74487E-07 % 8H high    
    ];
units.tUFA_DARK19   = {'days', 'c-mol/g DW'}; label.tUFA_DARK19 = {'Time', 'FA and AA concentrations'};  
temp.tUFA_DARK19    = C2K(19);  units.temp.tUFA_DARK19 = 'K'; label.temp.tUFA_DARK19 = 'temperature';
bibkey.tUFA_DARK19  = 'Lagos2016';
comment.tUFA_DARK19 = 'SAFA control (-)';
%% Time - AA concentration (c-mol)
% reduction in time of all esseantial amino acids (EAA) and non-essential amino acids (NEAA) for low and
% high UV treatments plus positve (PAR) and negative (DARK) control treatments
%
data.tEAA_8DARK = [...
      0.00    8.07417E-06 % wild
      1.16    3.404613e-06 % 4h 
      1.33    3.396583e-06 % 8h 
      ];
units.tEAA_8DARK = {'days', 'c-mol/g DW'}; label.tEAA_8DARK = {'Time', 'FA and AA concentrations'};  
temp.tEAA_8DARK  = C2K(8);  units.temp.tEAA_8DARK = 'K'; label.temp.tEAA_8DARK = 'temperature';
bibkey.tEAA_8DARK = 'Lagos2016';
comment.tEAA_8DARK = 'EAA DARK';
%
data.tNEAA_8DARK = [...
      0.00    3.815797e-06 % wild
      1.16    2.435130e-06 % 4h 
      1.33    2.449897e-06 % 8h 
      ];
units.tNEAA_8DARK = {'days', 'c-mol/g DW'}; label.tNEAA_8DARK = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_8DARK  = C2K(8);  units.temp.tNEAA_8DARK = 'K'; label.temp.tNEAA_8DARK = 'temperature';
bibkey.tNEAA_8DARK = 'Lagos2016';
comment.tNEAA_8DARK = 'NEAA for DARK at 8ºC';
%
data.tEAA_12DARK = [...
      0.00    8.07417E-06 % wild
      1.16    2.747869e-06 % 4h 
      1.33    3.096296e-06 % 8h 
      ];
units.tEAA_12DARK = {'days', 'c-mol/g DW'}; label.tEAA_12DARK = {'Time', 'FA and AA concentrations'};  
temp.tEAA_12DARK  = C2K(12);  units.temp.tEAA_12DARK = 'K'; label.temp.tEAA_12DARK = 'temperature';
bibkey.tEAA_12DARK = 'Lagos2016';
comment.tEAA_12DARK = 'EAA for DARK at 12ºC';
%
data.tNEAA_12DARK = [...
      0.00    3.815797e-06 % wild
      1.16    2.461397e-06 % 4h 
      1.33    2.581516e-06 % 8h 
      ];
units.tNEAA_12DARK = {'days', 'c-mol/g DW'}; label.tNEAA_12DARK = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_12DARK  = C2K(12);  units.temp.tNEAA_12DARK = 'K'; label.temp.tNEAA_12DARK = 'temperature';
bibkey.tNEAA_12DARK = 'Lagos2016';
comment.tNEAA_12DARK = 'NEAA for DARK at 12ºC';
%
data.tEAA_13DARK = [...
      0.00    8.07417E-06 % wild
      1.16    5.683212e-06 % 4h 
      1.33    5.18854e-06  % 8h 
      ];
units.tEAA_13DARK = {'days', 'c-mol/g DW'}; label.tEAA_13DARK = {'Time', 'FA and AA concentrations'};  
temp.tEAA_13DARK  = C2K(13);  units.temp.tEAA_13DARK = 'K'; label.temp.tEAA_13DARK = 'temperature';
bibkey.tEAA_13DARK = 'Lagos2016';
comment.tEAA_13DARK = 'EAA for DARK at 13ºC';
%
data.tNEAA_13DARK = [...
      0.00    3.815797e-06 % wild
      1.16    3.699748e-06 % 4h 
      1.33    3.734223e-06 % 8h 
      ];
units.tNEAA_13DARK = {'days', 'c-mol/g DW'}; label.tNEAA_13DARK = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_13DARK  = C2K(13);  units.temp.tNEAA_13DARK = 'K'; label.temp.tNEAA_13DARK = 'temperature';
bibkey.tNEAA_13DARK = 'Lagos2016';
comment.tNEAA_13DARK = 'NEAA for DARK at 13ºC';   
%
data.tEAA_16DARK = [...
      0.00    8.07417E-06 % wild
      1.16    5.639168e-06 % 4h 
      1.33    5.813022e-06 % 8h 
      ];
units.tEAA_16DARK = {'days', 'c-mol/g DW'}; label.tEAA_16DARK = {'Time', 'FA and AA concentrations'};  
temp.tEAA_16DARK  = C2K(16);  units.temp.tEAA_16DARK = 'K'; label.temp.tEAA_16DARK = 'temperature';
bibkey.tEAA_16DARK = 'Lagos2016';
comment.tEAA_16DARK = 'EAA for DARK at 16ºC';     
%
data.tNEAA_16DARK = [...
      0.00    3.815797e-06 % wild
      1.16    3.462954e-06 % 4h 
      1.33    3.112245e-06 % 8h 
      ];
units.tNEAA_16DARK = {'days', 'c-mol/g DW'}; label.tNEAA_16DARK = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_16DARK  = C2K(16);  units.temp.tNEAA_16DARK = 'K'; label.temp.tNEAA_16DARK = 'temperature';
bibkey.tNEAA_16DARK = 'Lagos2016';
comment.tNEAA_16DARK = 'NEAA for DARK at 16ºC';
%    
data.tEAA_19DARK = [...
      0.00    8.07417E-06 % wild
      1.16    5.613581e-06 % 4h 
      1.33    5.322259e-06 % 8h 
      ];
units.tEAA_19DARK  = {'days', 'c-mol/g DW'}; label.tEAA_19DARK  = {'Time', 'FA and AA concentrations'};  
temp.tEAA_19DARK   = C2K(19);  units.temp.tEAA_19DARK  = 'K'; label.temp.tEAA_19DARK  = 'temperature';
bibkey.tEAA_19DARK  = 'Lagos2016';
comment.tEAA_19DARK  = 'EAA for DARK at 19ºC';
%
data.tNEAA_19DARK = [...
      0.00    3.815797e-06 % wild
      1.16    3.429333e-06 % 4h 
      1.33    3.327433e-06 % 8h 
      ];
units.tNEAA_19DARK = {'days', 'c-mol/g DW'}; label.tNEAA_19DARK = {'Time', 'FA and AA concentrations'};  
temp.tNEAA_19DARK = C2K(19);  units.temp.tNEAA_19DARK = 'K'; label.temp.tNEAA_19DARK = 'temperature';
bibkey.tNEAA_19DARK = 'Lagos2016';
comment.tNEAA_19DARK  = 'NEAA for DARK at 19ºC';

%% set weights for all real data
weights      = setweights(data, []);
weights.ab   = 0 * weights.ab;
weights.Lb   = 0 * weights.Lb;
weights.Li   = 0 * weights.Li;
weights.tL_1 = 3 * weights.tL_1;
weights.tL_2 = 3 * weights.tL_2;
weights.tL_3 = 3 * weights.tL_3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v   = 3 * weights.psd.v;
weights.psd.kap = 3 * weights.psd.kap;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1','tL_2','tL_3'}; 
comment1 = {'diets: Thalassiosira, Phaeocystis, Heterocaspa'};

set2 = {'LWd','LWd_2'}; 
comment2 = {'Oz and NZ krill'};

% set3 = {'TJO_LD','TJO_LP','TJO_LUV'}; 
% comment3 = {'Resp low treatments'};
% 
% set4 = {'TJO_HD','TJO_HP','TJO_HUV'}; 
% comment4 = {'Resp high treatments'};

set9 = {'tMUFA_DARK8','tPUFA_DARK8','tSAFA_DARK8','tUFA_DARK8','tEAA_8DARK','tNEAA_8DARK'}; 
comment9 = {'set9, FA and AA at 8ºC, Dark'};

set13 = {'tMUFA_DARK12','tPUFA_DARK12','tSAFA_DARK12','tUFA_DARK12','tEAA_12DARK','tNEAA_12DARK'}; 
comment13 = {'set13, FA and AA at 12ºC, for DARK'};

set17 = {'tMUFA_DARK13','tPUFA_DARK13','tSAFA_DARK13','tUFA_DARK13','tEAA_13DARK','tNEAA_13DARK'};
comment17 = {'set17, FA and AA at 13ºC,  DARK'};

set21 = {'tMUFA_DARK16','tPUFA_DARK16','tSAFA_DARK16','tUFA_DARK16','tEAA_16DARK','tNEAA_16DARK'};
comment21 = {'set21, FA at 16ºC, DARK'};

set22 = {'tMUFA_DARK19','tPUFA_DARK19','tSAFA_DARK19','tUFA_DARK19','tEAA_19DARK','tNEAA_19DARK'};
comment22 = {'set22, FA at 19ºC, DARK'};

metaData.grp.sets = {set1,  set2, set9, set13, set17,... 
                     set21, set22}; 
                 
metaData.grp.comment = {comment1,  comment2,comment9,...
                        comment13, comment17, comment21, comment22};

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



