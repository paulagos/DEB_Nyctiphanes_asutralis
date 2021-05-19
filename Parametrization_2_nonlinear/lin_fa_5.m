function [EM_1, EM_2, EM_3, EM_4, EM_5, EM_6] = lin_fa_5(p, tMUFA, tPUFA, tSAFA, tUFA, tEAA, tNEAA)
%% EM_1 = M_C0 - t * J_CM (eq.4.47)

% with:
% J_CM = (MC_E/M_E) * J_EM; rate of decrease of COMPOUNDS
% J_EM = p_M/ mu_E; rate of use of RESERVE for somatic maintenance
% MC0 = MCV + t * J_CM

MC01     = p(1);  % Inital amount of of MUFA (MC_0)
J_CM1    = p(2);  % rate of decrease of MUFA's in reserve
MC02     = p(3);  % Initial amount of PUFA (MC_0)
J_CM2    = p(4);  % rate of decrease of PUFA's in reserve
MC03     = p(5);  % Initial amount of SAFA (MC_0)
J_CM3    = p(6);  % rate of decrease of SAFA's in reserve
MC04     = p(7);   % Initial amount of UFA (MC_0)
J_CM4    = p(8);   % rate of decrease of UFA's in reserve
MC05     = p(9);  % Initial amount of EAA(MC_0)
J_CM5    = p(10);  % rate of decrease of EAA in reserve
MC06     = p(11);  % Initial amount of NEAA (MC_0)
J_CM6    = p(12); % rate of decrease of NEAA in reserve

TC       = p(13); % temperature correction factor

LAF_mufa = p(14); % light amplification factor for MUFA (light effect on compund ratios in reserve; compound specific metabolism and, for UV, physical breakage)
LAF_pufa = p(15); % light amplification factor for PUFA
LAF_safa = p(16); % light amplification factor for SAFA
LAF_ufa  = p(17); % light amplification factor for UFA
LAF_eaa  = p(18); % light amplification factor for EAA
LAF_neaa = p(19); % light amplification factor for NEAA
LAF_bio  = p(20); % the light factor affecting JEM (general metabolism)

p_M      = p(21);
mu_E     = p(22);

% if ( (length(tMUFA(:,1)) > 4))
%    keyboard
% end

% Separating time steps for dark first 24h and subsequent light treatmeant of 8h
t1 = tMUFA(tMUFA(:,1)<=1);
t2 = tMUFA(tMUFA(:,1)>=1)-1;

% Calculating J_E_M, the outflux in C-moles from reserve to somatic maintenance
J_E_M = p_M/ mu_E; % mol/d.cm^3, [J_EM], vol-spec somatic  maint costs

% Calculating the initial ratio of compound in reserve (ratio is constant with dark light conditions)
MCE_ME_MUFA = J_CM1 / J_E_M; % ratio of MUFA in reserve for dark treatment (and at start of experiment for light treatmenst)
MCE_ME_PUFA = J_CM2 / J_E_M; 
MCE_ME_SAFA = J_CM3 / J_E_M; 
MCE_ME_UFA  = J_CM4 / J_E_M;
MCE_ME_EAA  = J_CM5 / J_E_M; 
MCE_ME_NEAA = J_CM6 / J_E_M; 

% The equations for calculating ratio and amount of compound during light treatments
%
% MC(t)     = MC(t-1) - t * k(t)
% k(t)      = t * MCE/ME(t) * J_E_M * TC * LAF_bio
% MCE/ME(t) = MCE/ME(1) * e^( LAF_compound * t), where MCE/MC(t) is the ratio
% of compound during the dark treatment, i.e. JCM_compound/J_E_M


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate amount of compound over time for MUFA
%dark
EM_1a         = MC01 - J_CM1 * t1 * TC;  % M_C0 - t * J_CM (eq4.47 amount of compund at time), model for dark part
EM_1b(1)      = EM_1a(end) - t2(1) .* MCE_ME_MUFA .* J_E_M .* TC .* LAF_bio;

for i = 2:length(t2)
    EM_1b(i)  = EM_1b(i-1) - (t2(i)-t2(i-1)) .* MCE_ME_MUFA .* exp(-LAF_mufa*(t2(i-1)+((t2(i)-t2(i-1))/2))) .* J_E_M .* TC .* LAF_bio;    
end
EM_1b = EM_1b';
EM_1  = [EM_1a; EM_1b(2:end)];  % putting the dark and light part of the model prediction together

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate amount of compound over time for PUFA
EM_2a         = MC02 - J_CM2 * t1 * TC;
EM_2b(1)      = EM_2a(end) - t2(1) .* MCE_ME_PUFA .* J_E_M .* TC .* LAF_bio;

for i = 2:length(t2)
    EM_2b(i)  = EM_2b(i-1) - (t2(i)-t2(i-1)) .* MCE_ME_PUFA .* exp(-LAF_pufa*(t2(i-1)+((t2(i)-t2(i-1))/2))) .* J_E_M .* TC .* LAF_bio;
end
EM_2b = EM_2b';
EM_2          = [EM_2a; EM_2b(2:end)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate amount of compound over time for SAFA
EM_3a         = MC03 - J_CM3 * t1 * TC;
EM_3b         = EM_3a(end) - t2(1) .* MCE_ME_SAFA .* J_E_M .* TC .* LAF_bio; % amount of compound over time when there is light

for i = 2:length(t2)
    EM_3b(i)  = EM_3b(i-1) - (t2(i)-t2(i-1)) .* MCE_ME_SAFA .* exp(-LAF_safa*(t2(i-1)+((t2(i)-t2(i-1))/2))) .* J_E_M .* TC .* LAF_bio;
end
EM_3b = EM_3b';
EM_3          = [EM_3a; EM_3b(2:end)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate amount of compound over time for UFA
EM_4a         = MC04 - J_CM4 * t1 * TC;
EM_4b         = EM_4a(end) - t2(1) .* MCE_ME_UFA .* J_E_M * TC .* LAF_bio; % amount of compound over time when there is light

for i = 2:length(t2)
    EM_4b(i)  = EM_4b(i-1) - (t2(i)-t2(i-1)) .* MCE_ME_UFA .* exp(-LAF_ufa*(t2(i-1)+((t2(i)-t2(i-1))/2))) .* J_E_M .* TC .* LAF_bio;
end
EM_4b = EM_4b';
EM_4          = [EM_4a; EM_4b(2:end)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate amount of compound over time for EAA
EM_5a         = MC05 - J_CM5 * t1  * TC;
EM_5b         = EM_5a(end) - t2(1) .* MCE_ME_EAA .* J_E_M * TC .* LAF_bio; % amount of compound over time when there is light

for i = 2:length(t2)
    EM_5b(i)  = EM_5b(i-1) - (t2(i)-t2(i-1)) .* MCE_ME_EAA .* exp(-LAF_eaa*(t2(i-1)+((t2(i)-t2(i-1))/2))) .* J_E_M .* TC .* LAF_bio;
end
EM_5b = EM_5b';
EM_5          = [EM_5a; EM_5b(2:end)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate amount of compound over time for NEAA
EM_6a         = MC06 - J_CM6 * t1 * TC;
EM_6b         = EM_6a(end) - t2(1) .* MCE_ME_NEAA .* J_E_M .* TC .* LAF_bio; % amount of compound over time when there is light

for i = 2:length(t2)
    EM_6b(i)  = EM_6b(i-1) - (t2(i)-t2(i-1)) .* MCE_ME_NEAA .* exp(-LAF_neaa*(t2(i-1)+((t2(i)-t2(i-1))/2))) .* J_E_M .* TC .* LAF_bio;
end
EM_6b = EM_6b';
EM_6          = [EM_6a; EM_6b(2:end)];


if ( (length(tMUFA(:,1)) > 4))
    EM_1  = [EM_1a; EM_1b];
    EM_2  = [EM_2a; EM_2b];
    EM_3  = [EM_3a; EM_3b];
    EM_4  = [EM_4a; EM_4b];
    EM_5  = [EM_5a; EM_5b];
    EM_6  = [EM_6a; EM_6b];    
end