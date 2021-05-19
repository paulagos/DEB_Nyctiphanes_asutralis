function [EM_1, EM_2, EM_3, EM_4, EM_5, EM_6] = lin_fa(p, tMUFA, tPUFA, tSAFA, tUFA ,tEAA, tNEAA)
%% EM_1 = M_C0 - t * J_CM (eq.4.47)

% with:
% J_CM = (MC_E/M_E) * J_EM;    
% J_EM = p_M/ mu_E; rate of use of reserve for somatic maintenance
% MC0 = MCV + t * J_CM  


  
MC01     = p(1); % Inital amount of of MUFA (MC_0)
J_CM1    = p(2); % rate of decrease of MUFA's in reserve 
MC02     = p(3); % Initial amount of PUFA (MC_0)
J_CM2    = p(4); % rate of decrease of PUFA's in reserve 
MC03     = p(5); % Initial amount of SAFA (MC_0)
J_CM3    = p(6); % rate of decrease of SAFA's in reserve 
MC04     = p(7); % Initial amount of UFA (MC_0)
J_CM4    = p(8); % rate of decrease of UFA in reserve 
MC05     = p(9);  % Initial amount of EAA(MC_0)
J_CM5    = p(10);  % rate of decrease of EAA in reserve 
MC06     = p(11); % Initial amount of NEAA (MC_0)
J_CM6    = p(12); % rate of decrease of NEAA in reserve 

TC       = p(13);  % temperature correction factor 

LAF_mufa = p(14);  % light amplification factor for MUFA
LAF_pufa = p(15);  % light amplification factor for PUFA
LAF_safa = p(16);  % light amplification factor for SAFA
LAF_ufa  = p(17);  % light amplification factor for UFA
LAF_EAA  = p(18);  % light amplification factor for EAA
LAF_NEAA = p(19);  % light amplification factor for NEAA

  EM_1 = MC01 - J_CM1 * tMUFA(:,1) * TC * LAF_mufa; % M_C0 - t * J_CM (eq4.47 amount of compund at time)
  EM_2 = MC02 - J_CM2 * tPUFA(:,1) * TC * LAF_pufa;
  EM_3 = MC03 - J_CM3 * tSAFA(:,1) * TC * LAF_safa;
  EM_4 = MC04 - J_CM4 * tUFA(:,1)  * TC * LAF_ufa;
  EM_5 = MC05 - J_CM5 * tEAA(:,1)  * TC * LAF_EAA;
  EM_6 = MC06 - J_CM6 * tNEAA(:,1) * TC * LAF_NEAA;

  
  
 
 