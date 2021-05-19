function [prdData, info] = predict_Nyctiphanes_australis(par, data, auxData)
    
% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); %report_animal(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

% compute temperature correction factors
pars_T = [T_A; T_L; T_H; T_AL; T_AH];
TC_ab      = tempcorr(temp.ab, T_ref, pars_T);
TC_tp      = tempcorr(temp.tp, T_ref, pars_T);
TC_am      = tempcorr(temp.am, T_ref, pars_T);
TC_LN      = tempcorr(temp.LN, T_ref, pars_T);
TC_Ni      = tempcorr(temp.Ni, T_ref, pars_T);
TC_Ri      = tempcorr(temp.Ri, T_ref, pars_T);
TC_TJO_LD  = tempcorr(data.TJO_LD (:,1), T_ref, pars_T);
TC_TJO_HD  = tempcorr(data.TJO_HD (:,1), T_ref, pars_T);
TC_TJO_LP  = tempcorr(data.TJO_LP (:,1), T_ref, pars_T);
TC_TJO_HP  = tempcorr(data.TJO_HP (:,1), T_ref, pars_T);
TC_TJO_LUV = tempcorr(data.TJO_LUV(:,1), T_ref, pars_T);
TC_TJO_HUV = tempcorr(data.TJO_HUV(:,1), T_ref, pars_T);
TC_8   = tempcorr(temp.tMUFA_DARK8,  T_ref, pars_T);
TC_12  = tempcorr(temp.tMUFA_DARK12, T_ref, pars_T);
TC_13  = tempcorr(temp.tMUFA_DARK13, T_ref, pars_T);
TC_16  = tempcorr(temp.tMUFA_DARK16, T_ref, pars_T);
TC_19  = tempcorr(temp.tMUFA_DARK19, T_ref, pars_T);


% zero-variate datap
% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp; f];
[tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);

% initial (eggs)
pars_UE0 = [V_Hb; g; k_J; k_M; v];
[U_E0, L_b, info] = initial_scaled_reserve(f, pars_UE0);
E_0 = U_E0 * p_Am;                       % J, energy in egg at start
Wd_0 = E_0 * w_E/ mu_E;                  % g,  dry weight of egg
Lw_0 = (Wd_0 / (d_E * del_Y^3))^.1/3;    % cm, diameter of egg from Augustine, Litvak & Kooijman 2011
V_egg = (4/3) * 3.14 * (Lw_0 / 2)^3 ;    % cm^3, volume of egg

% birth
L_b  = L_m * l_b;            % cm, structural length at birth at f
Lw_b = L_b/del_M;            % cm, total length at birth at f
aT_b = tau_b/ k_M/ TC_ab;    % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                     % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                   % cm, total length at puberty at f
tT_p = (tau_p - tau_b)/ k_M/ TC_tp;  % d, time since birth at puberty at f and

% Dry-weight at 1.45 cm
Wd_14 = (1.45 * del_M)^3 * d_V * (1 + f * w); % g, dry weight at 1.45 cm

% ultimate
L_i  = f * L_m - L_T;             % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate total length at f
Ww_i = L_i^3 * (1 + f * w);       % g, wet weight

% % life span
% pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
% tau_m  = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
% a_m  = tau_m/ k_M;  % d, mean life span at T_ref and f
% aT_m = a_m/ TC_am;   % d, mean life span at T and f

% life span
h3_W = f * h_a * v/ 6/ L_p;        % 1/d^3, cubed Weibull ageing rate
aT_m = gamma(4/3)/ h3_W^(1/3)/ TC_am; % d, mean life span at T

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
N_i = cum_reprod(aT_m * TC_Ni, f, pars_R);             % #, lifetime reproductive output at T

pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
   
% pack to output
prdData.ab   = aT_b;
prdData.tp   = tT_p;
prdData.am   = aT_m;
prdData.Lp   = Lw_p;
prdData.Lb   = Lw_b;
prdData.Li   = Lw_i;
prdData.Ni   = N_i;
prdData.Ri   = RT_i;
prdData.Wd0  = Wd_0;
prdData.Lw0  = Lw_0;
prdData.Vegg = V_egg;
prdData.Wwi  = Ww_i;
prdData.Wd14 = Wd_14;

% uni-variate data
%
% time-length tl_1 at f1
rT_B = TC_ab * k_M/ 3/ (1 + f_tL1/ g);
L_i = L_m * f_tL1;
ELw_1 = (L_i - (L_i - L_b) * exp( - rT_B * tL_1(:,1)))/ del_M; % cm, length at time
%
% Time-Length tl_2 at f2
rT_B = TC_ab * k_M/ 3/ (1 + f_tL2/ g);
L_i = L_m * f_tL2;
ELw_2 = (L_i - (L_i - L_b) * exp( - rT_B * tL_2(:,1)))/ del_M; % cm, length at time
%
% Time-Length tl_3 at f2
rT_B = TC_ab * k_M/ 3/ (1 + f_tL3/ g);
L_i = L_m * f_tL3;
ELw_3 = (L_i - (L_i - L_b) * exp( - rT_B * tL_3(:,1)))/ del_M; % cm, length
%
% Length - Dry-weight at 12ºC
EWd_L = d_V * (LWd(:,1) * del_M).^3 * (1 + f * w); % g, dry weight (NZ)
%
% Length - Dry-weight at 16ºC
EWd_2 = d_V * (LWd_2(:,1) * del_M).^3 * (1 + f * w); % g, dry weight (Australia)
%
% Length - Wet-weight
EWw_L = (LWw(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
%
% Time - Dry-Weight
ome = 5;
EWd = (L_i - (L_i - L_b * del_M) * exp( - rT_B * tW(:,1))).^3 * d_V * (1 + f * ome); % g, dry weight

% Total number of eggs per batch
% EN = TC_LN * a * LN(:,1).^2 + k_M/v * LN(:,1).^3 - b;

% Lenght - eggs per female
% Dry weigth - #egg per female
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
DW = LN(:,1); % the data is dry weights
L  = (DW./(d_V * (1 + f * w) ) ).^(1/3); % Calclulating structural length from dry weights
ER = TC_LN * S_f * reprod_rate(L, f, pars_R); % #/d, ultimate reproduction rate at T

% Time - eggs
EN = cum_reprod(tN(:,1), f, pars_R);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Respiration - Temperature predictions at different light exposure  %%
%   treatments for a krill of avg. lenght og 1.21 cm                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%   DARK (negative control treatments) %%%%
% % DARK: HIGH-UV
L = (0.004/ d_V/ (1 + f * w))^(1/3); % cm, mean structural length
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix TO converts organic to mineral fluxes O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(L, f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assimilation
JO = pADG * eta_O';        % organic fluxes
JM = JO * O2M;             % mineral fluxes
EJO_HD = -1.6e6 * JM(:,3) .* TC_TJO_HD / 24;
%
% DARK: LOW-UV
L = (0.004/ d_V/ (1 + f * w))^(1/3); % cm, structural length
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix TO converts organic to mineral fluxes O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(L, f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assimilation
JO = pADG * eta_O';        % organic fluxes
JM = JO * O2M;             % mineral fluxes
EJO_LD = -1.6e6 * JM(:,3) .* TC_TJO_LD/ 24;
%
 
%%%%   PAR (Positive control treatments) %%%%
% % PAR: HIGH_UV
L = (0.003 / d_V/ (1 + f * w))^(1/3); % cm, structural length
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix TO converts organic to mineral fluxes O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(L, f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assimilation
JO = pADG * eta_O';        % organic fluxes
JM = JO * O2M;             % mineral fluxes
EJO_HP = -1.6e6 * JM(:,3) .* TC_TJO_HP * PAR_H / 24 ;
 
% PAR: LOW_UV
L = (0.003/ d_V/ (1 + f * w))^(1/3); % cm, structural length
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix TO converts organic to mineral fluxes O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(L, f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assimilation
JO = pADG * eta_O';        % organic fluxes
JM = JO * O2M;             % mineral fluxes
EJO_LP = -1.6e6 * JM(:,3) .* TC_TJO_LP * PAR_L / 24 ;
 
%%%%   UV (Experimental treatments) %%%%
% UV: HIGH DOSE
L = (0.003/ d_V/ (1 + f * w))^(1/3); % cm, structural length
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix TO converts organic to mineral fluxes O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(L, f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assimilation
JO = pADG * eta_O';        % organic fluxes (JO = food, struc.mass, reserves, feaces)
JM = JO * O2M;             % mineral fluxes (carbon dioxide, water, dioxygen, ammonia)
EJO_HUV = -1.6e6 * JM(:,3).* TC_TJO_HUV * UV_H/ 24 ;
 
% UV: LOW DOSE
L = (0.003/ d_V/ (1 + f * w))^(1/3); % cm, structural length
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix TO converts organic to mineral fluxes O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(L, f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assimilation
JO = pADG * eta_O';        % organic fluxes
JM = JO * O2M;             % mineral fluxes
EJO_LUV = -1.6e6 * JM(:,3) .* TC_TJO_LUV * UV_L / 24 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Prediction for changes in fatty acids and amino acids   %%%%%
%%%%%%%%%%%%          with temperature and light                     %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pars_DARK8 = [MC0_MUFA, JCM_MUFA,...
              MC0_PUFA, JCM_PUFA,...
              MC0_SAFA, JCM_SAFA,...
              MC0_UFA,  JCM_UFA,...
              MC0_EAA,  JCM_EAA,...
              MC0_NEAA, JCM_NEAA,...
              TC_8, 1, 1, 1, 1, 1, 1];
[EMUFA_8DARK,  EPUFA_8DARK,  ESAFA_8DARK, EUFA_8DARK, EEAA_8DARK, ENEAA_8DARK]  = lin_fa(pars_DARK8, tMUFA_DARK8,...
    tPUFA_DARK8, tSAFA_DARK8, tUFA_DARK8 ,tEAA_8DARK, tNEAA_8DARK);
%
pars_DARK12 = [MC0_MUFA, JCM_MUFA,...
               MC0_PUFA, JCM_PUFA,...
               MC0_SAFA, JCM_SAFA,...
               MC0_UFA,  JCM_UFA,...
               MC0_EAA,  JCM_EAA,...
               MC0_NEAA, JCM_NEAA,...
               TC_12, 1, 1, 1, 1, 1, 1];
[EMUFA_12DARK, EPUFA_12DARK, ESAFA_12DARK, EUFA_12DARK ,EEAA_12DARK, ENEAA_12DARK] = lin_fa(pars_DARK12,tMUFA_DARK12,...
    tPUFA_DARK12, tSAFA_DARK12, tUFA_DARK12, tEAA_12DARK, tNEAA_12DARK);
%
pars_DARK13 = [MC0_MUFA, JCM_MUFA,...
               MC0_PUFA, JCM_PUFA,...
               MC0_SAFA, JCM_SAFA,...
               MC0_UFA,  JCM_UFA,...
               MC0_EAA,  JCM_EAA,...
               MC0_NEAA, JCM_NEAA,...
               TC_13, 1, 1, 1, 1, 1, 1];
[EMUFA_13DARK, EPUFA_13DARK, ESAFA_13DARK, EUFA_13DARK, EEAA_13DARK, ENEAA_13DARK] = lin_fa(pars_DARK13,tMUFA_DARK13,...
    tPUFA_DARK13, tSAFA_DARK13,tUFA_DARK13, tEAA_13DARK, tNEAA_13DARK);
%
pars_DARK16 = [MC0_MUFA, JCM_MUFA,...
               MC0_PUFA, JCM_PUFA,...
               MC0_SAFA, JCM_SAFA,...
               MC0_UFA,  JCM_UFA,...
               MC0_EAA,  JCM_NEAA,...
               MC0_NEAA, JCM_NEAA,...
               TC_16, 1, 1, 1, 1, 1, 1];
[EMUFA_16DARK, EPUFA_16DARK, ESAFA_16DARK, EUFA_16DARK, EEAA_16DARK, ENEAA_16DARK] = lin_fa(pars_DARK16,tMUFA_DARK16,...
    tPUFA_DARK16, tSAFA_DARK16, tUFA_DARK16 ,tEAA_16DARK, tNEAA_16DARK);
%
pars_DARK19 = [MC0_MUFA, JCM_MUFA,...
               MC0_PUFA, JCM_PUFA,...
               MC0_SAFA, JCM_SAFA,...
               MC0_UFA,  JCM_UFA,...
               MC0_EAA,  JCM_EAA,...
               MC0_NEAA, MC0_NEAA...
               TC_19, 1, 1, 1, 1, 1, 1];
[EMUFA_19DARK, EPUFA_19DARK, ESAFA_19DARK, EUFA_19DARK, EEAA_19DARK, ENEAA_19DARK] = lin_fa(pars_DARK19,tMUFA_DARK19,...
    tPUFA_DARK19, tSAFA_DARK19, tUFA_DARK16,tEAA_19DARK, tNEAA_19DARK);

 
% pack to output
prdData.tL_1    = ELw_1;
prdData.tL_2    = ELw_2;
prdData.tL_3    = ELw_3;
prdData.LWd     = EWd_L;
prdData.LWd_2   = EWd_2;
prdData.LWw     = EWw_L;
prdData.tW      = EWd;
prdData.LN      = ER;
prdData.tN      = EN;
prdData.TJO_LD  = EJO_LD;
prdData.TJO_HD  = EJO_HD;
prdData.TJO_LP  = EJO_LP;
prdData.TJO_HP  = EJO_HP;
prdData.TJO_LUV = EJO_LUV;
prdData.TJO_HUV = EJO_HUV;

prdData.tMUFA_DARK8   = EMUFA_8DARK;
prdData.tPUFA_DARK8   = EPUFA_8DARK;
prdData.tSAFA_DARK8   = ESAFA_8DARK;
prdData.tUFA_DARK8    = EUFA_8DARK;

prdData.tMUFA_DARK12  = EMUFA_12DARK;
prdData.tPUFA_DARK12  = EPUFA_12DARK;
prdData.tSAFA_DARK12  = ESAFA_12DARK;
prdData.tUFA_DARK12   = EUFA_12DARK;

prdData.tMUFA_DARK13  = EMUFA_13DARK;
prdData.tPUFA_DARK13  = EPUFA_13DARK;
prdData.tSAFA_DARK13  = ESAFA_13DARK;
prdData.tUFA_DARK13   = EUFA_13DARK;

prdData.tMUFA_DARK16  = EMUFA_16DARK;
prdData.tPUFA_DARK16  = EPUFA_16DARK;
prdData.tSAFA_DARK16  = ESAFA_16DARK;
prdData.tUFA_DARK16   = EUFA_16DARK;

prdData.tMUFA_DARK19  = EMUFA_19DARK;
prdData.tPUFA_DARK19  = EPUFA_19DARK;
prdData.tSAFA_DARK19  = ESAFA_19DARK;
prdData.tUFA_DARK19   = EUFA_19DARK;

prdData.tEAA_8DARK   = EEAA_8DARK;
prdData.tNEAA_8DARK  = ENEAA_8DARK;
prdData.tEAA_12DARK  = EEAA_12DARK;
prdData.tNEAA_12DARK = ENEAA_12DARK;
prdData.tEAA_13DARK  = EEAA_13DARK;
prdData.tNEAA_13DARK = ENEAA_13DARK;
prdData.tEAA_16DARK  = EEAA_16DARK;
prdData.tNEAA_16DARK = ENEAA_16DARK;
prdData.tEAA_19DARK  = EEAA_19DARK;
prdData.tNEAA_19DARK = ENEAA_19DARK;
end



